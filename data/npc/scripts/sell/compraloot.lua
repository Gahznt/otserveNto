local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'Leaf'}, 10560, 6,       'Leaf')
shopModule:addSellableItem({'Stream'}, 10561, 6,       'Stream')
shopModule:addSellableItem({'Magic Leaf'}, 10562, 8,       'Magic Leaf')
shopModule:addSellableItem({'Magic Stream'}, 10567, 8,       'Magic Stream')
shopModule:addSellableItem({'Double Magic Leaf'}, 10568, 5,       'Double Magic Leaf')

shopModule:addSellableItem({'Katon Card'}, 143, 22,       'Katon Card')
shopModule:addSellableItem({'Suiton Card'}, 144, 10,       'Suiton Card')
shopModule:addSellableItem({'Fuuton Card'}, 10555, 10,       'Fuuton Card')
shopModule:addSellableItem({'Doton Card'}, 10556, 24,       'Doton Card')
shopModule:addSellableItem({'Susano Card'}, 10557, 10,       'Susano Card')

shopModule:addSellableItem({'Katon Wood'}, 1675, 26,       'Katon Wood')
shopModule:addSellableItem({'Raiton Wood'}, 1676, 21,       'Raiton Wood')
shopModule:addSellableItem({'Magma Crystal'}, 1677, 54,       'Magma Crystal')
shopModule:addSellableItem({'Frosty Crystal'}, 1674, 48,       'Frosty Crystal')

shopModule:addSellableItem({'Katon Feather'}, 8930, 56,       'Katon Feather')
shopModule:addSellableItem({'Rainbow Feather'}, 8931, 54,       'Rainbow Feather')
shopModule:addSellableItem({'Precious Stone'}, 145, 28,       'Precious Stone')
shopModule:addSellableItem({'Gold Necklace'}, 10564, 34,       'Gold Necklace')
shopModule:addSellableItem({'Ruby Crystal'}, 8932, 34,       'Ruby Crystal')

shopModule:addSellableItem({'Kekkei Stone'}, 10559, 48,       'Kekkei Stone')
shopModule:addSellableItem({'Crystal'}, 10565, 49,       'Crystal')
shopModule:addSellableItem({'Biju Egg'}, 10566, 52,       'Biju Egg')

shopModule:addSellableItem({'White Essence'}, 11328, 745,       'White Essence')
shopModule:addSellableItem({'Black Essence'}, 11323, 935,        'Black Essence')
shopModule:addSellableItem({'Golden Essence'}, 11208, 1175,        'Golden Essence')
shopModule:addSellableItem({'Purple Essence'}, 11327, 1275,        'Purple Essence')
shopModule:addSellableItem({'Ice Feather'}, 8926, 325,        'Ice Feather')
shopModule:addSellableItem({'Wing of Waspoid'}, 8925, 225,        'Wing of Waspoid')
shopModule:addSellableItem({'Broche Samurai'}, 8924, 175,        'Broche Samurai')
shopModule:addSellableItem({'Okami Talisman'}, 8928, 115,        'Okami Talisman')
shopModule:addSellableItem({'Essence of Chakra'}, 8923, 75,        'Essence of Chakra')

npcHandler:addModule(FocusModule:new())