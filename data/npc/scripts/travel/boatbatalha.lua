local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

	
    local travelNode = keywordHandler:addKeyword({'naruto'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce tem Certeza que Deseja iniciar a Batalha?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 100, cost = 0, destination = {x=1483, y=1071, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Boa Sorte !.'})
	
	local travelNode = keywordHandler:addKeyword({'sasuke'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce tem Certeza que Deseja iniciar a Batalha?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 150, cost = 0, destination = {x=1547, y=1071, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Boa Sorte !.'})
	
	local travelNode = keywordHandler:addKeyword({'neji'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce tem Certeza que Deseja iniciar a Batalha?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 200, cost = 0, destination = {x=1608, y=1071, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Boa Sorte !.'})
	
	local travelNode = keywordHandler:addKeyword({'lee'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce tem Certeza que Deseja iniciar a Batalha?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 250, cost = 0, destination = {x=1480, y=1116, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Boa Sorte !.'})
	
	local travelNode = keywordHandler:addKeyword({'gaara'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce tem Certeza que Deseja iniciar a Batalha?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 300, cost = 0, destination = {x=1548, y=1114, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Boa Sorte !.'})
	
	local travelNode = keywordHandler:addKeyword({'zabuza'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce tem Certeza que Deseja iniciar a Batalha?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 350, cost = 0, destination = {x=1610, y=1114, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Boa Sorte !.'})
	
	local travelNode = keywordHandler:addKeyword({'kisame'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce tem Certeza que Deseja iniciar a Batalha?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 400, cost = 0, destination = {x=1482, y=1164, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Boa Sorte !.'})
	
	local travelNode = keywordHandler:addKeyword({'deidara'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce tem Certeza que Deseja iniciar a Batalha?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 450, cost = 0, destination = {x=1550, y=1164, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Boa Sorte !.'})
	
	local travelNode = keywordHandler:addKeyword({'itachi'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce tem Certeza que Deseja iniciar a Batalha?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 500, cost = 0, destination = {x=1614, y=1164, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Boa Sorte !.'})
	
	local travelNode = keywordHandler:addKeyword({'madara'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce tem Certeza que Deseja iniciar a Batalha?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 550, cost = 0, destination = {x=1481, y=1206, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Boa Sorte !.'})
	
	local travelNode = keywordHandler:addKeyword({'kaguya'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce tem Certeza que Deseja iniciar a Batalha?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 600, cost = 0, destination = {x=1549, y=1205, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Boa Sorte !.'})
	
	local travelNode = keywordHandler:addKeyword({'rikkudo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce tem Certeza que Deseja iniciar a Batalha?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 650, cost = 0, destination = {x=1615, y=1207, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Boa Sorte !.'})
	
       keywordHandler:addKeyword({'batalhar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce pode batalhar com o {Naruto}, {Sasuke}, {Neji}, {Lee}, {Gaara}, {Zabuza}, {Kisame}, {Deidara}, {Itachi}, {Madara}, {Kaguya}, {Rikkudo}'})
        -- Makes sure the npc reacts when you say hi, bye etc.
        npcHandler:addModule(FocusModule:new())