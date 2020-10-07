ESX = nil
local LEO = {"police", "sheriff", "state"}
local Emergency = {"police", "sheriff", "state", "ambulance"}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function has_value (tab, val)
    for index, value in pairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

function has_index (tab, ind)
    for index, value in pairs(tab) do
        if index == ind then
            return true
        end
    end
    return false
end

Citizen.CreateThread(function()
	while true do
		Wait(5000)
		local jobsOnline = {}
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			local job = xPlayer.job.name
			if jobsOnline.total == nil then
				jobsOnline.total = 1
			else
				jobsOnline.total = jobsOnline.total + 1
			end
			if has_index(jobsOnline, job) then
				jobsOnline.job = jobsOnline.job + 1
			else
				jobsOnline[job] = 1
			end
		end
		
		jobsOnline.cops = 0
		jobsOnline.emergency = 0
		
		for k, v in pairs(jobsOnline) do
			if has_value(LEO, k) then
				jobsOnline.cops = jobsOnline.cops + v
			end
			if has_value(Emergency, k) then
				jobsOnline.emergency = jobsOnline.emergency + v
			end
		end
		
		TriggerClientEvent('dd_jobsonline:update', -1, jobsOnline)
	end
end)
