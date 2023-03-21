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

if(msgcontains(msg, 'certificado genin') or msgcontains(msg, 'certificado genin')) then
selfSay('Ta certo, deseja receber sua recompensa ?{sim}', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 1) then
if(getPlayerItemCount(cid, 10581) >= 1) then
doPlayerRemoveItem(cid, 10581, 1)
doPlayerAddItem(cid, 10551, 1)
selfSay('Parabéns!', cid)
else
selfSay('Você não possui certificado', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'certificado chunin') or msgcontains(msg, 'certificado chunin')) then
selfSay('Ta certo, deseja receber sua recompensa ?{sim}', cid)
talkState[talkUser] = 2
elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 2) then
if(getPlayerItemCount(cid, 10582) >= 1) then
doPlayerRemoveItem(cid, 10582, 1)
doPlayerAddItem(cid, 10552, 1)
selfSay('Parabéns!', cid)
else
selfSay('Você não possui certificado', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'certificado jounin') or msgcontains(msg, 'certificado jounin')) then
selfSay('Ta certo, deseja receber sua recompensa ?{sim}', cid)
talkState[talkUser] = 3
elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 3) then
if(getPlayerItemCount(cid, 10583) >= 1) then
doPlayerRemoveItem(cid, 10583, 1)
doPlayerAddItem(cid, 10553, 1)
selfSay('Parabéns!', cid)
else
selfSay('Você não possui certificado', cid)
end
talkState[talkUser] = 0

elseif(msgcontains(msg, 'certificado kage') or msgcontains(msg, 'certificado kage')) then
selfSay('Ta certo, deseja receber sua recompensa ?{sim}', cid)
talkState[talkUser] = 4
elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 4) then
if(getPlayerItemCount(cid, 10584) >= 1) then
doPlayerRemoveItem(cid, 10584, 1)
doPlayerAddItem(cid, 10554, 1)
selfSay('Parabéns!', cid)
else
selfSay('Você não possui certificado', cid)
end
talkState[talkUser] = 0

end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())