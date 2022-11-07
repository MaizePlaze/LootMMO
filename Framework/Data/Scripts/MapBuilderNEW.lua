local ASCIIParser = require(script:GetCustomProperty("ASCIIParser"))
local TILES = require(script:GetCustomProperty("Tiles"))
local ENEMIES = require(script:GetCustomProperty("Enemies"))
local DECOR = require(script:GetCustomProperty("Decor"))


local MapBuilder = {
--add ENUM table named Type
	Type = {}

}

-- ENUM Constants
-- lookup types in tiles table to create ENUMs
for key, row in pairs(TILES) do
	MapBuilder.Type[row.key] = row.id
end

--Build
--Responsible for forwarding on options to other functions in the API
--Responsible for spawning the map based on the table generated from the ASCIIParser script.
--------------------------------------------------------------------------------------------------
function MapBuilder.Build(opts)
	local map, mapStr = ASCIIParser.BuildMap(opts.map, opts.width, opts.height)

	print(mapStr)
	MapBuilder.Spawn(map, opts.width, opts.height, opts.size, opts.container)
end

--GetTile
--Recieves the map, checks rows and columns
--Returns row[col] of tile
--------------------------------------------------------------------------------------------------
function MapBuilder.GetTile(map, row, col)
	local foundRow = map[row]

	if foundRow then
		return foundRow[col]
	end

	return nil
end

--GetNeighbors
--Calls GetTile and finds its neighbors
--Checks by adding and/or subtracting 1 from the "center" tile position
--------------------------------------------------------------------------------------------------
function MapBuilder.GetNeighbors(map, row, column)
	return {

		NORTH = MapBuilder.GetTile(map, row - 1, column),
		SOUTH = MapBuilder.GetTile(map, row + 1, column),
		EAST = MapBuilder.GetTile(map, row, column + 1),
		WEST = MapBuilder.GetTile(map, row, column - 1)

	}
end

--CheckForWallCorner
--Looks for 3 tile corner patterns by checking cardinal directions
--Checks if the neighbors of a given tile match the corner pattern
--Returns the tileRow, rotation (90 deg) of corner and extra tiles
--------------------------------------------------------------------------------------------------
function MapBuilder.CheckForWallCorner(map, neighbors, row, col)
	local tileRow = nil
    local extraTile = nil
	local rotation = Rotation.New()
    --check if walls are west & north & current tile is not a wall & east is not nil & south is not nil
	if neighbors.WEST == MapBuilder.Type.Wall and neighbors.NORTH == MapBuilder.Type.Wall and map[row][col] ~= MapBuilder.Type.Wall and neighbors.EAST ~= nil and neighbors.SOUTH ~= nil then
		tileRow = TILES[MapBuilder.Type.WallCorner] --its a NORTHWEST corner
		rotation.z = 0 --wall corner template is northwest by default so no rotate

	elseif neighbors.NORTH == MapBuilder.Type.Wall and neighbors.EAST == MapBuilder.Type.Wall and map[row][col] ~= MapBuilder.Type.Wall and neighbors.WEST ~= nil and neighbors.SOUTH ~= nil then
	 	tileRow = TILES[MapBuilder.Type.WallCorner] -- its a NORTHEAST corner
	 	rotation.z = 90

	elseif neighbors.EAST == MapBuilder.Type.Wall and neighbors.SOUTH == MapBuilder.Type.Wall and map[row][col] ~= MapBuilder.Type.Wall and neighbors.NORTH ~= nil and neighbors.WEST ~= nil then
		tileRow = TILES[MapBuilder.Type.WallCorner] --its a SOUTHEAST corner
		rotation.z = 180

	elseif neighbors.SOUTH == MapBuilder.Type.Wall and neighbors.WEST == MapBuilder.Type.Wall and map[row][col] ~= MapBuilder.Type.Wall and neighbors.EAST ~= nil and neighbors.NORTH ~= nil  then
		tileRow = TILES[MapBuilder.Type.WallCorner] --its a SOUTHWEST corner
		rotation.z = 270

	else
		local randZrot = math.random(1,4)
		if randZrot == 1 then
			rotation.z = 0
			else if randZrot == 2 then
				--rotation = Rotation.New(0, 0, 90)
				rotation.z = 90
			elseif randZrot == 3 then
				--rotation = Rotation.New(0, 0, 180)
				rotation.z = 180
			elseif randZrot == 4 then
				--rotation = Rotation.New(0, 0, -90)
				rotation.z = -90
			end
		end
	end

	if tileRow ~= nil then
		extraTile = TILES[MapBuilder.Type.Floor]
	end

	return tileRow, rotation, extraTile
end

