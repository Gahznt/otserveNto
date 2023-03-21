function onCastSpell(cid, var)
local cloth = getCreatureOutfit(cid)
local health = getCreatureHealth(cid)
local maxhealth = getCreatureMaxHealth(cid)
local MaximoSummon = 1
 
local summons = getCreatureSummons(cid)
if(table.maxn(summons) < MaximoSummon) then 
 local pos = getPlayerPosition(cid)
 local bpos = {x=pos.x+2, y = pos.y, z = pos.z} 
 local farAwayPos = {x = 135, y = 135, z = 7} -- aqui voce coloca a position bem distante onde ninguem va se nao nao vai funfar
 local Bunshin = doCreateMonster("Bunshin", farAwayPos)
doConvinceCreature(cid, Bunshin)
setCreatureMaxHealth(Bunshin, maxhealth)
doCreatureAddHealth(Bunshin, health)
doSetCreatureOutfit(Bunshin, cloth, -1)
setCreatureName(Bunshin, "".. getCreatureName(cid) .."", "a ".. getCreatureName(cid) .."")
addEvent(doSendMagicEffect, 300, pos, 2)
addEvent(doTeleportThing, 300, Bunshin, pos)
return TRUE
end
end


