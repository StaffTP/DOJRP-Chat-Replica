RegisterCommand("me", function(source, args, rawCommand)
    local message = table.concat(args, " ")

    TriggerClientEvent("chatCommand:sendMessage", -1, "me", source, GetPlayerName(source), message, GetEntityCoords(GetPlayerPed(source)), chatCommand.MeProximity)

end, false)

RegisterCommand("gme", function(source, args, rawCommand)
    local message = table.concat(args, " ")
    
    TriggerClientEvent("chatCommand:sendMessage", -1, "gme", source, GetPlayerName(source), message, false, false)

end, false)

RegisterCommand("mer", function(source, args, rawCommand)
    local message = table.concat(args, " ")
    
    TriggerClientEvent("chatCommand:sendMessage", -1, "mer", source, GetPlayerName(source), message, GetEntityCoords(GetPlayerPed(source)), chatCommand.MerProximity)

end, false)

RegisterCommand("do", function(source, args, rawCommand)
    local message = table.concat(args, " ")
    
    TriggerClientEvent("chatCommand:sendMessage", -1, "do", source, GetPlayerName(source), message, false, false)

end, false)

RegisterCommand("dispatch", function(source, args, rawCommand)
    local message = table.concat(args, " ")
    
    TriggerClientEvent("chatCommand:sendMessage", -1, "dispatch", source, GetPlayerName(source), message, false, false)

end, false)

RegisterServerEvent('chatCommand:isAllowed')
AddEventHandler('chatCommand:isAllowed', function(source)
    TriggerClientEvent("chatCommand:AceAllowed", source, IsPlayerAceAllowed(source, "chatCommand.radio")) 
end)

RegisterCommand("radio", function(source, args, rawCommand)
    local message = table.concat(args, " ")
    if IsPlayerAceAllowed(source, "chatCommand.radio") then
        TriggerClientEvent("chatCommand:sendMessage", -1, "radio", source, GetPlayerName(source), message, false, false)
    end
end, false)

RegisterCommand("ooc", function(source, args, rawCommand)
    local message = table.concat(args, " ")
    
    TriggerClientEvent("chatCommand:sendMessage", -1, "ooc", source, GetPlayerName(source), message, GetEntityCoords(GetPlayerPed(source)), chatCommand.OocProximity)

end, false)

RegisterCommand("gooc", function(source, args, rawCommand)
    local message = table.concat(args, " ")
    
    TriggerClientEvent("chatCommand:sendMessage", -1, "gooc", source, GetPlayerName(source), message, false, false)

end, false)

RegisterCommand("911", function(source, args, rawCommand)
    local message = table.concat(args, " ")
    
    TriggerClientEvent("chatCommand:sendMessage", -1, "911", source, GetPlayerName(source), message, false, false)

end, false)

