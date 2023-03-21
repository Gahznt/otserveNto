function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
local waittime = 45 -- Tempo de exhaustion
local storage = 3554

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local spell_storage = 42516

if getPlayerStorageValue(cid, spell_storage) < 50 then
doPlayerAddItem(cid, 2399, 25)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
elseif getPlayerStorageValue(cid, spell_storage) == 50 then
doPlayerAddItem(cid, 2399, 25)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
doPlayerSendTextMessage(cid, 22, "Seu jutsu progrediu para o level 2")
doSendMagicEffect(getCreaturePosition(cid),28)
doSendAnimatedText(getCreaturePosition(cid), 'Jutsu UP', 210)
elseif getPlayerStorageValue(cid, spell_storage) > 50 and getPlayerStorageValue(cid, spell_storage) < 150 then
doPlayerAddItem(cid, 3964, 25)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
elseif getPlayerStorageValue(cid, spell_storage) == 150 then
doPlayerAddItem(cid, 3964, 25)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
doPlayerSendTextMessage(cid, 22, "Seu jutsu progrediu para o level 3")
doSendMagicEffect(getCreaturePosition(cid),28)
doSendAnimatedText(getCreaturePosition(cid), 'Jutsu UP', 210)
elseif getPlayerStorageValue(cid, spell_storage) > 150 then
doPlayerAddItem(cid, 2168, 25)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
end
doPlayerSay(cid, 'Fuinjutsu Weapons !', TALKTYPE_ORANGE_1)
exhaustion.set(cid, storage, waittime)
return TRUE
end