local SVG_Parser = {}

function SVG_Parser:CreateMap(size)
	self.map = {}

	for c = 1, size do
		local col = {}

		for r = 1, size do
			col[r] = string.sub("-", 1)
		end

		table.insert(self.map, col)
	end
end

function SVG_Parser:Print()
	local str = ""

	for r = 1, #self.map do
		str = str .. "["

		for c = 1, #self.map[r] do
			str = str .. (c == 1 and "" or ", ") .. "" .. string.sub(tostring(self.map[r][c]), 1, 1) .. ""
 		end

		str = str .. "]\n"
	end

	print(str)
end

function SVG_Parser:GetASCII()
	local str = ""

	for r = 1, #self.map do
		str = str .. ""

		for c = 1, #self.map[r] do
			str = str .. string.sub(tostring(self.map[r][c]), 1, 1) .. ""
 		end

		str = str .. "\n"
	end

	return str
end

function SVG_Parser:GetWidthHeight()
	self.width = self.svgData:match("viewBox=\"?%d+ %d+ (%d+)")
	self.height = self.svgData:match("viewBox=\"?%d+ %d+ %d+ (%d+)")
end

function SVG_Parser:ToMap()
	SVG_Parser:GetWidthHeight()

	local h = 0

	for item in self.svgData:gmatch("(<rect.-.-/>)") do
		if(not item:find("100%%") and not item:find("stroke")) then
			local x = item:match("x=.?(%d+).?")
			local y = item:match("y=.?(%d+).?")
			local width = item:match("width=.?(%d+).?")
			local height = item:match("height=.?(%d+).?")
			local color = item:match("fill=.?#(%w+).?")

			local row = math.ceil(y / height)
			local column = math.ceil(x / height)
			local cell_columns = math.floor(width / height)
			local total_columns = math.floor(self.width / height)

			if(self.map == nil) then
				self:CreateMap(total_columns)
				h = height
			end

			for c = 1, total_columns do
				if(c >= column and c <= (cell_columns + column - 1)) then
					self.map[row][c] = color
				end
			end
		end
	end

	self.rows = math.floor(self.height / h)
	self.cols = math.floor(self.height / h)

	return self.map
end

function SVG_Parser:GetRows()
	return self.rows
end

function SVG_Parser:GetCols()
	return self.cols
end

function SVG_Parser:GetMap()
	return self.map
end

function SVG_Parser:New(rawSVG)
	self.__index = self

	local tbl = setmetatable({}, self)

	self.svgData = rawSVG
	
	tbl:ToMap()

	return tbl
end

return SVG_Parser