local aseet = {
	0x1D073A89, -- ShotGun
	0x83BF0278, -- Carbine
	0x5FC3C11, -- Sniper
}


local autossa = false

local asekannossa = {}

Citizen.CreateThread(function()

	while true do
		Citizen.Wait(0)

		if(IsPedInAnyPoliceVehicle(GetPlayerPed(-1))) then
			if(not autossa) then
				autossa = true
			end
		else
			if(autossa) then
				for i,k in pairs(aseet) do
					if(not asekannossa[i]) then
						TriggerServerEvent("aseetvittuun:kysyasetta",k)
					end
				end
				autossa = false
			end
		end

	end

end)


Citizen.CreateThread(function()

	while true do
		Citizen.Wait(0)
		if(not IsPedInAnyVehicle(GetPlayerPed(-1))) then
			for i=1,#aseet do
				if(HasPedGotWeapon(GetPlayerPed(-1), aseet[i], false)==1) then
					asekannossa[i] = true
				else
					asekannossa[i] = false
				end
			end
		end
		Citizen.Wait(5000)
	end

end)


RegisterNetEvent("aseetvittuun:drop")
AddEventHandler("aseetvittuun:drop", function(wea)
	RemoveWeaponFromPed(GetPlayerPed(-1), wea)
end)
