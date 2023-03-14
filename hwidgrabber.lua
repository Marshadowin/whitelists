pcall(function()
	function getHwid() 
		local req = request or (syn and syn.request) or (Krnl and Krnl.request) or (fluxus and fluxus.request)
		local hwid = req({
		   Url = "https://httpbin.org/get",
		   Method = "GET",
		   Headers = {
			   ["Syn-Fingerprint"] = ""
		   }
		})
		function getHwid(sex)
			headers = sex.headers
			for i, v in pairs(headers) do
				if string.match(i:lower(),"print") or string.match(i:lower(),"identifier") then
					return v
				end
			end
			return game:GetService("RbxAnalyticsService"):GetClientId()
		end
		if not hwid.Success then
		   return game:GetService("RbxAnalyticsService"):GetClientId()
		end
		
		if hwid.Success then
		   local data = game:GetService("HttpService"):JSONDecode(hwid.Body)
			return getHwid(data)
		end
		return nil
	end
	local hwid = getHwid()
        setclipboard(hwid)
        game.Players.LocalPlayer:Kick("Hwid is:  " .. hwid .. " We have copyed it to your clipboard!")
end)
