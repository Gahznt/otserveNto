local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

	
	local travelNode = keywordHandler:addKeyword({'shukaku quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce quer tentar ir para Shukaku Quest?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler,  level = 200, cost = 0, destination = {x=899, y=1043, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})

	local travelNode = keywordHandler:addKeyword({'matatabi quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce quer tentar ir para Quest?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler,  level = 300, cost = 0, destination = {x=1082, y=1426, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})

	local travelNode = keywordHandler:addKeyword({'son goku quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce quer tentar ir para Quest?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler,  level = 300, cost = 0, destination = {x=1172, y=1291, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})

	local travelNode = keywordHandler:addKeyword({'gobi quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce quer tentar ir para Quest?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler,  level = 300, cost = 0, destination = {x=539, y=1081, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})

	local travelNode = keywordHandler:addKeyword({'kyuubi quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce quer tentar ir para Quest?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler,  level = 350, cost = 0, destination = {x=856, y=1319, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})

	local travelNode = keywordHandler:addKeyword({'juubi quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce quer tentar ir para Quest?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler,  level = 375, cost = 0, destination = {x=785, y=1549, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})

	local travelNode = keywordHandler:addKeyword({'arm quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce quer tentar ir para Quest?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler,  level = 400, cost = 0, destination = {x=590, y=1018, z=8} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})

	local travelNode = keywordHandler:addKeyword({'esconderijo do orochimaru'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce quer tentar ir para Quest?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler,  level = 500, cost = 0, destination = {x=1029, y=1096, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})
	
        keywordHandler:addKeyword({'missao'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Posso te levar para Shukaku Quest, Matatabi Quest, Son Goku Quest, Gobi Quest, Kyuubi Quest, Juubi Quest, Arm Quest,{Esconderijo do Orochimaru}'})
        -- Makes sure the npc reacts when you say hi, bye etc.
        npcHandler:addModule(FocusModule:new())