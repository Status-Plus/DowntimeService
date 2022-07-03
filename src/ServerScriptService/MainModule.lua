local DowntimeService = {}

local HttpService = game:GetService("HttpService")
local StatSummary = "https://api.statusplus.xyz/status"

function DowntimeService.statusFromAlias(alias)
	local jsonData = HttpService:GetAsync(StatSummary)
	local data = HttpService:JSONDecode(jsonData)
	if data then
		for _, apiTable in ipairs(data) do
			for _, apiAlias in ipairs(apiTable.aliases) do
				if apiAlias == alias then
					return apiTable.status
				end
			end
		end
	end
end

function DowntimeService.statusFromName(name)
	local jsonData = HttpService:GetAsync(StatSummary)
	local data = HttpService:JSONDecode(jsonData)
	if data then
		for _, apiTable in ipairs(data) do
			if apiTable.name == name then
				return apiTable.status
			end
		end
	end
end

return DowntimeService
