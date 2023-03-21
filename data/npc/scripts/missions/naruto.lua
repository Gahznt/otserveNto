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
local stor_z = 89455
local stor_a = 15073
local item_m = 11329
local qtd_m = 500
local xp_a =  117700 --40700, 74200, 117700

local item_h = 10602
local item_a = 10603
local item_l = 10605
local item_b = 10606
local item_s = 11229

if(msgcontains(msg, 'ajudar') or msgcontains(msg, 'ajudar')) then
selfSay('O que deseja em troca ? {bandana} - {armor} - {legs} - {boots} - {shield}', cid)
talkState[talkUser] = 1

elseif(msgcontains(msg, 'bandana') and talkState[talkUser] == 1) then
if(getPlayerStorageValue(cid, stor_z) >= 1 ) then
if(getPlayerStorageValue(cid, stor_a) < 1 ) then
if(getPlayerItemCount(cid, item_m) >= qtd_m ) then
doPlayerRemoveItem(cid, item_m, qtd_m)
doPlayerAddItem(cid, item_h, 1)
doPlayerAddExp(cid, xp_a)
setPlayerStorageValue(cid, task_sys_storages[2], (getTaskPoints(cid)+1))
doPlayerPopupFYI(cid, "Parabéns, você ganhou um novo item !")
setPlayerStorageValue(cid, stor_a, 1)
selfSay('Obrigado.', cid)
else
selfSay('Você precisa analisar minha proposta, não está com todos os items em mãos!.', cid)
end
else
selfSay('Somente um hokage como eu poderá me ajudar.', cid)
end
else
selfSay('Obrigado, mas você precisa ser hokage também.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'armor') and talkState[talkUser] == 1) then
if(getPlayerStorageValue(cid, stor_z) >= 1 ) then
if(getPlayerStorageValue(cid, stor_a) < 1 ) then
if(getPlayerItemCount(cid, item_m) >= qtd_m ) then
doPlayerRemoveItem(cid, item_m, qtd_m)
doPlayerAddItem(cid, item_a, 1)
doPlayerAddExp(cid, xp_a)
setPlayerStorageValue(cid, task_sys_storages[2], (getTaskPoints(cid)+1))
doPlayerPopupFYI(cid, "Parabéns, você ganhou um novo item !")
setPlayerStorageValue(cid, stor_a, 1)
selfSay('Obrigado.', cid)
else
selfSay('Você precisa analisar minha proposta, não está com todos os items em mãos!.', cid)
end
else
selfSay('Somente um hokage como eu poderá me ajudar.', cid)
end
else
selfSay('Obrigado, mas você precisa ser hokage também.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'legs') and talkState[talkUser] == 1) then
if(getPlayerStorageValue(cid, stor_z) >= 1 ) then
if(getPlayerStorageValue(cid, stor_a) < 1 ) then
if(getPlayerItemCount(cid, item_m) >= qtd_m ) then
doPlayerRemoveItem(cid, item_m, qtd_m)
doPlayerAddItem(cid, item_l, 1)
doPlayerAddExp(cid, xp_a)
setPlayerStorageValue(cid, task_sys_storages[2], (getTaskPoints(cid)+1))
doPlayerPopupFYI(cid, "Parabéns, você ganhou um novo item !")
setPlayerStorageValue(cid, stor_a, 1)
selfSay('Obrigado.', cid)
else
selfSay('Você precisa analisar minha proposta, não está com todos os items em mãos!.', cid)
end
else
selfSay('Somente um hokage como eu poderá me ajudar.', cid)
end
else
selfSay('Obrigado, mas você precisa ser hokage também.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'boots') and talkState[talkUser] == 1) then
if(getPlayerStorageValue(cid, stor_z) >= 1 ) then
if(getPlayerStorageValue(cid, stor_a) < 1 ) then
if(getPlayerItemCount(cid, item_m) >= qtd_m ) then
doPlayerRemoveItem(cid, item_m, qtd_m)
doPlayerAddItem(cid, item_b, 1)
doPlayerAddExp(cid, xp_a)
setPlayerStorageValue(cid, task_sys_storages[2], (getTaskPoints(cid)+1))
doPlayerPopupFYI(cid, "Parabéns, você ganhou um novo item !")
setPlayerStorageValue(cid, stor_a, 1)
selfSay('Obrigado.', cid)
else
selfSay('Você precisa analisar minha proposta, não está com todos os items em mãos!.', cid)
end
else
selfSay('Somente um hokage como eu poderá me ajudar.', cid)
end
else
selfSay('Obrigado, mas você precisa ser hokage também.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'shield') and talkState[talkUser] == 1) then
if(getPlayerStorageValue(cid, stor_z) >= 1 ) then
if(getPlayerStorageValue(cid, stor_a) < 1 ) then
if(getPlayerItemCount(cid, item_m) >= qtd_m ) then
doPlayerRemoveItem(cid, item_m, qtd_m)
doPlayerAddItem(cid, item_s, 1)
doPlayerAddExp(cid, xp_a)
setPlayerStorageValue(cid, task_sys_storages[2], (getTaskPoints(cid)+1))
doPlayerPopupFYI(cid, "Parabéns, você ganhou um novo item !")
setPlayerStorageValue(cid, stor_a, 1)
selfSay('Obrigado.', cid)
else
selfSay('Você precisa analisar minha proposta, não está com todos os items em mãos!.', cid)
end
else
selfSay('Somente um hokage como eu poderá me ajudar.', cid)
end
else
selfSay('Obrigado, mas você precisa ser hokage também.', cid)
end
talkState[talkUser] = 0

end


return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())