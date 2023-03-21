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

if(msgcontains(msg, 'Sannin Enchant') or msgcontains(msg, 'Sannin Enchant')) then
selfSay('Ta certo, diga {yes} para concluir a troca.', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
if(getPlayerItemCount(cid, 2453) >= 50) then
doPlayerRemoveItem(cid, 2453, 50)
doPlayerAddItem(cid, 2455, 1)
selfSay('Tome seu Sannin Enchant.', cid)
else
selfSay('Voce nao tem todos os items para completar a troca!.', cid)
end
talkState[talkUser] = 0

end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())