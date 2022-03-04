Config = {}
Config.CommandName = "kit" -- Komenda pod ktora odpalasz kity
Config.weaponsync = true -- Jesli uzywasz weaponsynca ustaw true jesli nie to false 
Config.itemOfAmmoName = "pistol_ammo" -- Jesli uzywasz weaponsynca
Config.CountOfAmmo = 50 -- Ilosc ammo ile ma dawac

Config.Weapons = { -- Bronie do wyboru pod /kit // Daje tylko wybrany pistolet przez gracza
        -- Jak cos tutaj dodajecie to bez weapon_
    {name = "Pistol", spawnid = "pistol"},  
    {name = "Pistol MK2", spawnid = "pistol_mk2"},
    {name = "Combat Pistol", spawnid = "combatpistol"},
    {name = "Pistol 50", spawnid = "pistol50"},
    {name = "Sns Pistol", spawnid = "snspistol"},
    {name = "Sns Pistol MK2", spawnid = "snspistol_mk2"},
    {name = "Vintage Pistol", spawnid = "vintagepistol"},
    {name = "Ceramic Pistol", spawnid = "ceramicpistol"},
}

Config.Items = { -- Itemy ktore daje po odebraniu // Daje wszystkie itemy ponizej
    {name = "bread", count = 25},
    {name = "water", count = 25}
}


-- Created by Fineeasz#1809
-- https://github.com/fineeasz