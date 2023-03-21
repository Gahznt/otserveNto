local NPC = "Boss Kisame" -- nome do NPC
local monster = "Kisame"
function onDeath(cid, fromPosition, toPosition)

if getCreatureName(cid) == monster then
local pos ={x = 827, y = 1063, z = 7}--sasori
doCreateNpc(NPC, pos)
end

return true
end