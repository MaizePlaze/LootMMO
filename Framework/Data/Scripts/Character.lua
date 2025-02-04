local CC_Util = _G.CC_Util
local LUAEVENT = CC_Util:WaitForlibrary('Lua Event')
local COMPONENT_REGISTRY = _G['Character.Components']
function TriggerEvent(event, ...)
	if event then
		event:Trigger(...)
	end
end

local tableElements = {
	'components'
}
local eventElements = {
	'setOwnerEvent',
	'removeOwnerEvent',
	'dataloadedEvent',
	'destroyedEvent'
}
local character = {
	owner = nil,
	name = 'Default',
	id = 1,
	autoSave = false,
	lastPlayed = DateTime.FromSecondsSinceEpoch(1)
}
function character:AddComponent(componentName)
	if self:GetComponent(componentName) then
		warn('Component has already been assigned')
		return
	end
	local newComponent = COMPONENT_REGISTRY.NewComponent(componentName)
	if not newComponent then
		warn('Component not found')
		return
	end
	newComponent:AddParent(self)
	table.insert(self:GetComponents(), newComponent)
	return newComponent
end

function character:RemoveComponent(componentName)
	for index, component in ipairs(self.components) do
		if component.id == componentName then
			table.remove(self.components, index)
		end
	end
end

function character:GetComponent(componentName)
	for index, component in ipairs(self.components) do
		if component.id == componentName then
			return component
		end
	end
end

function character:GetComponents()
	return self.components
end

function character:SetOwner(newOwner)
	if self.owner == newOwner then
		return
	end
	self:RemoveOwner()
	self.owner = newOwner
	TriggerEvent(self.setOwnerEvent, self, self.owner)
end

function character:GetOwner()
	return self.owner
end

function character:RemoveOwner()
	if not self.owner then
		return
	end
	local oldOwner = self.owner
	self.owner = nil
	TriggerEvent(self.removeOwnerEvent, self, oldOwner)
end

function character:IsA(testType)
	return testType == 'Character' or testType == 'character'
end

function character:Serialize()
	local data = {}
	data.id = self.id
	data.name = self.name
	data.class = self.class
	data.lastPlayed = self.lastPlayed:ToIsoString()
	data.components = {}
	for index, component in ipairs(self:GetComponents()) do
		local componentData = component:Serialize()
		local ComponentWrapper = { data = componentData, id = component.id }
		table.insert(data.components, ComponentWrapper)
	end
	return data
end

function character:Deserialize(data)
	self.id = data.id
	self.name = data.name
	self.class = data.class
	if data.lastPlayed then
		self.lastPlayed = DateTime.FromIsoString(data.lastPlayed)
	end
	for index, value in ipairs(data.components or {}) do
		local component = self:GetComponent(value.id)
		if component then
			component:Deserialize(value.data)
		end
	end
	TriggerEvent(self.dataloadedEvent, self)
end

function character:Destroy()
	self:RemoveOwner()
	for index, component in ipairs(self:GetComponents()) do
		if component then
			component:Destroy()
		end
	end

	TriggerEvent(self.destroyEvent, self)
end

function InitCharacter(NewCharacter)
	local stats = NewCharacter:GetComponent('Stats')
	stats:SetStat('H', 100)
	local level = NewCharacter:GetComponent('Level')
	level.levelUpEvent:Connect(
		function(_, value)
			stats:SetStat('Level', value)
		end
	)
end

local constructor = {}
constructor.newCharacterCreated = LUAEVENT.New()
constructor.newCharacterFinished = LUAEVENT.NewSafeEvent()

function constructor.NewCharacter()
	local NewCharacter = setmetatable({}, { __index = character })
	for key, value in pairs(eventElements or {}) do
		NewCharacter[value] = LUAEVENT.NewSafeEvent()
	end
	for key, value in pairs(tableElements or {}) do
		NewCharacter[value] = {}
	end
	NewCharacter.id = math.random(2 ^ 31)
	constructor.newCharacterCreated:Trigger(NewCharacter)

	NewCharacter:AddComponent('Stats')
	NewCharacter:AddComponent('Level')
	NewCharacter:AddComponent('Progression')
	NewCharacter:AddComponent('Class')
	NewCharacter:AddComponent('Points')
	NewCharacter:AddComponent('Inventory')
	NewCharacter:AddComponent('Potions')
	constructor.newCharacterFinished:Trigger(NewCharacter)
	InitCharacter(NewCharacter)

	return NewCharacter
end

function constructor.NewMicroCharacter()
	local NewCharacter = setmetatable({}, { __index = character })
	NewCharacter.id = math.random(2 ^ 31)
	for key, value in pairs(tableElements or {}) do
		NewCharacter[value] = {}
	end
	NewCharacter:AddComponent('Level')
	return NewCharacter
end

_G['Character.Constructor'] = constructor
return constructor
