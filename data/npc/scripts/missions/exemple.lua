local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end

local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local stor_a = 13231
local item_m = 10560
local qtd_m = 50
local item_r = 
local xp_a =  


if(msgcontains(msg, 'entregar') or msgcontains(msg, 'ajudar')) then
selfSay('Você está com todos os items em sua backpack, prontos para entregar ? {sim}', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 1) then
if(getPlayerStorageValue(cid, stor_a) < 1 ) then
if(getPlayerItemCount(cid, item_m) >= qtd_m ) then
doPlayerRemoveItem(cid, item_m, qtd_m)
doPlayerAddItem(cid, item_r, 1)
doPlayerAddExp(cid, xp_a)
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