local NPC = "Boss Kabuto" -- nome do NPC
local monster = "Kabuto"
function onDeath(cid, fromPosition, toPosition)

if getCreatureName(cid) == monster then
local pos ={x = 912, y = 1341, z = 7}
doCreateNpc(NPC, pos)
end

return true
end