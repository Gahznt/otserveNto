local NPC = "Boss Orochimaru" -- nome do NPC
local monster = "Orochimaru"
function onDeath(cid, fromPosition, toPosition)

if getCreatureName(cid) == monster then
local pos ={x = 936, y = 1213, z = 8}--sasori
doCreateNpc(NPC, pos)
end

return true
end