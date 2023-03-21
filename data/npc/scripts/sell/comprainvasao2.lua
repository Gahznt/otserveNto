local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'Izanami Gloves Essence'}, 11323, 1000,       'Izanami Gloves Essence')
shopModule:addSellableItem({'Kurama Sword Essence'}, 11326, 1000,       'Kurama Sword Essence')
shopModule:addSellableItem({'Susano Arch Essence'}, 11327, 1000,       'Susano Arch Essence')
shopModule:addSellableItem({'Kaguya Helmet Essence'}, 11328, 1000,       'Kaguya Helmet Essence')
shopModule:addSellableItem({'Kaguya Shield Essence'}, 11329, 3000,       'Kaguya Shield Essence')
shopModule:addSellableItem({'Royal Flame Essence'}, 11207, 500,       'Royal Flame Essence')
shopModule:addSellableItem({'Royal Uchiha Essence'}, 11208, 500,       'Royal Uchiha Essence')
shopModule:addSellableItem({'Rinnegan Eye Essence'}, 11229, 1000,       'Rinnegan Eye Essence')
shopModule:addSellableItem({'Uchiha Kilt Essence'}, 11234, 1700,       'Uchiha Kilt Essence')



npcHandler:addModule(FocusModule:new())