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

if(msgcontains(msg, 'bkessing') or msgcontains(msg, 'bless')) then
selfSay('Bless ? {sim}', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 1) then
local price = 650000
if getPlayerMoney(cid) >= price then 
doPlayerSendTextMessage(cid, 22, "Você acabou de receber Blessings of Tsunade.")
	    doPlayerAddBlessing(cid, 1)
        doPlayerAddBlessing(cid, 2)
        doPlayerAddBlessing(cid, 3)
        doPlayerAddBlessing(cid, 4)
		doPlayerAddBlessing(cid, 5)
		doPlayerAddBlessing(cid, 6)
		doPlayerRemoveMoney(cid, price)
	   doSendMagicEffect(getPlayerPosition(cid), 5)
else
selfSay('Você precisa de 65 gold para receber a bless.', cid)
end
talkState[talkUser] = 0


end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())