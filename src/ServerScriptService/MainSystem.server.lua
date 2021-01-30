local DowntimeService = require(6317978171) -- Or require by using the file path. (Requiring by ID is better for quicker updates.)
local Players = game:GetService("Players")

-- Example #1: Kicking Players if Datastores are down.

Players.PlayerAdded:Connect(function(player)
    if DowntimeService:GetDatastoreAPIStatus() == "down" then
        player:Kick("Datastores are currently down. To prevent critical errors we have kicked you. If this issue persits please contact the game owner. =")
    end 
end)

-- Example #2 Printing latest tests if something is down or not. 

while true do
    
if DowntimeService:GetSiteStatus() == "down" then

   warn("Roblox Website is Currently Down! Please be patient while Roblox works on a fix! :)") 

elseif DowntimeService.GetSiteStatus() == "degraded" then
    print("Roblox Website is Currently slow! Please be patient while Roblox works on it! :)")
elseif DowntimeService:GetSiteStatus() == "up" then
    print("Roblox website is currently up!")
end
wait(300)
end