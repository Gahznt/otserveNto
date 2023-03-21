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

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'Brave Heart'}, 2519, 50000,       'Leaf')
shopModule:addSellableItem({'Glorious Heart'}, 2520, 350000,       'Stream')

local nome = "Kakuzo" -- nome do monstro que vai parecer

local t = {
storage = 671007,  -- storage, so mude se tiver usando pra outra coisa.
tempo = 60, -- Tempo em horas.
}
domodlib('task_func')
local function greetCallback(cid)
	local msg = 'Olá '.. getCreatureName(cid) ..", - {Batalhar}, {Ajudar} ou {Trade}."
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
		selfSay('Ok.',cid)
		doCreatureSay(getNpcId(), "Prepare-se", TALKTYPE_MONSTER_YELL)
		npcHandler:resetNpc(cid)
		doRemoveCreature(getNpcId())
		doCreateMonster(nome, pos)
		setPlayerStorageValue(cid, t.storage, os.time() + t.tempo * 60 )
		else
		doSendMagicEffect(getPlayerPosition(cid), 3)
		doPlayerPopupFYI(cid, "[ Kakuzo ] estou descansando, espere ".. getPlayerStorageValue(cid, t.storage) - os.time() .." segundos para batalhar comigo novamente.")
    
	end
	talkState[talkUser] = 0
	
	elseif(msgcontains(msg, 'ajudar')) then
	selfSay('Meu estoque de tesouro está se esgotando, por favor, empreste-me 50 barras de ouro ? {entregar}', cid)
	talkState[talkUser] = 2
	elseif(msgcontains(msg, 'entregar') and talkState[talkUser] == 2) then
	if getPlayerLevel(cid) >= 45 then
	if(getPlayerItemCount(cid, 2160) >= 50 and getPlayerStorageValue(cid, 12209) < 1 ) then
	doPlayerRemoveItem(cid, 2160, 50)
	doPlayerAddExp(cid, 94700)
	doPlayerAddItem(cid, 11217, 1)
	doPlayerPopupFYI(cid, "Parabéns, você ganhou um novo item !")
	setPlayerStorageValue(cid, 12209, 1)
	setPlayerStorageValue(cid, 12510, 1)
	setPlayerStorageValue(cid, task_sys_storages[2], (getTaskPoints(cid)+1))
	selfSay('Obrigado.', cid)
	else
	selfSay('Voce precisa estudar a minha proposta, não tenho nada para você agora.', cid)
	end
	else
	selfSay('Você precisa de level 45 ou mais para realizar essa missão.', cid)
	end
	talkState[talkUser] = 0

	end
	return true
end


npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())