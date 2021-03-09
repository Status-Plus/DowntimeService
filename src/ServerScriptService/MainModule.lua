local DowntimeService = {}

--[[

▒█▀▀▄ ▒█▀▀▀█ ▒█░░▒█ ▒█▄░▒█ ▀▀█▀▀ ▀█▀ ▒█▀▄▀█ ▒█▀▀▀ ▒█▀▀▀█ ▒█▀▀▀ ▒█▀▀█ ▒█░░▒█ ▀█▀ ▒█▀▀█ ▒█▀▀▀ 
▒█░▒█ ▒█░░▒█ ▒█▒█▒█ ▒█▒█▒█ ░▒█░░ ▒█░ ▒█▒█▒█ ▒█▀▀▀ ░▀▀▀▄▄ ▒█▀▀▀ ▒█▄▄▀ ░▒█▒█░ ▒█░ ▒█░░░ ▒█▀▀▀ 
▒█▄▄▀ ▒█▄▄▄█ ▒█▄▀▄█ ▒█░░▀█ ░▒█░░ ▄█▄ ▒█░░▒█ ▒█▄▄▄ ▒█▄▄▄█ ▒█▄▄▄ ▒█░▒█ ░░▀▄▀░ ▄█▄ ▒█▄▄█ ▒█▄▄▄

DowntimeService is a In-game API for interacting with Status+
Read more here: devforum.roblox.com/t/status-plus/1004536
Documentation on how to use DowntimeService: status-plus.github.io/Docs

DowntimeService sends API requests to JSON endpoints on the main site. 
The main site checks major ROBLOX endpoints every 5 minutes for outages and slowness. 
It then returns "up", "degraded" or "down".

--]]

local HttpService = game:GetService("HttpService")
local sumurl = "https://raw.githubusercontent.com/Status-Plus/StatusPlus/master/history/summary.json"

function ReturnTableThroughSlug(slug, data)
	if data then
		for i, value in ipairs(data) do
			if value["slug"] == slug then
				return value
			end
		end
	end
end

function CheckForTotalOutages(data)
	if data then
		for i, value in ipairs(data) do
			if value["status"] == "down" then
				return "down"
			elseif value["status"] == "degraded" then
				return "degraded"
			end
			return "up"
		end
	end
end
function DowntimeService.GetSiteStatus()

	local GetStatus = HttpService:GetAsync(sumurl)

	local Data = HttpService:JSONDecode(GetStatus)
	local Table = ReturnTableThroughSlug("roblox-site", Data)

	return Table.status -- Will return "up", "degraded" or "down"
end

function DowntimeService.GetDevForumStatus()

	local GetStatus = HttpService:GetAsync(sumurl)

	local Data = HttpService:JSONDecode(GetStatus)
	local Table = ReturnTableThroughSlug("roblox-devforum", Data)

	return Table.status -- Will return "up", "degraded" or "down"
end

function DowntimeService.GetDevHubStatus()

	local GetStatus = HttpService:GetAsync(sumurl)

	local Data = HttpService:JSONDecode(GetStatus)
	local Table = ReturnTableThroughSlug("roblox-devhub", Data)

	return Table.status -- Will return "up", "degraded" or "down"
end

function DowntimeService.GetAvatarAPIStatus()

	local GetStatus = HttpService:GetAsync(sumurl)

	local Data = HttpService:JSONDecode(GetStatus)
	local Table = ReturnTableThroughSlug("avatar-api-endpoint", Data)
	
	return Table.status
end

function DowntimeService.GetBadgesAPIStatus()

	local GetStatus = HttpService:GetAsync(sumurl)

	local Data = HttpService:JSONDecode(GetStatus)
	local Table = ReturnTableThroughSlug("badges-api-endpoint", Data)

	return Table.status -- Will return "up", "degraded" or "down"
end

function DowntimeService.GetCDNAPIStatus()

	local GetStatus = HttpService:GetAsync(sumurl)

	local Data = HttpService:JSONDecode(GetStatus)
	local Table = ReturnTableThroughSlug("roblox-s-cdn-api-endpoint", Data)

	return Table.status -- Will return "up", "degraded" or "down"
