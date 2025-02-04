
local TRIGGER = script:GetCustomProperty("Trigger"):WaitForObject()
local COLLIDER = script:GetCustomProperty("Collider"):WaitForObject()
local QUEST_ID = script:GetCustomProperty("QuestId")

local OPEN_DELAY = 4

local isOpen = false

function Open()
	if isOpen then return end
	isOpen = true
	
	Task.Wait(OPEN_DELAY)
	print("removing collision")
	COLLIDER.collision = Collision.FORCE_OFF
end



TRIGGER.beginOverlapEvent:Connect(function(trigger, player)
	if isOpen then return end
	if not player:IsA("Player") then return end
	
	Task.Wait()
	if not Object.IsValid(player) then return end
	
		-- Check if the player has access

		--local hasKey = _G.QuestController.HasCompleted(player, "QUEST_ID")
		--print(hasKey)
		--if not hasKey then
			--Events.BroadcastToPlayer(player, "CraftingRoom.LockedMessage")
			--return
		--end	
		if not isOpen then
			Open()
		end
end)



--Events.Connect("OpenGate", Open)