local NPC = "Boss Kakuzo" -- nome do NPC
local monster = "Kakuzo"
function onDeath(cid, fromPosition, toPosition)

if getCreatureName(cid) == monster then
local pos ={x = 1218, y = 1134, z = 6}--sasori
doCreateNpc(NPC, pos)
end
return true
end