function isSummon(cid) -- baseada na função do Vodkart
        if getCreatureMaster(cid) then
                return true
        end
        return false
end
function onStatsChange(cid, attacker, type, combat, value)
if isSummon(cid) then
return true
elseif isMonster(attacker) then
return false
end
return true
end