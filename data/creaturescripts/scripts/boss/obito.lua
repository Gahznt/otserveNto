local NPC = "Boss Obito" -- nome do NPC
local monster = "Obito"
function onDeath(cid, fromPosition, toPosition)

if getCreatureName(cid) == monster then
local pos ={x = 973, y = 1011, z = 7}
doCreateNpc(NPC, pos)
end

return true
end