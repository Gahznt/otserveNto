local NPC = "Boss Mizuki"
local monster = "Mizuki"
function onDeath(cid, fromPosition, toPosition)

if getCreatureName(cid) == monster then
local pos ={x = 1059, y = 1126, z = 7}--sasori
doCreateNpc(NPC, pos)
end
return true
end