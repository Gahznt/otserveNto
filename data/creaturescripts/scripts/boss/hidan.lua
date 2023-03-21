local NPC = "Boss Hidan" -- nome do NPC
local monster = "Hidan"

function onDeath(cid, fromPosition, toPosition)

if getCreatureName(cid) == monster then
local pos ={x = 1105, y = 1124, z = 6}--sasori
doCreateNpc(NPC, pos)
end

return true
end