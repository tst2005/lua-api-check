local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local addif = require "api-check.adder"(def)

addif (is.luajit20 or is.luajit21 or is.raptorjit10) {
	f,"on",
	f,"off",
	f,"flush",
	f,"status",
	s,"version",
	n,"version_num",
	s,"os",
	s,"arch",
	t,"opt", -- todo
}
addif (is.raptorjit10) {
	f,"auditlog",
	t,"vmprofile",
	f,"tracebarrier",
}

-- undocumented --
addif (is.luajit20 or is.luajit21) {
	f,"attach",
}
--
addif (is.luajit20) {
	t,"util", -- todo
}

-- luajit20 -jv
--[[
	t,"vmdef",
	t,"v",
]]--

--luajit21 -jv
-- ok

return def
