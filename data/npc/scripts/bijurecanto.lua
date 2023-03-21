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

if(msgcontains(msg, 'Shukaku') or msgcontains(msg, 'Shukaku')) then
selfSay('Certo, conquiste 50 Shukaku Tails ! {entregar}', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'entregar') and talkState[talkUser] == 1) then
if(getPlayerItemCount(cid, 11378) >= 50) then
doPlayerRemoveItem(cid, 11378, 50)
doPlayerAddItem(cid, 2189, 1)
selfSay('Parabéns, você ganhou um item especial.', cid)
else
selfSay('Você precisa de 50 Shukaku Tails.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'Isobu') or msgcontains(msg, 'Isobu')) then
selfSay('Certo, conquiste 150 Isobu Tails ! {entregar}', cid)
talkState[talkUser] = 2
elseif(msgcontains(msg, 'entregar') and talkState[talkUser] == 2) then
if(getPlayerItemCount(cid, 11374) >= 150) then
doPlayerRemoveItem(cid, 11374, 150)
doPlayerAddItem(cid, 2207, 1)
selfSay('Parabéns, você ganhou um item especial.', cid)
else
selfSay('Você precisa de 150 Isobu Tails.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'Yonbi') or msgcontains(msg, 'Yonbi')) then
selfSay('Certo, conquiste 200 Yonbi Tails ! {entregar}', cid)
talkState[talkUser] = 3
elseif(msgcontains(msg, 'entregar') and talkState[talkUser] == 3) then
if(getPlayerItemCount(cid, 11372) >= 200) then
doPlayerRemoveItem(cid, 11372, 200)
doPlayerAddItem(cid, 11368, 1)
selfSay('Parabéns, você ganhou um item especial.', cid)
else
selfSay('Você precisa de 200 Yonbi Tails.', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'Gobi') or msgcontains(msg, 'Gobi')) then
selfSay('Certo, conquiste 250 Gobi Tails ! {entregar}', cid)
talkState[talkUser] = 4
elseif(msgcontains(msg, 'entregar') and talkState[talkUser] == 4) then
if(getPlayerItemCount(cid, 11373) >= 250) then
doPlayerRemoveItem(cid, 11373, 250)
doPlayerAddItem(cid, 11371, 1)
selfSay('Parabéns, você ganhou um item especial.', cid)
else
selfSay('Você precisa de 250 Gobi Tails.', cid)
end
talkState[talkUser] = 0

end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())