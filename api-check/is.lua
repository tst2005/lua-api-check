
local is = {}
if jit and jit.version_num and jit.version_num > 20000 then
	is.luajit = true
	if jit.version_num > 20200 then
		error("OMG Luajit2.2 exists, really ?!")
	elseif jit.version_num < 20100 then
		is.luajit20 = true
		is.luajit21 = false
	else
		is.luajit20 = false
		is.luajit21 = true
	end
	assert(is.luajit20 or is.luajit21)
else
	is.lua51 = _VERSION == "Lua 5.1"
	is.lua52 = _VERSION == "Lua 5.2"
	is.lua53 = _VERSION == "Lua 5.3"
	--is.lua54 = _VERSION == "Lua 5.4"
	assert(is.lua51 or is.lua52 or is.lua53)
end
return is
