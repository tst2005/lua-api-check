
local function adder(into)
	local function a(condition)
		return function(t)
			if condition then
				for i=1,#t,2 do
					local v1=t[i]
					local v2=t[i+1]
					if not (v1==false and v2==false) then
						if type(v1)=="string" and type(v2)=="string" then
							table.insert(into, v1)
							table.insert(into, v2)
						else
							error("invalid format "..i.." "..type(v1).." "..tostring(v1).." "..type(v2).." "..tostring(v2))
						end
					end
				end
			end
			return a
		end
	end
	return a
end
return adder
