local NPC = "Boss Kimimaru" -- nome do NPC
local monster = "Kimimaru"
function onDeath(cid, fromPosition, toPosition)

if getCreatureName(cid) == monster then
local pos ={x = 942, y = 1144, z = 8}--sasori
doCreateNpc(NPC, pos)
end

return true
end