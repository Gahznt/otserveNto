local NPC = "Boss Zabuza" -- nome do NPC
local monster = "Zabuza Momochi"
function onDeath(cid, fromPosition, toPosition)

if getCreatureName(cid) == monster then
local pos ={x = 957, y = 1063, z = 6}
doCreateNpc(NPC, pos)
end

return true
end