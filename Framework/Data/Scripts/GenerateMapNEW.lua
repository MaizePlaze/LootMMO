
local MAP_BUILDER = require(script:GetCustomProperty("MapBuilder"))
local TILES = require(script:GetCustomProperty("Tiles"))
local CryptsAndCaverns = require(script:GetCustomProperty("CryptsAndCaverns"))
local TOKEN_ID = script:GetCustomProperty("TokenID")


local STATIC_CONTAINER = script.parent
local MAP_WIDTH = 10
local MAP_HEIGHT = 10
local TILE_SIZE = 1000

--[[
Map Builder Properties
Property	Description
width		The width of the map being created. This should match the width of the ASCII string.
height		The height of the map being created. This should match the height of the ASCII string.
size		The size of the tiles.
map			The ASCII string the map will be built from.
container	The static context the assets will be spawned into using SpawnSharedAsset.]]
-----------------------------------------------------------------------------------------------
--[[
MAP_BUILDER.Build({

	container = script.parent,
	width = 10,
	height = 10,
	size = 1000,

	map = [[

		1111111111
		11E0001100
		10011E01E1
		1111101101
		110E000EE1
		1E01111001
		1011001E01
		1S11101011
		1010E00011
		1111111111

	]]

--})


--Build
--Calls load function for NFT map
--Load function returns ASCII string and total rows and cols
--"8002"
----------------------------------------------------------------------------------------------------
local ascii, rows, cols = CryptsAndCaverns.Load(TOKEN_ID)

MAP_BUILDER.Build({

	container = script.parent,
	width = cols,
	height = rows,
	size = 800,
	map = ascii

})