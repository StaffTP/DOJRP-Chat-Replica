local isAllowed = nil

RegisterNetEvent('chatCommand:sendMessage')
AddEventHandler('chatCommand:sendMessage', function(type, playerId, playerName, message, sourcePos, proximity)

      local pos = GetEntityCoords(GetPlayerPed(-1), false)

      if(type == "me" or type == "mer" or type == "ooc")then -- proximity commands

        if(sourcePos.x == 0.0 and sourcePos.y == 0.0 and sourcePos.z == 0.0)then -- onesync check
          sourcePos = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerId)))
        end

        local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) -- distance between sender and receiver

        if (distance < proximity) then

          if(type == "me")then
            if(playerId == GetPlayerServerId(PlayerId()))then
              TriggerEvent("chatMessage", "^3> ^0" .. playerName .. " (#" .. playerId .. "):", "normal", message)
            else
              TriggerEvent("chatMessage", "^3> ^0" .. playerName .. " (#" .. playerId .. ") (" .. round(distance,1) .. "m):", "normal", message)
            end
          elseif(type == "mer")then
            TriggerEvent("chatMessage", "^3> ^0" .. playerName .. " (#" .. playerId .. "):", "normal", "^1" .. message)
          elseif(type == "ooc")then
            TriggerEvent("chatMessage", "^3[OOC] " .. playerName .. " (#" .. playerId .. ")^0:", "normal", message) --Global OOC
          end
        end

      elseif(type == "gme")then
        TriggerEvent("chatMessage", "^1> ^0" .. playerName .. " (#" .. playerId .. "):", "normal", message) --Global Me
      elseif(type == "do")then
        TriggerEvent("chatMessage", "^4" .. playerName .. " (#" .. playerId .. "):", "normal", message) --Global Do
      elseif(type == "dor")then
        TriggerEvent("chatMessage", "^4" .. playerName .. " (#" .. playerId .. "):", "normal", "^1" .. message) --Global Do
      elseif(type == "radio")then
        if isAllowed then
          TriggerEvent("chatMessage", "^2[Radio] " .. playerName .. " (#" .. playerId .. ")^0:", "normal", message) --Global Radio
        end
      elseif(type == "dispatch")then
        TriggerEvent("chatMessage", "^1[County Dispatch]^0:", "normal", message) --Global Dispatch
      elseif(type == "gooc")then
        TriggerEvent("chatMessage", "^3[GOOC] " .. playerName .. " (#" .. playerId .. ")^0:", "normal", message) --Global OOC
      elseif(type == "911")then
        TriggerEvent("chatMessage", "^8[911]^7:", "normal", "^7" .. message) --Global OOC
      end
end)


function round(number, decimals) -- from stackoverflow
  local power = 10^decimals
  return math.floor(number * power) / power
end

Citizen.CreateThread(function()
  TriggerServerEvent("chatCommand:isAllowed", GetPlayerServerId(PlayerId()))
end)

RegisterNetEvent("chatCommand:AceAllowed")
AddEventHandler("chatCommand:AceAllowed", function(value)
  isAllowed = value
end)