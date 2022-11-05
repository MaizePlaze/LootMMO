
-- Custom 
local UICONTAINER = script:GetCustomProperty("UIContainer"):WaitForObject()
local GENERATED_MAP = script:GetCustomProperty("GeneratedMap"):WaitForObject()
local PROGRESS = script:GetCustomProperty("Progress"):WaitForObject()
local MUSIC = script:GetCustomProperty("Music"):WaitForObject()

--Hide UI
--Plays level music
--Turns the visibility of the UI Contaner off
----------------------------------------------------------------------------------------------------
local function HideUI()
	print("In the HIdeUI function")
    MUSIC:Play()
	UICONTAINER.visibility = Visibility.FORCE_OFF
	print("Hidden UI")
end

--Update Progress
--Updates text box with nav mesh progress
--Progress value updates when custom properties change
--Because there are 2 properties, the first one for the grid needs to be divided by 2 so it contributes 50% to the progress. 
--When the mesh is in progress, you can divide the val by 2 and add 50 to give you the total progress between 0 and 100%.
----------------------------------------------------------------------------------------------------
local function UpdateProgress(obj, prop)
	if prop == "grid" then
		local val = GENERATED_MAP:GetCustomProperty("grid")

		if val > 0 then
			PROGRESS.text = string.format("%.2f%%", (GENERATED_MAP:GetCustomProperty("grid") / 2) * 100)
		end
	elseif prop == "mesh" then
		local val = GENERATED_MAP:GetCustomProperty("mesh")

		if val > 0 then
			PROGRESS.text = string.format("%.2f%%", 50 + (val / 2) * 100)
		end
	end
end

--Listens for change and calls function
GENERATED_MAP.customPropertyChangedEvent:Connect(UpdateProgress)

--Calls functions in case player joins after nav mesh is generated or event does not fire
UpdateProgress(GENERATED_MAP, "grid")
UpdateProgress(GENERATED_MAP, "mesh")

--Listens for server to broadcast when maze gen is complete
print("Broadcast from client HidingUI")
Events.Connect("HideUI", HideUI)