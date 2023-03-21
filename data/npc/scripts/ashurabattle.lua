local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 							npcHandler:onThink() 						end
function onPlayerEndTrade(cid)				npcHandler:onPlayerEndTrade(cid)			end
function onPlayerCloseChannel(cid)			npcHandler:onPlayerCloseChannel(cid)		end



local nome = "Ashura Otsutsuki" -- nome do monstro que vai parecer


local function greetCallback(cid)
	local msg = 'Olá '.. getCreatureName(cid) ..", vem me desafiar a um duelo?"
	npcHandler:say(msg,cid)
    npcHandler:addFocus(cid)
	return false
end
function creatureSayCallback(cid, type, msg)
	if string.lower(msg) == 'bye' or string.lower(msg) == 'xau' then
		npcHandler:resetNpc(cid)
		return false
	end
    if(not npcHandler:isFocused(cid)) then 
        return false
    end
	if (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) then
		local pos = getCreaturePosition(getNpcId())
		selfSay('Então venha.',cid)
		doCreatureSay(getNpcId(), "MuHuashAUhashSHUuSA", TALKTYPE_MONSTER_YELL)
		npcHandler:resetNpc(cid)
		doRemoveCreature(getNpcId())
		doCreateMonster(nome, pos)
	end
	if (msgcontains(msg, 'nao') or msgcontains(msg, 'no') or msgcontains(msg, 'não')) then
		selfSay('Então tchau.', cid)
		npcHandler:resetNpc(cid)
		return false
	end
		
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())