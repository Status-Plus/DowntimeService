local DowntimeService = require(6317978171) -- Or require by using the file path. (Requiring by ID is better for quicker updates.)
local Players = game:GetService("Players")

-- Example #1: Kicking Players if Datastores are down and the variable is set to true.

local kickPlayers = true

Players.PlayerAdded:Connect(function(player)
	if DowntimeService.statusFromAlias("datastore"):lower() == "down" then
		if kickPlayers then
				player:Kick("Datastores are currently down. To prevent critical errors we have kicked you. If this issue persits please contact the game owner. =")
		end
	end 
end)

-- Example #2 Printing the Roblox website's status every 5 minutes. 

while true do
	local siteStatus = DowntimeService.statusFromAlias("site"):lower()
	if siteStatus == "down" then
		warn("Roblox Website is Currently Down! Please be patient while Roblox works on a fix! :)") 
	elseif siteStatus == "degraded" then
		print("Roblox Website is Currently slow! Please be patient while Roblox works on it! :)")
	elseif siteStatus == "up" then
		print("Roblox website is currently up!")
	end
	wait(300)
end
