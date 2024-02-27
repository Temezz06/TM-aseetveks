local kytta = {
	"steam:", -- halutessasi voit lisätä poliiseja jota tämä scripti ei koske
}

RegisterServerEvent("aseetvittuun:kysyasetta")
AddEventHandler("aseetvittuun:kysyasetta", function(wea)
	local poliisi = false

	for _,k in pairs(kytta) do 
		if(k == getPlayerID(source)) then
			poliisi = true
			break;
		end
	end

	if(not poliisi) then
		print(1)
		TriggerClientEvent("aseetvittuun:drop", source, wea)
	end

end)


function getPlayerID(source)
    local pelaaja = GetPlayerIdentifiers(source)
    local kohde = getIdentifiant(pelaaja)
    return kode
end

-- Saa pelaajalle yksilöllisen pelaajatunnuksen,
-- Riippumatta siitä, vaihtaako pelaaja näyttönimeään

function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end
