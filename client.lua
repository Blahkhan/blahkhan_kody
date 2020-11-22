local location1 = vector3(-458.76, -2274.54, 8.52)
local timer = 0.0
local PlayerData = {}
local ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterCommand("kod", function(source, args, rawCommand)
  local playerPed = GetPlayerPed(-1)
  PlayerData = ESX.GetPlayerData(GetPlayerPed(-1))
  if ESX.GetPlayerData().job.name == 'police' or ESX.GetPlayerData().job.grade.name == 'boss' then
    TriggerServerEvent("blahkhan_kody:process", PlayerData, args[1])
  end
end,false)

RegisterCommand("sprawdzkod", function()
  local playerPed = GetPlayerPed(-1)
  PlayerData = ESX.GetPlayerData(GetPlayerPed(-1))
  TriggerServerEvent("blahkhan_kody:check")
end)

RegisterNetEvent('blahkhan_kody:kod_check')
AddEventHandler('blahkhan_kody:kod_check', function(kod)
  exports['mythic_notify']:DoLongHudText('inform', "Jest kod " .. kod)
end)

RegisterNetEvent('blahkhan_kody:show_kod')
AddEventHandler('blahkhan_kody:show_kod', function(kod, mess, id)
  local wiad = mess .. " " .. kod
  exports['mythic_notify']:DoLongHudText('inform', wiad)
end)
