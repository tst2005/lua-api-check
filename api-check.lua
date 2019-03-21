
local verbose = 0
if arg[1] == "-v" then
	verbose = verbose +1
	table.remove(arg,1)
elseif arg[1] == "-vv" then
	verbose = verbose +2
	table.remove(arg,1)
end

local is = require"api-check.is"
if arg[1] then
	local identity=arg[1]
	--print("force identity to", identity)
	if not is.init then
		error("IS: already init-ed")
	end
	is.init=nil
	is[identity]=true
end
if is.init then
	is.init()
	assert(not is.init)
end

local check_shell_env = false

local modules = { "_G", "coroutine", "debug", "file", "io", "math", "os", "package", "string", "table", "utf8"}

local defs = {}

for _i, modname in ipairs(modules) do
	defs[modname] = require("api-check.def."..assert(modname))
end

local function checkthis(modname, mod, def)
	assert(type(modname)=="string")
	mod = mod or {}

	local rdef={}
	for i=1,#def,2 do
		local xtype,name = def[i], def[i+1]
		if xtype and name then
			if rdef[name] and xtype ~= rdef[name] then
				print("WARNING: def."..name.." defined twice as "..tostring(xtype).." and as "..tostring(rdef[name]).." ?!")
			end
			rdef[name] = xtype
		end
	end

	local v
	for i=1,#def,2 do
		local xtype,name = def[i], def[i+1]
		if xtype and name then
			v = mod[name]
			if v==nil then
				print(" * [ ] - nothing found, expected: `"..modname.."."..tostring(name).."` "..tostring(xtype))
			elseif xtype ~= type(v) then
				print(" * [ ] ~ `"..modname.."."..tostring(name).."` mismatch type: "..type(v).." found, "..tostring(xtype).." expected")
			else
				if verbose>=2 then
					print(" * [x] `"..modname.."."..name.."` "..type(v))
				end
			end
		end
	end
	for name,v in pairs(mod) do
		local xtype = rdef[name]
		if xtype == nil then
			print(" * [ ] + `"..modname.."."..name.."` "..type(v).." found, nothing expected")
--		elseif xtype ~= type(v) then
--			print(" ~ 2")
		end
	end
end

local where = {}
where.file = getmetatable(io.stdin)

for _i, modname in ipairs(modules) do
	local def = assert(defs[modname], "emptydef "..modname)
	local mod = where[modname] or package.loaded[modname]
	if verbose >=1 then
		print("# Checking "..modname)
	end
	checkthis(modname, mod, def)
end

if check_shell_env then
	require "api-check/checkenv"()
end

