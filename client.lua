function notify(message)
    SetTextComponentFormat("STRING")
    AddTextComponentString(message)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end 

Ispressed = false

Config = {}
Config.Bayil = 303
Config.AyagaKalk = 38
Config.Bildirim = "Bayıldın kalkmak için ~INPUT_PICKUP~ tuşuna basmalısın."

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        player = GetPlayerPed(-1)
        IsInVehicle = GetVehiclePedIsIn(player, false)
        IsEnteringVehicle = GetVehiclePedIsEntering(player)

        if IsControlJustPressed(1, Config.Bayil) then 
            IsPressed = true

            if IsEnteringVehicle ~= 0 then
                IsPressed = false 
            end

            if IsInVehicle ~= 0 then
                IsPressed = false 
            end
        end

        if IsPressed then
            SetPedToRagdoll(player, 1000, 1000, 0, true, true, true)
            DisableControlAction(0, 24, true)
            notify(Config.Bildirim)
        end

        if IsControlJustPressed(1, Config.AyagaKalk) then 
            IsPressed = false
            Wait(2500)
        end
    end
end)
