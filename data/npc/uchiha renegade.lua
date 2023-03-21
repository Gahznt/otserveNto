local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
domodlib('task_func')
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end

local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local stor_a = 13545
local stor_b = 13546
local stor_c = 13547
local stor_d = 13548
local item_m = 11207
local qtd_m = 50
local item_a = 2466
local item_b = 2462
local item_c = 2464
local item_d = 2468




if(msgcontains(msg, 'protector') or msgcontains(msg, 'helmet')) then
selfSay('Isso vai te custar 50x Shisui Sharingan {entregar}', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'entregar') and talkState[talkUser] == 1) then
if(getPlayerStorageValue(cid, stor_a) < 1 ) then
if(getPlayerItemCount(cid, item_m) >= qtd_m ) then
doPlayerRemoveItem(cid, item_m, qtd_m)
doPlayerAddItem(cid, item_a, 1)
setPlayerStorageValue(cid, stor_a, 1)
selfSay('Obrigado.', cid)
else
selfSay('Você não está com todos os items em mãos!.', cid)
end
else
selfSay('Obrigado, mas já te ajudei uma vez.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'coat') or msgcontains(msg, 'armor')) then
selfSay('Isso vai te custar 50x Shisui Sharingan {entregar}', cid)
talkState[talkUser] = 2
elseif(msgcontains(msg, 'entregar') and talkState[talkUser] == 2) then
if(getPlayerStorageValue(cid, stor_b) < 1 ) then
if(getPlayerItemCount(cid, item_m) >= qtd_m ) then
doPlayerRemoveItem(cid, item_m, qtd_m)
doPlayerAddItem(cid, item_b, 1)
setPlayerStorageValue(cid, stor_b, 1)
selfSay('Obrigado.', cid)
else
selfSay('Você não está com todos os items em mãos!.', cid)
end
else
selfSay('Obrigado, mas já te ajudei uma vez.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'legs') or msgcontains(msg, 'legs')) then
selfSay('Isso vai te custar 50x Shisui Sharingan {entregar}', cid)
talkState[talkUser] = 3
elseif(msgcontains(msg, 'entregar') and talkState[talkUser] == 3) then
if(getPlayerStorageValue(cid, stor_c) < 1 ) then
if(getPlayerItemCount(cid, item_m) >= qtd_m ) then
doPlayerRemoveItem(cid, item_m, qtd_m)
doPlayerAddItem(cid, item_c, 1)
setPlayerStorageValue(cid, stor_c, 1)
selfSay('Obrigado.', cid)
else
selfSay('Você não está com todos os items em mãos!.', cid)
end
else
selfSay('Obrigado, mas já te ajudei uma vez.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'boots') or msgcontains(msg, 'boot')) then
selfSay('Isso vai te custar 50x Shisui Sharingan {entregar}', cid)
talkState[talkUser] = 4
elseif(msgcontains(msg, 'entregar') and talkState[talkUser] == 4) then
if(getPlayerStorageValue(cid, stor_d) < 1 ) then
if(getPlayerItemCount(cid, item_m) >= qtd_m ) then
doPlayerRemoveItem(cid, item_m, qtd_m)
doPlayerAddItem(cid, item_d, 1)
setPlayerStorageValue(cid, stor_d, 1)
selfSay('Obrigado.', cid)
else
selfSay('Você não está com todos os items em mãos!.', cid)
end
else
selfSay('Obrigado, mas já te ajudei uma vez.', cid)
end
talkState[talkUser] = 0

end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())