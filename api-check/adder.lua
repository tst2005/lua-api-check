
local function adder(into)
	local function a(condition)
		return function(t)
			if condition then
				for _i,v in ipairs(t) do
					if v~= nil then
						table.insert(into, v)
					end
				end
			end
			return a
		end
	end
	return a
end
return adder
