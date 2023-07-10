function Draw2DText(x, y, text, scale)
    SetTextFont(4)
    SetTextProportional(7)
    SetTextScale(scale, scale)
    SetTextColour(255, 255, 255, 255)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

speedometer = Draw2DText(0.16, 0.94, "", 0.75)

CreateThread(function()
	while true do
		Wait(0)
        local ped = PlayerPedId()
        if(IsPedSittingInAnyVehicle(ped)) then
            local vehicle = GetVehiclePedIsIn(ped, false)
            if(GetPedInVehicleSeat(vehicle, -1) == ped) then
                local speed = math.floor(GetEntitySpeed(vehicle)*3.6)
                speedometer = Draw2DText(0.16, 0.94, speed .. " km/h", 0.75)
            else
                speedometer = Draw2DText(0.16, 0.94, "", 0.75)
            end
        else
            speedometer = Draw2DText(0.16, 0.94, "", 0.75)
        end
	end
end)