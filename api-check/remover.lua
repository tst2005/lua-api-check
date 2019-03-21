
return function(into)
	local function a(condition)
		return function(t)
			if condition then
				for y=1,#t,2 do
					local v1,v2 = t[y],t[y+1]
					for i=1,#into,2 do
						if into[i] == v1 and into[i+1] == v2 then
							into[i]=false
							into[i+1]=false
						end
					end
				end
			end
			return a
		end
	end
	return a
end
