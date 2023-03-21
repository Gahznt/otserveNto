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

if(msgcontains(msg, 'vale de 10 moedas') or msgcontains(msg, 'vale de 10 moedas')) then
selfSay('Ta certo, entao voce quer trocar este vale por 10 {Moedas VIP} ?', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
if(getPlayerItemCount(cid, 11231) >= 1) then
doPlayerRemoveItem(cid, 11231, 1)
doPlayerAddItem(cid, 11230, 10)
selfSay('Prontinho, obrigado por ajudar o nosso servidor :D , volte sempre.', cid)
else
selfSay('Voce nao possui o vale amiguinho, compre no shop pelo site.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'vale de 20 moedas') or msgcontains(msg, 'vale de 20 moedas')) then
selfSay('Ta certo, entao voce quer trocar este vale por 20 {Moedas VIP} ?', cid)
talkState[talkUser] = 2
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then
if(getPlayerItemCount(cid, 11232) >= 1) then
doPlayerRemoveItem(cid, 11232, 1)
doPlayerAddItem(cid, 11230, 20)
selfSay('Prontinho, obrigado por ajudar o nosso servidor :D , volte sempre.', cid)
else
selfSay('Voce nao possui o vale amiguinho, compre no shop pelo site.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'vale de 50 moedas') or msgcontains(msg, 'vale de 50 moedas')) then
selfSay('Ta certo, entao voce quer trocar este vale por 50 {Moedas VIP} ?', cid)
talkState[talkUser] = 3
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
if(getPlayerItemCount(cid, 11233) >= 1) then
doPlayerRemoveItem(cid, 11233, 1)
doPlayerAddItem(cid, 11230, 50)
selfSay('Prontinho, obrigado por ajudar o nosso servidor :D , volte sempre.', cid)
else
selfSay('Voce nao possui o vale amiguinho, compre no shop pelo site.', cid)
end
talkState[talkUser] = 0

end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())