local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'Hinata Coat'}, 11219, 7500,       'Hinata Coat')
shopModule:addSellableItem({'Jiraya Shirt'}, 11220, 7500,       'Jiraya Shirt')
shopModule:addSellableItem({'Shikamaru Blouse'}, 11221, 7500,       'Shikamaru Blouse')
shopModule:addSellableItem({'Akatsuki Coat'}, 11218, 7500,       'Akatsuki Coat')
shopModule:addSellableItem({'Uchiha Legs'}, 11222, 7500,       'Uchiha Legs')
shopModule:addSellableItem({'Suna Cap'}, 11216, 7500,       'Suna Cap')
shopModule:addSellableItem({'Suna Boots'}, 11224, 7500,       'Suna Boots')
shopModule:addSellableItem({'Fighting Boots'}, 11226, 7500,       'Fighting Boots')
shopModule:addSellableItem({'Taijutsu Legs'}, 11228, 7500,       'Taijutsu Legs')
shopModule:addSellableItem({'Uchiha Boots'}, 11225, 7500,       'Uchiha Boots')
shopModule:addSellableItem({'Akatsuki Hat'}, 11215, 7500,       'Akatsuki Hat')
shopModule:addSellableItem({'Orochimaru Legs'}, 11227, 7500,       'Orochimaru Legs')
shopModule:addSellableItem({'Suna Boots'}, 11224, 7500,       'Suna Boots')
shopModule:addSellableItem({'Susano Legs'}, 11223, 7500,       'Susano Legs')
shopModule:addSellableItem({'Fighting Bandana'}, 11217, 7500,       'Fighting Bandana')



npcHandler:addModule(FocusModule:new())