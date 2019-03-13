
local check_shell_env = false

local modules = {"_G", "coroutine", "debug", --[["file", ]] "io", "math", "os", "package", "string", "table", "utf8"}

local defs = {}

for _i, modname in ipairs(modules) do
	defs[modname] = require("api-check.def."..assert(modname))
end
--defs._G = require "api-check.def._G"
--defs.coroutine = require "api-check.def.coroutine"
--defs.debug = require "api-check.def.debug"
defs.file = require "api-check.def.file"
--defs.io = require "api-check.def.io"
--defs.math = require "api-check.def.math"
--defs.os = require "api-check.def.os"
--defs.package = require "api-check.def.package"
--defs.string = require "api-check.def.string"
--defs.table = require "api-check.def.table"
--defs.utf8 = require "api-check.def.utf8"

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

checkthis("_G", _G, defs._G)
checkthis("coroutine", coroutine, defs.coroutine)
for _i, modname in ipairs(modules) do
	local def = assert(defs[modname], "emptydef "..modname)
	local mod = package.loaded[modname]
	checkthis(modname, mod, def)
end
local file = getmetatable(io.stdin)
checkthis("file", file, defs.file)

if check_shell_env then
	require "api-check/checkenv"()
end