--CheckForDeadEnd
--Looks for 3 tile corner patterns by checking cardinal directions
--Checks if the neighbors of a given tile match the corner pattern
--Returns the tileRow, rotation (45 deg) of corner and extra tiles
--------------------------------------------------------------------------------------------------
function MapBuilder.CheckForDeadEnd(map, neighbors, row, col)
	local tileRow = nil
	local extraTile = nil
	local rotation = Rotation.New()

	if(neighbors.WEST == MapBuilder.Type.Wall and neighbors.NORTH == MapBuilder.Type.Wall and neighbors.EAST == MapBuilder.Type.Wall and neighbors.SOUTH ~= MapBuilder.Type.Wall and map[row][col] ~= MapBuilder.Type.Wall) then
		tileRow = TILES[MapBuilder.Type.WallCorner]
		rotation.z = 45
	elseif(neighbors.NORTH == MapBuilder.Type.Wall and neighbors.EAST == MapBuilder.Type.Wall and neighbors.SOUTH == MapBuilder.Type.Wall and neighbors.WEST ~= MapBuilder.Type.Wall and map[row][col] ~= MapBuilder.Type.Wall) then
		tileRow = TILES[MapBuilder.Type.WallCorner]
		rotation.z = 135
	elseif(neighbors.EAST == MapBuilder.Type.Wall and neighbors.SOUTH == MapBuilder.Type.Wall and neighbors.WEST == MapBuilder.Type.Wall and neighbors.NORTH ~= MapBuilder.Type.Wall and map[row][col] ~= MapBuilder.Type.Wall) then
		tileRow = TILES[MapBuilder.Type.WallCorner]
		rotation.z = -135
	elseif(neighbors.SOUTH == MapBuilder.Type.Wall and neighbors.WEST == MapBuilder.Type.Wall and neighbors.NORTH == MapBuilder.Type.Wall and neighbors.EAST ~= MapBuilder.Type.Wall and map[row][col] ~= MapBuilder.Type.Wall) then
		tileRow = TILES[MapBuilder.Type.WallCorner]
		rotation.z = -45

	end

	if tileRow ~= nil then
		extraTile = TILES[MapBuilder.Type.Floor]
	end

	return tileRow, rotation, extraTile
end

--SpawnExtraTile
--Handles cases where additional tile needs to be spawned
--Receives the extra tile, the params table from Spawn function, container is the static context group the tiles spawn under
----------------------------------------------------------------------------------------------------
function MapBuilder.SpawnExtraTile(extraTile, params, container)
	if extraTile == nil then
		return
	end

	if MapBuilder.Type.Floor == extraTile.id then
		params.scale.z = 1
		params.rotation = Rotation.New()
	end

	container:SpawnSharedAsset(extraTile.tile, params)
end

--SpawnRoof
--Spawn roof tile to cover top of maze
--Set scale is set by maze dimensions
--Roof position z adjusted to fit wall template
----------------------------------------------------------------------------------------------------
function MapBuilder.SpawnRoof(width, height, size, container)
	container:SpawnSharedAsset(TILES[MapBuilder.Type.Roof].tile, {
	
		scale = Vector3.New(size / 100 * height, size / 100 * width, 1),
		position = Vector3.New(-size / 2, size / 2, size - 40)
	
	})
end

--SpawnPlayers
--Checks if the spawn point is valid and then broadcasts to the PlayerServer script
--Spawns players with rotation from the Tiles table
----------------------------------------------------------------------------------------------------
function MapBuilder.SpawnPlayers(spawnPoint)
	if spawnPoint == nil or not Environment.IsServer() then
		print("Spawn Point ", spawnPoint)
		return
	end

	Task.Wait()

	Events.Broadcast("SpawnPlayers", spawnPoint, TILES[MapBuilder.Type.Spawn].rotation)
end