end

function DowntimeService.GetCatalogAPIStatus()

	local GetStatus = HttpService:GetAsync(sumurl)

	local Data = HttpService:JSONDecode(GetStatus)
	local Table = ReturnTableThroughSlug("catalog-api-endpoint", Data)

	return Table.status -- Will return "up", "degraded" or "down"
end

function DowntimeService.GetEconomyAPIStatus()

	local GetStatus = HttpService:GetAsync(sumurl)

	local Data = HttpService:JSONDecode(GetStatus)
	local Table = ReturnTableThroughSlug("economy-api-endpoint", Data)

	return Table.status -- Will return "up", "degraded" or "down"
end

function DowntimeService.GetDatastoreAPIStatus()

	local GetStatus = HttpService:GetAsync(sumurl)

	local Data = HttpService:JSONDecode(GetStatus)
	local Table = ReturnTableThroughSlug("datastore-api-endpoint", Data)

	return Table.status -- Will return "up", "degraded" or "down"
end


function DowntimeService.GetDevelopAPIStatus()

	local GetStatus = HttpService:GetAsync(sumurl)

	local Data = HttpService:JSONDecode(GetStatus)
	local Table = ReturnTableThroughSlug("develop-api-endpoint", Data)

	return Table.status -- Will return "up", "degraded" or "down"
end

function DowntimeService.GetFriendsAPIStatus()

	local GetStatus = HttpService:GetAsync(sumurl)

	local Data = HttpService:JSONDecode(GetStatus)
	local Table = ReturnTableThroughSlug("friends-api-endpoint", Data)

	return Table.status -- Will return "up", "degraded" or "down"
end

function DowntimeService.GetGameJoinAPIStatus()

	local GetStatus = HttpService:GetAsync(sumurl)

	local Data = HttpService:JSONDecode(GetStatus)
	local Table = ReturnTableThroughSlug("game-join-api-endpoint", Data)

	return Table.status -- Will return "up", "degraded" or "down"
end

function DowntimeService.GetGameInternationalizationAPIStatus()

	local GetStatus = HttpService:GetAsync(sumurl)

	local Data = HttpService:JSONDecode(GetStatus)
	local Table = ReturnTableThroughSlug("game-internationalization-api-endpoint", Data)

	return Table.status -- Will return "up", "degraded" or "down"
end

function DowntimeService.GetGroupsAPIStatus()

	local GetStatus = HttpService:GetAsync(sumurl)

	local Data = HttpService:JSONDecode(GetStatus)
	local Table = ReturnTableThroughSlug("groups-api-endpoint", Data)

	return Table.status -- Will return "up", "degraded" or "down"
end

function DowntimeService.GetInventoryAPIStatus()

	local GetStatus = HttpService:GetAsync(sumurl)

	local Data = HttpService:JSONDecode(GetStatus)
	local Table = ReturnTableThroughSlug("inventory-api-endpoint", Data)

	return Table.status -- Will return "up", "degraded" or "down"
end

function DowntimeService.GetTextFilterAPIStatus()

	local GetStatus = HttpService:GetAsync(sumurl)

	local Data = HttpService:JSONDecode(GetStatus)
	local Table = ReturnTableThroughSlug("text-filter-api-endpoint", Data)

	return Table.status -- Will return "up", "degraded" or "down"
end

function DowntimeService.GetThumbnailsAPIStatus()

	local GetStatus = HttpService:GetAsync(sumurl)

	local Data = HttpService:JSONDecode(GetStatus)
	local Table = ReturnTableThroughSlug("thumbnails-api-endpoint", Data)

	return Table.status -- Will return "up", "degraded" or "down"
end

function DowntimeService.GetRobloxStatus() -- All sites
	local GetStatus = HttpService:GetAsync(sumurl)
	local Data = HttpService:JSONDecode(GetStatus)

	return CheckForTotalOutages(Data) -- Will return "up", "degraded" or "down"
end

return DowntimeService
