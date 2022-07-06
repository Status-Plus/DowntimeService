local DTS = {}
local starter = "DTS | "
local DTS_CACHE = {}
local LAST_CHECKED = 0
local TIME_BETWEEN_REQUESTS = 2
local API_VERSION = "NULL"
local roxios = require(script.Parent["roxios"])
local API = "https://api.statusplus.xyz/status"
local initialized = false
local STATUSES = {
	["UP"] = {},
	["DEGRADED"] = {},
	["DOWN"] = {},
	["IGNORED"] = {},
}
-- local module = {}

-- function module.e()
--     local success, request = roxios.Request({Url = API, Method = 'GET'}):await()
--     if success then
--         print(request)
--     end
-- end

function fetchStatuses()
	if not initialized then
		return warn(starter, "Module not initialized!")
	end
	local success, request = roxios.Request({ Url = API, Method = "GET" }):await()
	LAST_CHECKED = os.time()
	if not success then
		return false, error("Request failed!")
	end
	API_VERSION = request.Headers["x-statusplus-version"]
	local cache = request
	for _, v in next, cache do
		STATUSES[string.upper(v.Status)] = v
		DTS_CACHE[v.name] = v
	end
end
function DTS.getApi(str)
	if not initialized then
		return warn(starter, "Module not initialized!")
	end
	local aliasFound = false
	for _, v in next, DTS_CACHE do
		if table.find(v.aliases, str) then
			aliasFound = true
		end
	end
	if not DTS_CACHE[str] or not aliasFound then
		return "Invalid API Name!"
	end
	return table.clone(DTS_CACHE[str])
end
function DTS.getApis(object)
	if not initialized then
		return warn(starter, "Module not initialized!")
	end

	if not object then
		return DTS_CACHE
	end
	local statuses = {
		["ALL"] = {},
	}
	if typeof(object.statuses) == "table" then
		for i, _ in next, object.statuses do
			if STATUSES[i] then
				statuses[i] = table.clone(STATUSES[i])
			end
		end
	end
	return statuses
end
function DTS.getInfo()
	if not initialized then
		return warn(starter, "Module not initialized!")
	end
	return {
		lastChecked = LAST_CHECKED,
		apiVersion = API_VERSION,
		statusCache = table.clone(DTS_CACHE),
	}
end
function DTS.init()
	if initialized then
		return warn(starter, "Module already initialized!")
	end
	initialized = true
	game:GetService("RunService").Heartbeat:Connect(function()
		if not (os.time() >= LAST_CHECKED + TIME_BETWEEN_REQUESTS) then
			return false
		end
		fetchStatuses()
	end)
end

return setmetatable(DTS, { __index = DTS })
