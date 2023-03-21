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
local nome = "Zabuza Momochi" -- nome do monstro que vai parecer

local t = {
storage = 671000,  -- storage, so mude se tiver usando pra outra coisa.
tempo = 60, -- Tempo em horas.
}

local function greetCallback(cid)
	local msg = 'Olá '.. getCreatureName(cid) ..", - {Batalhar}, {Ajudar}."
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
	
	local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, 'batalhar')) then
	selfSay('Você deseja batalhar comigo ? {Sim}', cid)
	talkState[talkUser] = 1
	elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 1) then
		if getPlayerStorageValue(cid, t.storage) < os.time()  then
			local pos = getCreaturePosition(getNpcId())
			selfSay('Vamos-lá.',cid)
			doCreatureSay(getNpcId(), "Prepare-se", TALKTYPE_MONSTER_YELL)
			npcHandler:resetNpc(cid)
			doRemoveCreature(getNpcId())
			doCreateMonster(nome, pos)
			setPlayerStorageValue(cid, t.storage, os.time() + t.tempo * 60 )
			else
				doSendMagicEffect(getPlayerPosition(cid), 3)
				doPlayerPopupFYI(cid, "[ Zabuza ] estou descansando, espere ".. getPlayerStorageValue(cid, t.storage) - os.time() .." segundos para batalhar comigo novamente.")
	end
	talkState[talkUser] = 0

	elseif(msgcontains(msg, 'ajuda')) then
	selfSay('Suigetsu provou ser um ladrão de espadas, encontre-o e pegue a minha espada que está com ele ! {entregar}', cid)
	talkState[talkUser] = 2
	elseif(msgcontains(msg, 'entregar') and talkState[talkUser] == 2) then
	if getPlayerLevel(cid) >= 10 then
	if(getPlayerItemCount(cid, 7888) >= 1 and getPlayerStorageValue(cid, 12002) < 1 ) then
	doPlayerRemoveItem(cid, 7888, 1)
	doPlayerAddExp(cid, 8300)
	setPlayerStorageValue(cid, 12002, 1)
	setPlayerStorageValue(cid, task_sys_storages[2], (getTaskPoints(cid)+1))
	selfSay('Obrigado.', cid)
	else
	selfSay('Já trouxe minha espada ? Então não tenho mais nada para você.', cid)
	end
	else
	selfSay('Você precisa de level 10 ou mais para realizar essa missão.', cid)
	end
	talkState[talkUser] = 0

	end
	return true
end


npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())