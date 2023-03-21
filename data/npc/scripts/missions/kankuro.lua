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
local stor_a = 13242
local item_m = 8931
local qtd_m = 600
local item_r = 11226
local xp_a =  117700 --40700, 74200, 117700


if(msgcontains(msg, 'ajuda') or msgcontains(msg, 'ajudar')) then
selfSay('Você está com todos os items em sua backpack, prontos para entregar ? {entregar}', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'entregar') and talkState[talkUser] == 1) then
if(getPlayerStorageValue(cid, stor_a) < 1 ) then
if(getPlayerItemCount(cid, item_m) >= qtd_m ) then
doPlayerRemoveItem(cid, item_m, qtd_m)
doPlayerAddItem(cid, item_r, 1)
doPlayerAddExp(cid, xp_a)
setPlayerStorageValue(cid, stor_a, 1)
setPlayerStorageValue(cid, task_sys_storages[2], (getTaskPoints(cid)+1))
doPlayerPopupFYI(cid, "Parabéns, você ganhou um novo item !")
selfSay('Obrigado.', cid)
else
selfSay('Você precisa analisar minha proposta, não está com todos os items em mãos!.', cid)
end
else
selfSay('Obrigado, mas você já me ajudou uma vez.', cid)
end
talkState[talkUser] = 0

end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())