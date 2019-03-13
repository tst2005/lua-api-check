
local verbose = 0
if arg[1] == "-v" then
	verbose = verbose +1
elseif arg[1] == "-vv" then
	verbose = verbose +2
end

local check_shell_env = false

local modules = {"_G", "coroutine", "debug", --[["file", ]] "io", "math", "os", "package", "string", "table", "utf8"}

local defs = {}

for _i, modname in ipairs(modules) do
	defs[modname] = require("api-check.def."..assert(modname))
end
defs.file = require "api-check.def.file"

local function checkthis(modname, mod, def)
	assert(type(modname)=="string")
	mod = mod or {}
	local v
	for i=1,#def,2 do
		local xtype,name = def[i], def[i+1]
		v = mod[name]
		if v==nil then
			print("missing "..modname.."["..name.."]")
		elseif xtype ~= type(v) then
			print("wrong type for "..modname.."["..name.."] expected "..xtype..", got "..type(v))
		else
			if verbose>=2 then
				print(" - "..modname.."."..name)
			end
		end
	end
	for i=1,#def,2 do
		local xtype,name = def[i], def[i+1]
		def[name] = xtype
	end
	for name,v in pairs(mod) do
		local xtype = def[name]
		if xtype == nil then
			print("[2]: missing check."..modname.."["..name.."]")
		elseif xtype ~= type(v) then
			print("[2]: wrong type for "..modname.."["..name.."] expected "..xtype..", got "..type(v))
		end
	end
end

--checkthis("_G", _G, defs._G)
--checkthis("coroutine", coroutine, defs.coroutine)
for _i, modname in ipairs(modules) do
	local def = assert(defs[modname], "emptydef "..modname)
	local mod = package.loaded[modname]
	if verbose >=1 then
		print("Checking...", modname)
	end
	checkthis(modname, mod, def)
end
local file = getmetatable(io.stdin)
if verbose >=1 then
	print("Checking...", "file")
end
checkthis("file", file, defs.file)

if check_shell_env then
	require "api-check/checkenv"()
end

