local NPC = "Boss Danzou" -- nome do NPC
local monster = "Danzou"
function onDeath(cid, fromPosition, toPosition)

if getCreatureName(cid) == monster then
local pos ={x = 1002, y = 998, z = 4}
doCreateNpc(NPC, pos)
end

return true
end