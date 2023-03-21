local NPC = "Boss Itachi" -- nome do NPC
local monster = "Itachi"

function onDeath(cid, fromPosition, toPosition)

if getCreatureName(cid) == monster then
local pos ={x = 762, y = 758, z = 6}--sasori
doCreateNpc(NPC, pos)
end
return true
end