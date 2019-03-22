local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local addif = require "api-check.adder"(def)

addif (is.lua52 or is.lua53) {
	f,"arshift",
	f,"band",
	f,"bnot",
	f,"bor",
	f,"btest",
	f,"bxor",
	f,"extract",
	f,"lrotate",
	f,"lshift",
	f,"replace",
	f,"rrotate",
	f,"rshift",
}
--[[
local removeif = require "api-check.remover"(def)
removeif (is.gopherlua01) {
	f,"loadlib",
	s,"config",
	s,"cpath",
	s,"path",
	t,"loaded",
	t,"preload",
}
]]--
return def
