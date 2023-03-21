local NPC = "Boss Hagoromo" -- nome do NPC
local monster = "Hagoromo"

function onDeath(cid, fromPosition, toPosition)

if getCreatureName(cid) == monster then
local pos = getCreaturePosition(cid)
doCreateNpc(NPC, pos)
end

return true
end