ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand(Config.CommandName, function(src)
	local xPlayer = ESX.GetPlayerFromId(src)
    local result = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier
    })

    if result[1].kit == "nie" then 
        TriggerClientEvent("esx_kity:FineeaszOdpalMenu", src)
    elseif result[1].kit == "tak" then 
        TriggerClientEvent('esx:showNotification', src, "~r~Juz odebrales kita")
    end
end)

RegisterServerEvent('esx_kity:FineeaszDajKit')
AddEventHandler('esx_kity:FineeaszDajKit', function(bron)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

    local result = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier
    })

    if result[1].kit == "nie" then 
    if Config.weaponsync then 
        xPlayer.addInventoryItem(bron, 1)	
        xPlayer.addInventoryItem(Config.itemOfAmmoName, Config.CountOfAmmo)	
    elseif not Config.weaponsync then
        xPlayer.addWeapon("weapon_"..bron, Config.CountOfAmmo)
    end

    for k,v in pairs(Config.Items) do
        xPlayer.addInventoryItem(v.name, v.count)	
    end

    MySQL.Async.execute('UPDATE users SET kit = @kit WHERE identifier = @identifier',
	{
		['@kit'] = "tak",
		['@identifier'] = xPlayer.identifier
	})
    TriggerClientEvent('esx:showNotification', _source, "~g~Pomyslnie otrzymales kita.")
    print("(ESX_KITY) Gracz ".. GetPlayerName(_source) .." Odebral Kita.")
    elseif result[1].kit == "tak" then 
    TriggerClientEvent('esx:showNotification', _source, "~r~Juz odebrales kita")
    end
end)

-- Created by Fineeasz#1809
-- https://github.com/fineeasz