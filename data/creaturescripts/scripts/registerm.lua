function onStatsChange(cid, attacker, type, combat, value)
if isMonster(attacker) and isPlayer(cid) then 
registerCreatureEvent(attacker, "Mstats")
end
return true
end