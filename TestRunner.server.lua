local ServerScripts = game:GetService("ServerScriptService")
local TestService = game:GetService("TestService")

local TestEZ = require(TestService.Packages.TestEZ)

TestEZ.TestBootstrap:run({
	ServerScripts.Sift,
})
