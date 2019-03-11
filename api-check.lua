
local check_shell_env = false

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
else
	is.lua51 = _VERSION == "Lua 5.1"
	is.lua52 = _VERSION == "Lua 5.2"
	is.lua53 = _VERSION == "Lua 5.3"
end

local function adder(into)
	local function a(condition)
		return function(t)
			if condition then
				for _i,v in ipairs(t) do
					if v~= nil then
						table.insert(into, v)
					end
				end
			end
			return a
		end
	end
	return a
end

local t,s,f,n = "table", "string", "function", "number"

local check = {}
check._G = {
	t,"_G",
	s,"_VERSION",
	t,"arg",
	f,"assert",
	f,"collectgarbage",
	t,"coroutine",
	t,"debug",
	f,"dofile",
	f,"error",
	f,"getmetatable",
	t,"io",
	f,"ipairs",
	f,"load",
	f,"loadfile",
	t,"math",
	f,"next",
	t,"os",
	t,"package",
	f,"pairs",
	f,"pcall",
	f,"print",
	f,"rawequal",
	f,"rawget",
	f,"rawset",
	f,"require",
	f,"select",
	f,"setmetatable",
	t,"string",
	t,"table",
	f,"tonumber",
	f,"tostring",
	f,"type",
	f,"xpcall",

}
local addif = adder(check._G)

addif (is.luajit20 or is.luajit21) {
	t,"jit",
	t,"bit",
}

addif (is.lua51 or is.luajit20 or is.luajit21) {
	f,"gcinfo",
	f,"module",
	f,"setfenv",
	f,"newproxy",
	f,"getfenv",
}

addif (is.lua51 or is.lua52 or is.luajit20 or is.luajit21) {
	f,"loadstring",
	f,"unpack",
}

addif (is.lua52) {
	t,"bit32",
	f,"module",
	f,"rawlen",
}

addif (is.lua53) {
	t,"bit32",
	t,"utf8",
}

addif (is.lua53 or is.lua52 or is.luajit21) {
	f,"rawlen",
}

do
	local check_G = check._G
	local v
	for i=1,#check_G,2 do
		local xtype,name = check_G[i], check_G[i+1]
		v = _G[name]
		if v==nil then
			print("missing _G["..name.."]")
		elseif xtype ~= type(v) then
			print("wrong type for _G["..name.."] expected "..xtype..", got "..type(v))
		end
	end
	for i=1,#check_G,2 do
		local xtype,name = check_G[i], check_G[i+1]
		check_G[name] = xtype
	end
	for name,v in pairs(_G) do
		local xtype = check_G[name]
		if xtype == nil then
			print("[2]: missing check._G["..name.."]")
		elseif xtype ~= type(v) then
			print("[2]: wrong type for _G["..name.."] expected "..xtype..", got "..type(v))
		end
	end
end

local check_math = {
	f,"abs",
	f,"acos",
	f,"asin",
	f,"atan",
	f,"atan2",
	f,"ceil",
	f,"cos",
	f,"cosh",
	f,"deg",
	f,"exp",
	f,"floor",
	f,"fmod",
	f,"frexp",
	f,"ldexp",
	f,"log",
	f,"log10",
	f,"max",
	f,"min",
	f,"modf",
	f,"pow",
	f,"rad",
	f,"random",
	f,"randomseed",
	f,"sin",
	f,"sinh",
	f,"sqrt",
	f,"tan",
	f,"tanh",
	f,"tointeger",
	f,"type",
	f,"ult",
	n,"huge",
	n,"maxinteger",
	n,"mininteger",
	n,"pi",
}

check.coroutine = {
	f,"create",
	f,"isyieldable",
	f,"resume",
	f,"running",
	f,"status",
	f,"wrap",
	f,"yield",
}

check.debug = {
	f,"debug",
	f,"gethook",
	f,"getinfo",
	f,"getlocal",
	f,"getmetatable",
	f,"getregistry",
	f,"getupvalue",
	f,"getuservalue",
	f,"sethook",
	f,"setlocal",
	f,"setmetatable",
	f,"setupvalue",
	f,"setuservalue",
	f,"traceback",
	f,"upvalueid",
	f,"upvaluejoin",
}

check.io = {
	f,"close",
	f,"flush",
	f,"input",
	f,"lines",
	f,"open",
	f,"output",
	f,"popen",
	f,"read",
	f,"tmpfile",
	f,"type",
	f,"write",
	u,"stderr",
	u,"stdin",
	u,"stdout",
}

check.file = {
	f,"close",
	f,"flush",
	f,"lines",
	f,"read",
	f,"seek",
	f,"setvbuf",
	f,"write",
}

check.os = {
	f,"clock",
	f,"date",
	f,"difftime",
	f,"execute",
	f,"exit",
	f,"getenv",
	f,"remove",
	f,"rename",
	f,"setlocale",
	f,"time",
	f,"tmpname",
}

check.package = {
	f,"loadlib",
	f,"searchpath",
	s,"config",
	s,"cpath",
	s,"path",
	t,"loaded",
	t,"preload",
	t,"searchers",
}

check.string = {
	f,"byte",
	f,"char",
	f,"dump",
	f,"find",
	f,"format",
	f,"gmatch",
	f,"gsub",
	f,"len",
	f,"lower",
	f,"match",
	f,"pack",
	f,"packsize",
	f,"rep",
	f,"reverse",
	f,"sub",
	f,"unpack",
	f,"upper",
}

check.table = {
	f,"concat",
	f,"insert",
	f,"move",
	f,"pack",
	f,"remove",
	f,"sort",
	f,"unpack",
}

check.utf8 = {
	f,"char",
	f,"codepoint",
	f,"codes",
	f,"len",
	f,"offset",
	s,"charpattern",
}

if check_shell_env then
	local function X(x)
		if os.getenv(x) then
			print(x, os.getenv(x))
		end 
	end

	X"LUA_INIT"
	X"LUA_PATH"
	X"LUA_CPATH"

	X"LUA_INIT_5_1"
	X"LUA_PATH_5_1"
	X"LUA_CPATH_5_1"

	X"LUA_INIT_5_2"
	X"LUA_PATH_5_2"
	X"LUA_CPATH_5_2"

	X"LUA_INIT_5_3"
	X"LUA_PATH_5_3"
	X"LUA_CPATH_5_3"
end



