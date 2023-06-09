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

local nome = "Indra Otsutsuki" -- nome do monstro que vai parecer

local t = {
storage = 676633,  -- storage, so mude se tiver usando pra outra coisa.
tempo = 15, -- Tempo em horas.
}

local function greetCallback(cid)
	local msg = 'Ol� '.. getCreatureName(cid) ..", {( Batalhar )} ({ Ajudar })."
	npcHandler:say(msg,cid)
    npcHandler:addFocus(cid)
	return false
end

function creatureSayCallback(cid, type, msg)
	if string.lower(msg) == 'bye' or string.lower(msg) == 'tchau' then
		npcHandler:resetNpc(cid)
		return false
	end
    if(not npcHandler:isFocused(cid)) then 
        return false
    end
	if (msgcontains(msg, 'batalhar')) and getPlayerStorageValue(cid, t.storage) < os.time()  then
		local pos = getCreaturePosition(getNpcId())
		selfSay('Ok.',cid)
		doCreatureSay(getNpcId(), "Prepare-se", TALKTYPE_MONSTER_YELL)
		npcHandler:resetNpc(cid)
		doRemoveCreature(getNpcId())
		doCreateMonster(nome, pos)
		setPlayerStorageValue(cid, t.storage, os.time() + t.tempo * 60 )
		else
		doSendMagicEffect(getPlayerPosition(cid), 3)
		doPlayerPopupFYI(cid, "[ Indra ] Ei, estou descansando, espere ".. getPlayerStorageValue(cid, t.storage) - os.time() .." segundos para batalhar comigo novamente.")
    
	end
	
	if(msgcontains(msg, 'ajudar') ) then
	selfSay('Me ajude?', cid)
	talkState[talkUser] = 1
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
	if(getPlayerItemCount(cid, 2201) >= 1) then
	doPlayerRemoveItem(cid, 2201, 1)
	--doAdd Item, Exp, Oque quiser
	selfSay('Obrigado.', cid)
	else
	selfSay('Voce precisa estudar a minha proposta.', cid)
	end
	
	talkState[talkUser] = 0
	if (msgcontains(msg, 'nao') or msgcontains(msg, 'no') or msgcontains(msg, 'n�o')) then
		selfSay('Adeus.', cid)
		npcHandler:resetNpc(cid)
		return false
	end
		
	return true
end


npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())