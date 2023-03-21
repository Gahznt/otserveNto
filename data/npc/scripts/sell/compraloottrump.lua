local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'Katon Card'}, 143, 2,       'Katon Card')
shopModule:addSellableItem({'Suiton Card'}, 144, 2,       'Suiton Card')
shopModule:addSellableItem({'Fuuton Card'}, 10555, 3,       'Fuuton Card') --3540
shopModule:addSellableItem({'Doton Card'}, 10556, 3,       'Doton Card') -- 3541
shopModule:addSellableItem({'Susano Card'}, 10557, 4,       'Susano Card') --3543

shopModule:addSellableItem({'Precious Stone'}, 145, 5,       'Precious Stone')
shopModule:addSellableItem({'Kekkei Stone'}, 10559, 6,       'Kekkei Stone') --3544
shopModule:addSellableItem({'Brass Key'}, 10560, 7,       'Brass Key') --8904
shopModule:addSellableItem({'Silver Key'}, 10561, 8,       'Silver Key') --8906


shopModule:addSellableItem({'Gold Key'}, 10562, 9,       'Gold Key') --8907
shopModule:addSellableItem({'Biju Stone'}, 10563, 12,       'Biju Stone') --9237
shopModule:addSellableItem({'Gold Amulet'}, 10564, 14,       'Gold Amulet') --9802

shopModule:addSellableItem({'Crystal Splinter'}, 8849, 18,       'Crystal Splinter')
shopModule:addSellableItem({'Crystal'}, 10565, 20,       'Crystal') --9240
shopModule:addSellableItem({'Biju Egg'}, 10566, 24,       'Biju Egg') --9389


npcHandler:addModule(FocusModule:new())