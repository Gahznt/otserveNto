local NPC = "Boss Nagato" -- nome do NPC
local monster = "Nagato"
function onDeath(cid, fromPosition, toPosition)

if getCreatureName(cid) == monster then
local pos ={x = 1050, y = 1389, z = 8}--sasori
doCreateNpc(NPC, pos)
end

return true
end