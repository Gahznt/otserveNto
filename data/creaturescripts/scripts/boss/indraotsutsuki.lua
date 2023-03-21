local NPC = "Indra Otsutsuki" -- nome do NPC
function onDeath(cid, fromPosition, toPosition)

if getCreatureName(cid) == NPC then
local pos = getCreaturePosition(cid)
doCreateNpc(NPC, pos)
end

return true
end