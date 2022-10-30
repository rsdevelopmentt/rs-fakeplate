QBCore = exports['qb-core']:GetCoreObject() -- Core

local cooldown = false

RegisterNetEvent('rs-plate:splate-plug')
AddEventHandler('rs-plate:splate-plug', function()
    if not cooldown then
        cooldown = true
        local player = PlayerPedId()
        local closestVehicle = GetVehiclePedIsIn(player, false)
        local plateNumber = GetVehicleNumberPlateText(closestVehicle)

        if IsPedInAnyVehicle(player, false) then
            local vehSeed = GetEntitySpeed(closestVehicle)
            if vehSeed < 5 then
                local progbar = true
                QBCore.Functions.TriggerCallback('rs-plate:plate-control', function(owned, text)
                    if owned then
                        QBCore.Functions.Progressbar("plaka_degistir", Lang:t('progress.changeplate'), 15000, false, true, { -- p1: menu name, p2: yazı, p3: ölü iken kullan, p4:iptal edilebilir
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {}, {}, {}, function() -- Done
                            
                            progbar = false
                            local function getPlate()
                                local res = ""
                                for i = 1, 4 do
                                    res = res .. string.char(math.random(97, 122))
                                end
                                return string.upper(res)
                            end
                            local plate1 = getPlate()
                            local plate2 = math.random(1111,9999)
                            local newPlate = plate1 .. plate2
                            QBCore.Functions.TriggerCallback('rs-plate:plate-plug', function(status)
                                if status then
                                    SetVehicleNumberPlateText(closestVehicle, newPlate)
                                    TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', newPlate)
                                    QBCore.Functions.Notify(Lang:t('success.platechanged'), "success")
                                end
                            end, plateNumber, newPlate)
                        end, function() -- Cancel
                            progbar = false
                        end)
                    else
                        progbar = false
                        QBCore.Functions.Notify(text, "error")
                    end
                end, plateNumber)
                while progbar do
                    Citizen.Wait(100)
                end
            else
                QBCore.Functions.Notify(Lang:t('error.platedot'), "error")
            end
        else
            QBCore.Functions.Notify(Lang:t('error.platedot2'), "error")
        end
        Citizen.Wait(5000)
        cooldown = false
    else
        QBCore.Functions.Notify(Lang:t('error.cooldown'), "error")
    end
end)

RegisterNetEvent('rs-plate:splaka-shock')
AddEventHandler('rs-plate:splaka-shock', function()
    local player = PlayerPedId()
    local closestVehicle = GetVehiclePedIsIn(player, false)
    local splaka = GetVehicleNumberPlateText(closestVehicle)
    if not cooldown then
        cooldown = true
        if IsPedInAnyVehicle(player, false) then
            local vehSeed = GetEntitySpeed(closestVehicle)
            if vehSeed < 5 then
                local progbar = true
                QBCore.Functions.TriggerCallback('rs-plate:fake-plate-control', function(plaka)
                    if plaka then
                        QBCore.Functions.Progressbar("plaka_degistir", Lang:t('progress.plateremoving'), 5000, false, true, { -- p1: menu name, p2: yazı, p3: ölü iken kullan, p4:iptal edilebilir
                            disableMovement = false,
                            disableCarMovement = false,
                            disableMouse = false,
                            disableCombat = true,
                        }, {}, {}, {}, function() -- Done
                            progbar = false
                            SetVehicleNumberPlateText(closestVehicle, plaka)
                            TriggerServerEvent("rs-plate:s-plate-shock", splaka)
                            QBCore.Functions.Notify('Aracın orjinal plakasını taktın!')
                        end, function() -- Cancel
                            progbar = false
                        end)
                    else
                        progbar = false
                        QBCore.Functions.Notify(Lang:t('error.platenot'), "error")
                    end
                end, splaka)
                while progbar do
                    Citizen.Wait(100)
                end
            else
                QBCore.Functions.Notify(Lang:t('error.platedot'), "error")
            end
            
        else
            QBCore.Functions.Notify(Lang:t('error.platedot2'), "error")
        end
        Citizen.Wait(5000)
        cooldown = false
    else
        QBCore.Functions.Notify(Lang:t('error.cooldown'), "error")
    end
end)
