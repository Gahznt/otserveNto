local NPC = "Boss Tobi" -- nome do NPC
local monster = "Tobi"
function onDeath(cid, fromPosition, toPosition)

if getCreatureName(cid) == monster then
local pos ={x = 1065, y = 1344, z = 6}--sasori
doCreateNpc(NPC, pos)
end

return true
end