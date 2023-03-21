function onCastSpell(cid, var)

if getPlayerStorageValue(cid, 333312) < os.time () then
setPlayerStorageValue(cid, 333312, os.time () + 8)  -- 5 = 5 segundos
local playerpos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local trapos = getCreaturePosition(target)
local level = getPlayerLevel(cid)

local numero1 = (1500)
local numero2 = (3000)

for i = numero1, numero2 do
levelz = (math.random(numero2))
end

doCreatureAddHealth(target, -levelz)
doSendAnimatedText(trapos, levelz, COLOR_PURPLE)
doCreatureAddHealth(cid, levelz)

addEvent(doSendDistanceShoot, 1, trapos, playerpos, 132)
addEvent(doSendMagicEffect, 1, playerpos, 5)
else
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde "..getPlayerStorageValue(cid, 333312) - os.time ().. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
return true
end