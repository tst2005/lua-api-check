
local function checkenv()
	local function X(x)
		if os.getenv(x) then
			print(x, os.getenv(x))
		end 
	end

	X"LUA_INIT"
	X"LUA_PATH"
	X"LUA_CPATH"

	X"LUA_INIT_5_1"
	X"LUA_PATH_5_1"
	X"LUA_CPATH_5_1"

	X"LUA_INIT_5_2"
	X"LUA_PATH_5_2"
	X"LUA_CPATH_5_2"

	X"LUA_INIT_5_3"
	X"LUA_PATH_5_3"
	X"LUA_CPATH_5_3"
end

return checkenv
