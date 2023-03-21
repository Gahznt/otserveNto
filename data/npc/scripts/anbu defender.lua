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

if(msgcontains(msg, 'entregar') or msgcontains(msg, 'missao')) then
selfSay('Você está com todos os items em mãos?{sim}', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 1) then
if(getPlayerItemCount(cid, 6511) >= 50) and getPlayerStorageValue(cid, 55000) < 1 then
doPlayerRemoveItem(cid, 6511, 50)
setPlayerStorageValue(cid, 55000, 1)
selfSay('Parabéns, acesso liberado. !.', cid)
else
selfSay('Voce ja tem acesso liberado, {ou} nao esta com todos os items na backpack para entregar.', cid)
end
talkState[talkUser] = 0

end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())