local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


shopModule:addSellableItem({'Suna Cap'}, 11216, 50000,       'Suna Cap') -- 50000, 100000, 150000
shopModule:addSellableItem({'Kiba Blouse'}, 11219, 50000,       'Kiba Blouse') -- 50000, 100000, 150000
shopModule:addSellableItem({'Genin Legs'}, 11221, 50000,       'Genin Legs') -- 50000, 100000, 150000
shopModule:addSellableItem({'Katon Boots'}, 11222, 50000,       'Katon Boots') -- 50000, 100000, 150000

shopModule:addSellableItem({'Sarutobi Protector'}, 11223, 100000,       'Sarutobi Protector') -- 50000, 100000, 150000
shopModule:addSellableItem({'Doton Coat'}, 11224, 100000,       'Doton Coat') -- 50000, 100000, 150000
shopModule:addSellableItem({'Gaara Legs'}, 11225, 100000,       'Gaara Legs') -- 50000, 100000, 150000
shopModule:addSellableItem({'Myst Boots'}, 11227, 100000,       'Myst Boots') -- 50000, 100000, 150000

shopModule:addSellableItem({'Dark Anbu Mask'}, 147, 150000,       'Dark Anbu Mask') -- 50000, 100000, 150000
shopModule:addSellableItem({'Black Uchiha Coat'}, 102, 150000,       'Black Uchiha Coat') -- 50000, 100000, 150000
shopModule:addSellableItem({'Taijutsu Legs'}, 11228, 150000,       'Taijutsu Legs') -- 50000, 100000, 150000
shopModule:addSellableItem({'Golden Boots'}, 11226, 150000,       'Golden Boots') -- 50000, 100000, 150000

shopModule:addBuyableItem({'Juubi Boots'}, 2449, 3350000,       'Juubi Boots') -- 50000, 100000, 150000
shopModule:addBuyableItem({'Madara Ring'}, 2126, 2750000,       'Madara Ring') -- 50000, 100000, 150000
shopModule:addBuyableItem({'Itachi Ring'}, 2124, 1450000,       'Itachi Ring') -- 50000, 100000, 150000
shopModule:addBuyableItem({'Hoshigaki Ring'}, 11211, 850000,       'Hoshigaki Ring') -- 50000, 100000, 150000
shopModule:addBuyableItem({'Diamond Ring'}, 129, 350000,       'Diamond Ring') -- 50000, 100000, 150000
shopModule:addBuyableItem({'Esmerald Ring'}, 128, 150000,       'Esmerald Ring') -- 50000, 100000, 150000

npcHandler:addModule(FocusModule:new())