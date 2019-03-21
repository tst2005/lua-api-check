# Checking _G
 * [x] `_G._G` table
 * [x] `_G._VERSION` string
 * [x] `_G.arg` table
 * [x] `_G.assert` function
 * [x] `_G.collectgarbage` function
 * [x] `_G.coroutine` table
 * [x] `_G.debug` table
 * [x] `_G.dofile` function
 * [x] `_G.error` function
 * [x] `_G.getmetatable` function
 * [x] `_G.io` table
 * [x] `_G.ipairs` function
 * [x] `_G.load` function
 * [x] `_G.loadfile` function
 * [x] `_G.math` table
 * [x] `_G.next` function
 * [x] `_G.os` table
 * [x] `_G.package` table
 * [x] `_G.pairs` function
 * [x] `_G.pcall` function
 * [x] `_G.print` function
 * [x] `_G.rawequal` function
 * [x] `_G.rawget` function
 * [x] `_G.rawset` function
 * [x] `_G.require` function
 * [x] `_G.select` function
 * [x] `_G.setmetatable` function
 * [x] `_G.string` table
 * [x] `_G.table` table
 * [x] `_G.tonumber` function
 * [x] `_G.tostring` function
 * [x] `_G.type` function
 * [x] `_G.xpcall` function
 * [x] `_G.jit` table
 * [x] `_G.bit` table
 * [x] `_G.gcinfo` function
 * [x] `_G.module` function
 * [x] `_G.setfenv` function
 * [x] `_G.newproxy` function
 * [x] `_G.getfenv` function
 * [x] `_G.loadstring` function
 * [x] `_G.unpack` function
 * [ ] + `_G.rawlen` function found, nothing expected
# Checking coroutine
 * [x] `coroutine.create` function
 * [x] `coroutine.resume` function
 * [x] `coroutine.running` function
 * [x] `coroutine.status` function
 * [x] `coroutine.wrap` function
 * [x] `coroutine.yield` function
 * [ ] - nothing found, expected: `coroutine.isyieldable` function
# Checking debug
 * [x] `debug.debug` function
 * [x] `debug.gethook` function
 * [x] `debug.getinfo` function
 * [x] `debug.getlocal` function
 * [x] `debug.getmetatable` function
 * [x] `debug.getregistry` function
 * [x] `debug.getupvalue` function
 * [x] `debug.sethook` function
 * [x] `debug.setlocal` function
 * [x] `debug.setmetatable` function
 * [x] `debug.setupvalue` function
 * [x] `debug.traceback` function
 * [x] `debug.upvalueid` function
 * [x] `debug.upvaluejoin` function
 * [x] `debug.setfenv` function
 * [x] `debug.getfenv` function
 * [ ] + `debug.getuservalue` function found, nothing expected
 * [ ] + `debug.setuservalue` function found, nothing expected
# Checking file
 * [x] `file.close` function
 * [x] `file.flush` function
 * [x] `file.lines` function
 * [x] `file.read` function
 * [x] `file.seek` function
 * [x] `file.setvbuf` function
 * [x] `file.write` function
 * [x] `file.__tostring` function
 * [x] `file.__gc` function
 * [x] `file.__index` table
# Checking io
 * [x] `io.close` function
 * [x] `io.flush` function
 * [x] `io.input` function
 * [x] `io.lines` function
 * [x] `io.open` function
 * [x] `io.output` function
 * [x] `io.popen` function
 * [x] `io.read` function
 * [x] `io.tmpfile` function
 * [x] `io.type` function
 * [x] `io.write` function
 * [x] `io.stderr` userdata
 * [x] `io.stdin` userdata
 * [x] `io.stdout` userdata
# Checking math
 * [x] `math.abs` function
 * [x] `math.acos` function
 * [x] `math.asin` function
 * [x] `math.atan` function
 * [x] `math.atan2` function
 * [x] `math.ceil` function
 * [x] `math.cos` function
 * [x] `math.cosh` function
 * [x] `math.deg` function
 * [x] `math.exp` function
 * [x] `math.floor` function
 * [x] `math.fmod` function
 * [x] `math.frexp` function
 * [x] `math.ldexp` function
 * [x] `math.log` function
 * [x] `math.log10` function
 * [x] `math.max` function
 * [x] `math.min` function
 * [x] `math.modf` function
 * [x] `math.pow` function
 * [x] `math.rad` function
 * [x] `math.random` function
 * [x] `math.randomseed` function
 * [x] `math.sin` function
 * [x] `math.sinh` function
 * [x] `math.sqrt` function
 * [x] `math.tan` function
 * [x] `math.tanh` function
 * [x] `math.huge` number
 * [x] `math.pi` number
# Checking os
 * [x] `os.clock` function
 * [x] `os.date` function
 * [x] `os.difftime` function
 * [x] `os.execute` function
 * [x] `os.exit` function
 * [x] `os.getenv` function
 * [x] `os.remove` function
 * [x] `os.rename` function
 * [x] `os.setlocale` function
 * [x] `os.time` function
 * [x] `os.tmpname` function
# Checking package
 * [x] `package.loadlib` function
 * [x] `package.config` string
 * [x] `package.cpath` string
 * [x] `package.path` string
 * [x] `package.loaded` table
 * [x] `package.preload` table
 * [x] `package.searchpath` function
 * [x] `package.seeall` function
 * [x] `package.loaders` table
# Checking string
 * [x] `string.byte` function
 * [x] `string.char` function
 * [x] `string.dump` function
 * [x] `string.find` function
 * [x] `string.format` function
 * [x] `string.gmatch` function
 * [x] `string.gsub` function
 * [x] `string.len` function
 * [x] `string.lower` function
 * [x] `string.match` function
 * [x] `string.rep` function
 * [x] `string.reverse` function
 * [x] `string.sub` function
 * [x] `string.upper` function
# Checking table
 * [x] `table.concat` function
 * [x] `table.insert` function
 * [x] `table.remove` function
 * [x] `table.sort` function
 * [x] `table.maxn` function
 * [x] `table.foreach` function
 * [x] `table.foreachi` function
 * [x] `table.getn` function
 * [ ] - nothing found, expected: `table.move` function
 * [ ] + `table.pack` function found, nothing expected
 * [ ] + `table.unpack` function found, nothing expected
# Checking utf8
