ESX = nil
local kod_color = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("blahkhan_kody:process")
AddEventHandler("blahkhan_kody:process", function(Player, kod)
  kod_color = kod
  for playerId in ipairs(GetPlayers()) do
    TriggerClientEvent('blahkhan_kody:show_kod', playerId, kod, 'LSPD wprowadziło kod', playerId)
  end
end)

RegisterNetEvent("blahkhan_kody:check")
AddEventHandler("blahkhan_kody:check", function()
  TriggerClientEvent('blahkhan_kody:kod_check', source, kod_color)
end)
