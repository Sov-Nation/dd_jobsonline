ESX = nil
local LEO = {'police', 'sheriff', 'state'}
local copson = {['cops'] = 0, ['police'] = 0, ['sheriff'] = 0, ['state'] = 0}
local total = 0
local police = 0
local sheriff = 0
local state = 0

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
	while true do
		local xPlayers = ESX.GetPlayers()
		Wait(500)
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if has_value(LEO, xPlayer.job.name) then
				total = total + 1
			end
		end
		copson['cops'] = total
		total = 0
		
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'police' then
				police = police + 1
			end
		end
		copson['police'] = police
		police = 0
		
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'sheriff' then
				sheriff = sheriff + 1
			end
		end
		copson['sheriff'] = sheriff
		sheriff = 0
		
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'state' then
				state = state + 1
			end
		end
		copson['state'] = state
		state = 0
		
		-- print('dd_copson:')
		-- for k, v in pairs(copson) do
		  -- print(k, v)
		-- end
		
		TriggerClientEvent('dd_copson:update', -1, copson)
	end
end)
