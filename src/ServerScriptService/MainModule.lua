local DowntimeService = {}

local HttpService = game:GetService("HttpService")


function DowntimeService.GetSiteStatus()
	
	local GetStatus = HttpService:GetAsync("lol this is a placeholder url lmao")
	
	local Data = HttpService:JSONDecode(GetStatus)
	
	if Data.placeholderlol == "placeholderpog" then
		
		
		return "Service is Healthy."
		
	elseif Data.placeholderlol == "placeholdermeh" then 
		
		
		return "Service is Degraded."
		
		
	elseif Data.placeholderlol == "placeholderdown" then 
		
		
		return "Service is Down."
		
	end
	
	
	
	
end


function DowntimeService.GetAvatarAPIStatus()
	
	
end



return DowntimeService
