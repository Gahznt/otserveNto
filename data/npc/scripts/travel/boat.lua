local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

local travelNode = keywordHandler:addKeyword({'konohagakure'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce deseja ir para Konoha, tem certeza ?{sim}'})
	travelNode:addChildKeyword({'sim'}, StdModule.travel, {npcHandler = npcHandler, premium = false,  level = 10, cost = 1500, destination = {x=1026, y=1045, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Até a proxima.'})

local travelNode = keywordHandler:addKeyword({'long bridge'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce deseja ir para Long Bridge, tem certeza ?{sim}'})
	travelNode:addChildKeyword({'sim'}, StdModule.travel, {npcHandler = npcHandler, premium = false,  level = 10, cost = 7500, destination = {x=1420, y=938, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Até a proxima.'})

local travelNode = keywordHandler:addKeyword({'west desert'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce deseja ir para West Desert, tem certeza ?{sim}'})
	travelNode:addChildKeyword({'sim'}, StdModule.travel, {npcHandler = npcHandler, premium = false,  level = 10, cost = 7500, destination = {x=518, y=1122, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Até a proxima.'})

local travelNode = keywordHandler:addKeyword({'getsugakure'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce deseja ir para Getsugakure, tem certeza ?{sim}'})
	travelNode:addChildKeyword({'sim'}, StdModule.travel, {npcHandler = npcHandler, premium = false,  level = 10, cost = 1500, destination = {x=1623, y=1235, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Até a proxima.'})

local travelNode = keywordHandler:addKeyword({'south desert'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce deseja ir para South Desert, tem certeza ?{sim}'})
	travelNode:addChildKeyword({'sim'}, StdModule.travel, {npcHandler = npcHandler, premium = false,  level = 10, cost = 7500, destination = {x=1618, y=1617, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Até a proxima.'})

local travelNode = keywordHandler:addKeyword({'otsutsuki route'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce deseja ir para Otsutsuki Route, tem certeza ?{sim}'})
	travelNode:addChildKeyword({'sim'}, StdModule.travel, {npcHandler = npcHandler, premium = false,  level = 80, cost = 9500, destination = {x=1255, y=1418, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Até a proxima.'})

local travelNode = keywordHandler:addKeyword({'sunagakure'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce deseja ir para Sunagakure, tem certeza ?{sim}'})
	travelNode:addChildKeyword({'sim'}, StdModule.travel, {npcHandler = npcHandler, premium = false,  level = 10, cost = 1500, destination = {x=662, y=741, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Até a proxima.'})

local travelNode = keywordHandler:addKeyword({'hell valley'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce deseja ir para vale do inferno, tem certeza ?{sim}'})
	travelNode:addChildKeyword({'sim'}, StdModule.travel, {npcHandler = npcHandler, premium = false,  level = 60, cost = 15000, destination = {x=534, y=1437, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Até a proxima.'})
	
local travelNode = keywordHandler:addKeyword({'tropical island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce deseja ir para ilha tropical, tem certeza ?{sim}'})
	travelNode:addChildKeyword({'sim'}, StdModule.travel, {npcHandler = npcHandler,  level = 60, cost = 15000, destination = {x=769, y=1439, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Até a proxima..'})
	
local travelNode = keywordHandler:addKeyword({'recanto das bijus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce deseja ir para recanto das bijus, tem certeza ?{sim}'})
	travelNode:addChildKeyword({'sim'}, StdModule.travel, {npcHandler = npcHandler, premium = true,  level = 90, cost = 25000, destination = {x=1169, y=840, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Até a proxima..'})
	
	
    keywordHandler:addKeyword({'viagem'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Podemos ir até Konohagakure, Long Bridge, West Desert, Getsugakure, South Desert, Sunagakure, Otsutsuki Route, Tropical Island, Hell Valley, Recanto das Bijus, .'})
        -- Makes sure the npc reacts when you say hi, bye etc.
        npcHandler:addModule(FocusModule:new())