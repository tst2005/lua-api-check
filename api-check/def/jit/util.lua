local t,s,f,n = "table", "string", "function", "number"
local def = {}

local is = require "api-check.is"
local addif = require "api-check.adder"(def)

addif (is.luajit20 or is.luajit21) {
	f,"funcbc",
	f,"funck",
	f,"funcinfo",
	f,"traceinfo",
	f,"tracek",
	f,"tracesnap",
	f,"traceir",
	f,"tracemc",
	f,"ircalladdr",
	f,"traceexitstub",
	f,"funcuvname",
}
return def
