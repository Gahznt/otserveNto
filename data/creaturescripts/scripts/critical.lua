--[[Critical System
-------------------------  By Night Wolf]]


local lvlcrit = 48910
local multiplier = 3.00


function onStatsChange(cid, attacker, type, combat, value)
if isPlayer(attacker) and (not (attacker == cid)) and (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS)  then
if (getPlayerStorageValue(attacker, lvlcrit)*20) >= math.random (0,1000) then
dano = math.ceil(value*(multiplier))
doTargetCombatHealth(attacker, cid, combat, -dano, -dano, 17)
return false
end
end
return true
end