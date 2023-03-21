local NPC = "Boss Kaguya" -- nome do NPC
local monster = "Kaguya"
function onDeath(cid, fromPosition, toPosition)

if getCreatureName(cid) == monster then
local pos = getCreaturePosition(cid)
doCreateNpc(NPC, pos)
end

return true
end