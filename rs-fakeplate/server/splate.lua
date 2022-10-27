QBCore = exports['qb-core']:GetCoreObject() -- Core

local plates = {}

QBCore.Functions.CreateCallback('rs-plate:plate-control', function(source, cb, plate)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if xPlayer then  
        if plates[plate] then
            cb(false, Lang:t('error.plateinstalled'))
        else
            cb(true)
        end
    end
end)

QBCore.Functions.CreateUseableItem("screwdriver", function(source, item)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if TriggerClientEvent("rs-plate:splaka-shock", source) then
    xPlayer.Functions.RemoveItem("screwdriver", 1) 
    end
end)

QBCore.Functions.CreateUseableItem("splaka", function(source, item)
    TriggerClientEvent("rs-plate:splate-plug", source)
end)

QBCore.Functions.CreateCallback('rs-plate:plate-plug', function(source, cb, plaka, orjinalp)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if xPlayer.Functions.RemoveItem("splaka", 1) then
        plates[orjinalp] = plaka
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('rs-plate:fake-plate-control', function(source, cb, plate)
    if plates[plate] then 
        cb(plates[plate])
    else
        cb(false)
    end
end)

RegisterNetEvent('rs-plate:s-plaka-shock')
AddEventHandler('rs-plate:s-plaka-shock', function(plaka, orjinalp)
    if plakalar[plate] then 
        plakalar[plate] = nil
    end
end)