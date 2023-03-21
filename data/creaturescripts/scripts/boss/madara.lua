local NPC = "Boss Madara" -- nome do NPC
local monster = "Madara"
function onDeath(cid, fromPosition, toPosition)

if getCreatureName(cid) == monster then
local pos ={x = 503, y = 1459, z = 10}--sasori
doCreateNpc(NPC, pos)
end
return true
end