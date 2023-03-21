local NPC = "Boss Deidara" -- nome do NPC
local monster = "Deidara"
function onDeath(cid, fromPosition, toPosition)

if getCreatureName(cid) == monster then
local pos ={x = 871, y = 1087, z = 5}--sasori
doCreateNpc(NPC, pos)
end

return true
end