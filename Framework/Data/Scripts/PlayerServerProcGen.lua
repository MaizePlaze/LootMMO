local spawnPointPosition = nil
local spawnPointRotation = nil

--OnPlayerDied
--Respawns player if killed
----------------------------------------------------------------------------------------------------
local function OnPlayerDied(player)
	Task.Wait(1)
	
	player:Spawn({
	
		position = spawnPointPosition,
		rotation = spawnPointRotation

	})
end

--OnPlayerJoined
--Spawns player with position and rotation
--Fires event that hides UI loading screen
--Listen for diedEvent and calls OnPlayerDied
----------------------------------------------------------------------------------------------------
local function OnPlayerJoined(player)
	Task.Wait(1)
	if spawnPointPosition ~= nil then
		player:SetWorldPosition(spawnPointPosition)
		player:SetWorldRotation(spawnPointRotation)

		print("server broadcast to player on joined HideUI")
		Events.BroadcastToPlayer(player, "HideUI")
	else
		player:Despawn()
	end

	player.diedEvent:Connect(OnPlayerDied)
end

--SpawnPlayers
--Setup spawn points by adding UP value to spawn above floor
--Fires event that hides UI loading screen
--Spawns all players with position and rotation
----------------------------------------------------------------------------------------------------
local function SpawnPlayers(position, rotation)
	print(position)
    spawnPointPosition = position + (Vector3.UP * 150)

	Task.Wait(1)
	Events.BroadcastToAllPlayers("HideUI")
	print("server broadcast to all players HideUI")

	spawnPointRotation = rotation

	local allPlayers = Game.GetPlayers()
  
	for _, player in ipairs(allPlayers) do

		player:Spawn({

			position = position + (Vector3.UP * 300),
			rotation = rotation

		})
	end
end

Events.Connect("SpawnPlayers", SpawnPlayers)
Game.playerJoinedEvent:Connect(OnPlayerJoined)