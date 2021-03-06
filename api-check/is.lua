
local is = {}

local function init()
if jit and type(jit.version)=="string" then
	local impl = jit.version:gsub("^([^ ]+) .*$","%1")
	if impl == "LuaJIT" then
		if jit.version_num and jit.version_num > 20000 then
			is.luajit = true
			if jit.version_num > 20200 then
				error("Luajit2.2 exists, really ?!")
			elseif jit.version_num < 20100 then
				is.luajit20 = true
				is.luajit21 = false
				assert(_VERSION == "Lua 5.1")
			else
				is.luajit20 = false
				is.luajit21 = true
				assert(_VERSION == "Lua 5.1")
			end
			assert(is.luajit20 or is.luajit21)
		else
			error("LuaJIT before 2.x is not supported")
		end
	elseif impl == "RaptorJIT" then
		if jit.version_num and jit.version_num >= 10000 then
			is.raptorjit = true
			if jit.version_num >= 20000 then
				error("RaptorJIT >=2 is too recent, not supported")
			elseif jit.version_num < 10100 then
				is.raptorjit10 = true
				assert(_VERSION == "Lua 5.1")
			else
				error("RaptorJIT >=1.1 not supported yet")
			end
		else
			error("RaptorJIT, missing jit.version_num ? "..tostring(jit.version_num))
		end
	else
		error("Unsupported jit implementation: "..impl)
	end
else
	if _VERSION == "Lua 5.1" then
		if _GOPHER_LUA_VERSION then
			if _GOPHER_LUA_VERSION == "GopherLua 0.1" then
				is.gopherlua01 = true
			else
				error("unsupported GopherLua version")
			end
		else
			is.lua51 = true
		end
	else
		is.lua52 = _VERSION == "Lua 5.2"
		is.lua53 = _VERSION == "Lua 5.3"
		--is.lua54 = _VERSION == "Lua 5.4"
		assert(is.lua51 or is.lua52 or is.lua53)
	end
end
end -- /init

is.init = function()
	init()
	is.init = nil
	return is
end
return is
