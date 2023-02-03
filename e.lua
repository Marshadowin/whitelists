  pcall(function()
        local hook; hook = hookmetamethod(game, "__namecall", function(Self,...)
            if not checkcaller() then
                local getname = getnamecallmethod()
                local args = {...}
        
                if getgenv().NoFall then
                if tostring(getname) == "FireServer" and getcallingscript().Name == "WorldClient" and type(args[1]) == "number" and type(args[2]) == "boolean" then
                    return args[1] == 0.1
                    end
                    end
                end
            return hook(Self,...)
        end)
	    
 end)
