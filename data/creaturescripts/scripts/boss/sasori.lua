local NPC = "Boss Sasori" -- nome do NPC
local monster = "Sasori"
function onDeath(cid, fromPosition, toPosition)

if getCreatureName(cid) == monster then
local pos ={x = 595, y = 1141, z = 5}--sasori
doCreateNpc(NPC, pos)
end
return true
end