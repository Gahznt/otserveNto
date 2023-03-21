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
domodlib('task_func')
local nome = "Mizuki" -- nome do monstro que vai parecer

local t = {
storage = 666616,  -- storage, so mude se tiver usando pra outra coisa.
tempo = 1440, -- Tempo em horas.
}

local function greetCallback(cid)
	local msg = 'Olá '.. getCreatureName(cid) .."o que deseja ? {hokage}"
	npcHandler:say(msg,cid)
    npcHandler:addFocus(cid)
	return false
end

local stor_a = 43517

function creatureSayCallback(cid, type, msg)

	if string.lower(msg) == 'bye' or string.lower(msg) == 'tchau' then
		npcHandler:resetNpc(cid)
		return false
	end
    if(not npcHandler:isFocused(cid)) then 
        return false
    end
	
	local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, 'hokage')) then
	selfSay('Hmm, então você precisa da minha autorização para se tornar Hokage ? {Sim}', cid)
	talkState[talkUser] = 1
	elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 1) then
	if(getPlayerStorageValue(cid, stor_a) < 1 ) then
		if getPlayerStorageValue(cid, t.storage) < os.time()  then
			local pos = getCreaturePosition(getNpcId())
			selfSay('Certo, eu confio em você.',cid)
			doCreatureSay(getNpcId(), "Autorizado!", TALKTYPE_MONSTER_YELL)
			setPlayerStorageValue(cid, stor_a, 1)
			setPlayerStorageValue(cid, 83357, (getPlayerStorageValue(cid, 83357)+1))
			-- setPlayerStorageValue(cid, t.storage, os.time() + t.tempo * 60 )
		else
			doSendMagicEffect(getPlayerPosition(cid), 3)
			doPlayerPopupFYI(cid, "[ Hokage ] estou ocupado agora ! Volte em ".. getPlayerStorageValue(cid, t.storage) - os.time() .." segundos para conversar comigo.")
	    end
	else
		doSendMagicEffect(getPlayerPosition(cid), 3)
		selfSay('Você ja tem minha autorização !', cid)
	end
	talkState[talkUser] = 0
	end
	return true
end


npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())