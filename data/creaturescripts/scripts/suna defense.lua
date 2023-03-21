local config = { 
-- storage = 3433301, kawarimi
storage = 3727678,
effect1 = 141 --- efeito ao ser atacado estando invulnerável
} 


function onStatsChange(cid, attacker, type, combat, value)
local pos = getCreaturePosition(cid)

if value >= 1 and (type == STATSCHANGE_HEALTHLOSS or (getCreatureCondition(cid, CONDITION_MANASHIELD) and type == STATSCHANGE_MANALOSS))  then
if getPlayerStorageValue(cid,config.storage) - os.time() > 0 and isCreature(attacker) then
doSendMagicEffect({x = pos.x+1, y = pos.y+1, z = pos.z}, config.effect1)
doSendAnimatedText(getCreaturePosition(cid), "Protected", 180)
return false
end
end
return true
end