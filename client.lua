Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function MenuKitow()
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'FineeaszMenuGracza',
	{
	  title    = 'KITY',
	  align    = 'center',
	  elements = {
		{label = 'Kit Gracz', value = 'kitgracz'},
	  }
	},
	function(data, menu)
        if data.current.value == 'kitgracz' then
            MenuBroniGracz()
		end
	end,
	function(data, menu)
	  menu.close()
	end)
end

function MenuBroniGracz()
    local elements = {}

    for k,v in pairs(Config.Weapons) do
        table.insert(elements, {
            label = v.name,
            value = v.spawnid,
        })
        
    ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'FineeaszDojebaneKity',
	{
	  title    = 'Wybierz bron',
	  align    = 'center',
	  elements = elements
	},
	function(data, menu)
        if data.current.value == data.current.value then
            TriggerServerEvent("esx_kity:FineeaszDajKit", data.current.value)
            menu.close()
		end
	end,
	function(data, menu)
	  menu.close()
	    end)
    end
end

RegisterNetEvent('esx_kity:FineeaszOdpalMenu')
AddEventHandler('esx_kity:FineeaszOdpalMenu', function()
	MenuKitow()
end)


-- Created by Fineeasz#1809
-- https://github.com/fineeasz