--SpawnEnemies
--Receives table with spawn points
--Randomly selects enemy from enemies table for each spawn point
--Spawn position is same location as tile with small UP added
----------------------------------------------------------------------------------------------------
function MapBuilder.SpawnEnemies(spawnPoints)

	local ENEMY_IDS = {
		"Raptor",
		"Dragon",
		"Spider",
		"Skeleton4"
	}

	for index, point in ipairs(spawnPoints) do
		--local enemyAsset = ENEMIES[math.random(#ENEMIES)].asset

		local enemyId = ENEMY_IDS[math.random(#ENEMY_IDS)]
		local enemyAsset = ENEMIES[enemyId].commonTemplate


		local randZ = math.random(50, 50)
		local enemy = World.SpawnAsset(enemyAsset, {
			position = point + (Vector3.UP * randZ),
			--position = point + (Vector3.UP * 50),
			networkContext = NetworkContextType.NETWORKED,
			rotation = Rotation.New(0, 0, math.random(0, 360))
		
		})
	end
end

--SpawnDecor
--Receives table with spawn points
--Randomly selects decor from decor table for each spawn point
--Spawn position is same location as tile with small UP added
----------------------------------------------------------------------------------------------------
function MapBuilder.SpawnDecor(spawnPoints, container, size)
	for index, point in ipairs(spawnPoints) do
				
		local decorAsset = DECOR[math.random(#DECOR)].asset
		--print(decorAsset)
		container:SpawnSharedAsset(decorAsset, {
			position = point + (Vector3.UP * 50),
			scale = Vector3.New(1.25, 1.25, 1.25),
			rotation = Rotation.New(0, 0, math.random(0, 360))
		})

	end
end

--GenerateNavMesh
--Sets scale and position in global table
--The nav mesh gen will look for these values
--Connect event sets dynamic properties on Generate Map script
--v is between 0 and 1
----------------------------------------------------------------------------------------------------
function MapBuilder.GenerateNavMesh(width, height, size, container)
	_G.NavMeshArea = {

		scale = Vector3.New(size / 100 * height, size / 100 * width, size / 100),
		position = Vector3.New(-size / 2, size / 2, size / 2)

	}

	Events.Connect("NavMeshProgress", function(v, isGrid)
		print("Nav Mesh Progress:", v)
		if isGrid then
			container:SetCustomProperty("grid", v)
		else
			container:SetCustomProperty("grid", 1)
			container:SetCustomProperty("mesh", v)
		end
	end)
end

--SpawnPlayersAndEnemies
--Receives player spawn point and table of enemy spawn points
--Connects to NavMeshGenerated event called after mesh is generated
--Updates custom property to 1, which is done
--This event spawns the player and enemies
----------------------------------------------------------------------------------------------------
function MapBuilder.SpawnPlayersAndEnemies(spawnPoint, enemySpawnPoints, container)
	Events.Connect("NavMeshGenerated", function()
		print("Nav mesh generated")
		container:SetCustomProperty("mesh", 1)
		MapBuilder.SpawnEnemies(enemySpawnPoints)
		MapBuilder.SpawnPlayers(spawnPoint)
	end)
end

--Spawn
--Responsible for spawning the tiles for the map built by the ASCIIParser in the Build function.
--Checks for dead ends, then corners, then spawns map tiles
--Spawns player and enemies after map is generated
----------------------------------------------------------------------------------------------------
function MapBuilder.Spawn(map, width, height, size, container)
	if not Environment.IsServer() then
		return
	end

	local spawnPoint = nil
	local enemySpawnPoints = {}
	local decorSpawnPoints = {}

	for row = 1, height do
		for col = 1, width do
			local tileRow, rotation, extraTile
			local neighbors = MapBuilder.GetNeighbors(map, row, col)


			tileRow, rotation, extraTile = MapBuilder.CheckForDeadEnd(map, neighbors, row, col)
			
			if tileRow == nil then
				tileRow, rotation, extraTile = MapBuilder.CheckForWallCorner(map, neighbors, row, col)
			end

			if tileRow == nil then
				tileRow = TILES[map[row][col]] --find a tile that matches the value inside the map table
			end

			if tileRow ~= nil then
			local scale = Vector3.New(size / 100, size / 100, size / 100)

				--if tileRow.key == "Portal" then
				--	scale = Vector3.New(1, 1, 1)
				--end
				

                --check if "floor" is true in the map table, set this tile to be shorter than the others
				if tileRow.floor then
					scale.z = 1
				end

                --space tiles based on map position and offest so the center is closer to world origin
				local x = -(row * size) + (height * size) / 2
				local y = (col * size) - (width * size) / 2

				local params = {

					scale = scale,
					position = Vector3.New(x, y, 0),
					rotation = rotation

				}

                --Spawn in to the static context for the server and the client.
                --SharedAssest ensures players that join late also receive the spawned assets.
				if tileRow.tile ~= nil and tileRow.key ~= "Portal" then
					container:SpawnSharedAsset(tileRow.tile, params)
				end

                --Check if current tile is spawn point and use its position from the params table
				if map[row][col] == MapBuilder.Type.Spawn then
					spawnPoint = params.position

					if extraTile == nil then
						extraTile = TILES[MapBuilder.Type.Floor]
					end

                --Check if tile is Enemy and use its position
				elseif map[row][col] == MapBuilder.Type.Enemy then
					table.insert(enemySpawnPoints, params.position)

                    --Spawn floor under Enemy if extra tile is nil
					if extraTile == nil then
						extraTile = TILES[MapBuilder.Type.Floor]
					end
				--Check if tile is Decor and use its position
				elseif map[row][col] == MapBuilder.Type.Decor then
					table.insert(decorSpawnPoints, params.position)

                    --Spawn floor under Decor if extra tile is nil
					if extraTile == nil then
						extraTile = TILES[MapBuilder.Type.Floor]
					end
				elseif map[row][col] == MapBuilder.Type.Portal then
					if(Environment.IsServer()) then
						local exit = World.SpawnAsset(tileRow.tile, {
							scale = Vector3.New(1, 1, 1),
							position = params.position,
							networkContext = NetworkContextType.NETWORKED
						})
					end

					--Spawn floor under Portal if extra tile is nil
				 	if extraTile == nil then
						extraTile = TILES[MapBuilder.Type.Floor]
					end

				end

				if extraTile ~= nil then
					MapBuilder.SpawnExtraTile(extraTile, params, container)
				end
			end
		end
	end

	MapBuilder.SpawnDecor(decorSpawnPoints, container, size)
	MapBuilder.SpawnPlayersAndEnemies(spawnPoint, enemySpawnPoints, container)
	MapBuilder.GenerateNavMesh(width, height, size, container)
	MapBuilder.SpawnRoof(width, height, size, container)
end

return MapBuilder