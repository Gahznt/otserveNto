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

if(msgcontains(msg, 'scroll 10 vip coin') or msgcontains(msg, 'scroll 10 vip coins')) then
selfSay('Ok, deseja trocar este escroll por Vip Coins? {sim}', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 1) then
if(getPlayerItemCount(cid, 11231) >= 1) then
doPlayerRemoveItem(cid, 11231, 1)
doPlayerAddItem(cid, 11230, 10)
selfSay('Obrigado por contribuir ! Amamos-te', cid)
else
selfSay('Você precisa de um Scroll de 10 Vip Coin, compre em nossa Loja Vip.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'scroll 25 vip coin') or msgcontains(msg, 'scroll 25 vip coins')) then
selfSay('Ok, deseja trocar este escroll por Vip Coins? {sim}', cid)
talkState[talkUser] = 2
elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 2) then
if(getPlayerItemCount(cid, 11232) >= 1) then
doPlayerRemoveItem(cid, 11232, 1)
doPlayerAddItem(cid, 11230, 25)
selfSay('Obrigado por contribuir ! Amamos-te', cid)
else
selfSay('Você precisa de um Scroll de 25 Vip Coin, compre em nossa Loja Vip.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'scroll 50 vip coin') or msgcontains(msg, 'scroll 50 vip coins')) then
selfSay('Ok, deseja trocar este escroll por Vip Coins? {sim}', cid)
talkState[talkUser] = 3
elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 3) then
if(getPlayerItemCount(cid, 11233) >= 1) then
doPlayerRemoveItem(cid, 11233, 1)
doPlayerAddItem(cid, 11230, 50)
selfSay('Obrigado por contribuir ! Amamos-te', cid)
else
selfSay('Você precisa de um Scroll de 50 Vip Coin, compre em nossa Loja Vip.', cid)
end
talkState[talkUser] = 0

end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())