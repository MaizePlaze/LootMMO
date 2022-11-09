
local EVENT_ID = "LevelComplete"

function OnResourceChanged(player, resName, newValue)
	if resName == "Diamonds" 
	and newValue > player.serverUserData.joinDiamondCount
	then
		
		Events.Broadcast(EVENT_ID)
		Events.BroadcastToAllPlayers(EVENT_ID)
		print("Level Complete")
	end
end

Game.playerJoinedEvent:Connect(function(player)
	Task.Wait(0.2)
	if not Object.IsValid(player) then return end
	
	player.resourceChangedEvent:Connect(OnResourceChanged)
	
	player.serverUserData.joinDiamondCount = player:GetResource("Diamonds")
end)