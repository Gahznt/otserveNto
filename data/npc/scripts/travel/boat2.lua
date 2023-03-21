local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

	
local travelNode = keywordHandler:addKeyword({'esconderijo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce tem certeza que deseja ir para o meu esconderijo?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 100, cost = 1000, destination = {x=1457, y=880, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Bye Bye, aproveite as rotas !.'})
	
       keywordHandler:addKeyword({'travel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Comigo eh assim ! Eu e minha canoa viajamos pelos lugares mais secretos desse mundo shinobi ! Quer conhecer meu {esconderijo} ? Nem vou cobrar tao caro E O MELHOR ELE DA ACESSO PARA LUGARES MAIS TENEBROSOS QUE CONHECO Ui ( DEVE ESCONDER ALGUMA RECOMPENSA ) !!'})
        -- Makes sure the npc reacts when you say hi, bye etc.
        npcHandler:addModule(FocusModule:new())