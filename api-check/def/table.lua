local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local addif = require "api-check.adder"(def)

addif (true) {
	f,"concat",
	f,"insert",
	f,"remove",
	f,"sort",
}
addif (is.lua51 or is.lua52 or is.luajit20 or is.luajit21 or is.raptorjit10 or is.gopherlua01) {
	f,"maxn",
}
addif (is.lua51 or is.luajit20 or is.luajit21 or is.raptorjit10) {
	f,"foreach",
	f,"foreachi",
}
addif (is.lua51 or is.luajit20 or is.luajit21 or is.raptorjit10 or is.gopherlua01) {
	f,"getn",
}
addif (is.lua51) {
	f,"setn",
}
addif (is.lua52 or is.lua53 or is.luajit21) {
	f,"pack",
	f,"unpack",
}
addif (is.lua53 or is.raptorjit10) {
	f,"move",
}

return def
