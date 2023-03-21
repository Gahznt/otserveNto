_Lib_Battle_Info = {
Reward = {
exp = {true, 31880200}, items = {true, 11255, 15}, premium_days = {false, 2}
},
TeamOne = {name = "Akatsuki", storage = 140120, pos = {x=828,y=735,z=7}},
TeamTwo = {name = "Anbu",storage = 140121,pos = {x=829,y=811,z=7}},
storage_count = 180400,
tpPos = {x=1021, y=1028, z=7},
limit_Time = 15 -- limite de tempo para adentrar o evento
}
function resetBattle()
setGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage, 0)
setGlobalStorageValue(_Lib_Battle_Info.TeamTwo.storage, 0)
end
function OpenWallBattle()
local B = {
{9121,{x=824, y=773, z=5, stackpos = 1}},
{9121,{x=825, y=773, z=5, stackpos = 1}},
{9121,{x=835, y=773, z=5, stackpos = 1}},
{9121,{x=836, y=773, z=5, stackpos = 1}}
}
for i = 1, #B do
if getTileItemById(B[i][2], B[i][1]).uid == 0 then
doCreateItem(B[i][1], 1, B[i][2])
else
doRemoveItem(getThingfromPos(B[i][2]).uid,1)
end
end
end
function doBroadCastBattle(type, msg)
for _, cid in pairs(getPlayersOnline()) do
if getPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage) >= 1 or getPlayerStorageValue(cid, _Lib_Battle_Info.TeamTwo.storage) >= 1 then
doPlayerSendTextMessage(cid,type,msg)
end
end
end
function removeBattleTp()
local t = getTileItemById(_Lib_Battle_Info.tpPos, 1387).uid
return t > 0 and doRemoveItem(t) and doSendMagicEffect(_Lib_Battle_Info.tpPos, CONST_ME_POFF)
end
function getWinnersBattle(storage)
local str, c = "" , 0
for _, cid in pairs(getPlayersOnline()) do
if getPlayerStorageValue(cid, storage) == 1 then
if _Lib_Battle_Info.Reward.exp[1] == true then doPlayerAddExperience(cid, _Lib_Battle_Info.Reward.exp[2]) end
if _Lib_Battle_Info.Reward.items[1] == true then doPlayerAddItem(cid, _Lib_Battle_Info.Reward.items[2], _Lib_Battle_Info.Reward.items[3]) end
if _Lib_Battle_Info.Reward.premium_days[1] == true then doPlayerAddPremiumDays(cid, _Lib_Battle_Info.Reward.premium_days[2]) end
doRemoveCondition(cid, CONDITION_OUTFIT)
doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
setPlayerStorageValue(cid, storage, -1)
c = c+1 
end
end
str = str .. ""..c.." Jogador"..(c > 1 and "s" or "").." do time "..(getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage) == 0 and _Lib_Battle_Info.TeamTwo.name or _Lib_Battle_Info.TeamOne.name).." ganhou a batalha Akatsuki Vs Anbu!"
resetBattle()
OpenWallBattle()
return doBroadcastMessage(str)
end
function CheckEvent(delay)
if delay > 0 and getGlobalStorageValue(_Lib_Battle_Info.storage_count) > 0 then
doBroadcastMessage("[Akat Vs Anbu Event] Esta esperando "..getGlobalStorageValue(_Lib_Battle_Info.storage_count).." jogadores para iniciar a batalha !")
elseif delay == 0 and getGlobalStorageValue(_Lib_Battle_Info.storage_count) > 0 then
for _, cid in pairs(getPlayersOnline()) do
if getPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage) >= 1 or getPlayerStorageValue(cid, _Lib_Battle_Info.TeamTwo.storage) >= 1 then
doRemoveCondition(cid, CONDITION_OUTFIT)
doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
setPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage, -1)
setPlayerStorageValue(cid, _Lib_Battle_Info.TeamTwo.storage, -1)
end
end
doBroadcastMessage("O Evento nao iniciou por nao haver jogadores suficientes.")
setGlobalStorageValue(_Lib_Battle_Info.storage_count, 0)
resetBattle()
removeBattleTp()
end
addEvent(CheckEvent, 60000, delay-1)
end