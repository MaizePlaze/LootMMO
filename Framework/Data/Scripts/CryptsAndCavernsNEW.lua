
-- Custom 
local BASE64 = require(script:GetCustomProperty("Base64"))
local JSON = require(script:GetCustomProperty("JSON"))
local SVG_PARSER = require(script:GetCustomProperty("SVGParser"))


--Setup table with properties
local CryptsAndCaverns = {

	SMART_CONTRACT_ADDRESS = "0x86f7692569914b5060ef39aab99e62ec96a6ed45",
	COLLECTION_COUNT = 8784

}

--Load
--Recieves a token ID or chooses random ID
--Calls libraries to decode and convert NFT data
----------------------------------------------------------------------------------------------------
function CryptsAndCaverns.Load(tokenId, enviro)
	local attribute = nil
	local attributeValue = nil
	--Gets contract address and token ID - ensure token is String format
	local token, success, msg = Blockchain.GetToken(CryptsAndCaverns.SMART_CONTRACT_ADDRESS, tostring(tokenId or math.random(CryptsAndCaverns.COLLECTION_COUNT)))

	if enviro == nil then
		enviro = "Crypt"
	else
		attribute = token:GetAttribute("environment")
		attributeValue = attribute:GetValue()
		print("Token Attribute: ", attributeValue)

		--Match Environment Type Attribute
		local isMatch = false
		
		while isMatch == false do
			
			if attributeValue == enviro then
				isMatch = true
				print("Matched Environment")
			else
				print("No Match")
				token, success, msg = Blockchain.GetToken(CryptsAndCaverns.SMART_CONTRACT_ADDRESS, tostring(math.random(CryptsAndCaverns.COLLECTION_COUNT)))
				attribute = token:GetAttribute("environment")
				attributeValue = attribute:GetValue()
				print("Token Attribute: ", attributeValue)
			end	
		end
	end


	Task.Wait()
    --decode raw metadata from token
	if(success == BlockchainTokenResultCode.SUCCESS) then
		print("Token ID: ", token.name)
		local metadata = token.rawMetadata

        --split raw metadat to extract Base64 encoded string
		local _, base64String = CoreString.Split(metadata, ",")

        --decode Base64 string
		local decodedBase64String = BASE64.decode(base64String)

		Task.Wait()
        --Decode JSON data from decoded Base64 string
		local objMetadata = JSON.decode(decodedBase64String)

		
        --Split string to extract encoded SVG data
		local _, SVGBase64String = CoreString.Split(objMetadata.image, ",")

		
        --decode Base64 SVG data
		local rawSVG = BASE64.decode(SVGBase64String)
		Task.Wait()
        --convert raw svg data to compatible format
		local parser = SVG_PARSER:New(rawSVG)

		local mapData = parser:GetMap()
		local rows = parser:GetRows()
		local cols = parser:GetCols()

        --converts map to ASCII format
		local convertedMapData = CryptsAndCaverns.ConvertData(mapData, rows, cols)

		local convertedASCII = CryptsAndCaverns.GetConvertedASCII(convertedMapData)

		return convertedASCII, rows, cols
	else
		warn("Could not load token.", msg)
	end

	return "", 0, 0
end

--ConvertData
--Receives map data from the SVG Parser
--Validates data and checks for walls
--Adds random enemies and spawn points to the map
----------------------------------------------------------------------------------------------------
function CryptsAndCaverns.ConvertData(mapData, cols, rows)

-- Convert for map builder format
local emptyId = "-"
local wallString = nil
local minX = 99999
local maxX = -1
local minY = 99999
local maxY = -1

for row = 1, #mapData do
	for col = 1, #mapData[row] do
		local entry = mapData[row][col]
		if entry ~= "-" then
		    if not wallString then
				wallString = entry
			end
			
			if maxY < row then
				maxY = row
			end
			if minY > row then
				minY = row
			end
			if maxX < col then
				maxX = col
			end
			if minX > col then
				minX = col
			end
	
		end
	end
end

local width = maxX - minX + 1
local height = maxY - minY + 1


-----------------------------------

	local convertedData = {}
	local hasSpawn = false
	local hasExit = false

--[[
	for row = 1, #mapData do
		for col = 1, #mapData[row] do
			if  mapData[row][col] ~= "-" and not wallString then
				wallString = mapData[row][col]
				break
			end
		end
	end
]]
	local allZeroTiles = {}

	for row = 1, rows do
		table.insert(convertedData, {})

		for col = 1, cols do
			local entry = mapData[row][col]
				
			if entry == wallString then
				convertedData[row][col] = "1"
			else
				local spawnEnemy = math.random(1, 100)

				if spawnEnemy <= 10 then
					convertedData[row][col] = "E"
				else
					
					local spawnDecor = math.random(1, 100)

					if spawnDecor <= 30 then
						convertedData[row][col] = "C"
					else
						local value = "0"
					
						if(not hasSpawn) then
							local isSpawn = math.random(30)

							if(isSpawn == 1) then
								value = "S"
								hasSpawn = true
							end
						end

						if(not hasExit) then
							local isExit = math.random(30)

							if(isExit == 1) then
								value = "P"
								hasExit = true
							end
						end

						convertedData[row][col] = value
						
						if value == "0" then
							allZeroTiles[#allZeroTiles + 1] = { row, col }
						end
					end
				end
			end
		end
	end

	if(not hasSpawn and #allZeroTiles > 0) then
		local spawnTile = allZeroTiles[math.random(#allZeroTiles)]

		convertedData[spawnTile[1]][spawnTile[2]] = "S"
	end

	return convertedData
end

--GetConvertedASCII
--Converts map to ASCII format
--ASCII maps can be sent to MapBuilder script
----------------------------------------------------------------------------------------------------
function CryptsAndCaverns.GetConvertedASCII(convertedData)
	local str = ""

	for r = 1, #convertedData do
		for c = 1, #convertedData[r] do
			str = str .. string.sub(tostring(convertedData[r][c]), 1, 1) .. ""
		end

		str = str .. "\n"
	end

	return str
end

--return table
return CryptsAndCaverns