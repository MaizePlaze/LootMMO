local ASCIIParser = {}

-- ASCII string cleaned up
function ASCIIParser.Clean(map)
    for c = 1, string.len(map) do
        local character = string.sub(map, c, c)
        if not string.match(character, "[0-9a-zA-Z]+") then
            map = string.gsub(map, character, "")
        end
    end
    return map
end

function ASCIIParser.BuildMap(map, MAP_WIDTH, MAP_HEIGHT)
 
    local tableMap = {}
	local mapStr = ""

	map = ASCIIParser.Clean(map)

	for r = 1, MAP_HEIGHT do -- Loop through the height (rows)
		table.insert(tableMap, {})

		for c = 1, MAP_WIDTH do -- Loop through the width (columns)
			--local character = string.sub(map, ((r - 1) * MAP_WIDTH) + c, ((r - 1) * MAP_WIDTH) + c)

			local index = (r - 1) * MAP_WIDTH + c
			local character = string.sub(map, index, index)

			tableMap[r][c] = character
			mapStr = mapStr .. character
		end

		mapStr = mapStr .. "\n"
	end

	return tableMap, mapStr
end

return ASCIIParser
