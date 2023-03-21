local NPC = "Boss Konan" -- nome do NPC
local monster = "Konan"
function onDeath(cid, fromPosition, toPosition)

if getCreatureName(cid) == monster then
local pos ={x = 1197, y = 1322, z = 5}--sasori
doCreateNpc(NPC, pos)
end

return true
end