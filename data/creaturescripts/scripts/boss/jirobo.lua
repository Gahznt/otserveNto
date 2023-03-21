local NPC = "Boss Jirobo" -- nome do NPC
local monster = "Jirobo"
function onDeath(cid, fromPosition, toPosition)

if getCreatureName(cid) == monster then
local pos ={x = 1094, y = 1166, z = 7}--sasori
doCreateNpc(NPC, pos)
end

return true
end