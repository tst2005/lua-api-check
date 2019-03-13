local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local adder = require "api-check.adder"
local addif = adder(def)

addif (true) {
	f,"debug",
	f,"gethook",
	f,"getinfo",
	f,"getlocal",
	f,"getmetatable",
	f,"getregistry",
	f,"getupvalue",
	f,"sethook",
	f,"setlocal",
	f,"setmetatable",
	f,"setupvalue",
	f,"traceback",
}

addif (is.lua52 or is.lua53 or is.luajit21) {
	f,"getuservalue",
	f,"setuservalue",
}
addif (is.lua52 or is.lua53 or is.luajit20 or is.luajit21) {
	f,"upvalueid",
	f,"upvaluejoin",
}

addif (is.lua51 or is.luajit20 or is.luajit21) {
	f,"setfenv",
	f,"getfenv",
}

return def
