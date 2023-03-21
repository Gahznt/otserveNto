local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'Katon Card'}, 143, 4,       'Katon Card')
shopModule:addSellableItem({'Suiton Card'}, 144, 6,       'Suiton Card')
shopModule:addSellableItem({'Fuuton Card'}, 10555, 8,       'Fuuton Card') --3540

shopModule:addSellableItem({'Doton Card'}, 10556, 14,       'Doton Card') -- 3541
shopModule:addSellableItem({'Susano Card'}, 10557, 16,       'Susano Card') --3543
shopModule:addSellableItem({'Precious Stone'}, 145, 18,       'Precious Stone')

shopModule:addSellableItem({'Kekkei Stone'}, 10559, 24,       'Kekkei Stone') --3544
shopModule:addSellableItem({'Brass Key'}, 10560, 26,       'Brass Key') --8904
shopModule:addSellableItem({'Silver Key'}, 10561, 28,       'Silver Key') --8906

shopModule:addSellableItem({'Gold Key'}, 10562, 34,       'Gold Key') --8907
shopModule:addSellableItem({'Biju Stone'}, 10563, 36,       'Biju Stone') --9237
shopModule:addSellableItem({'Gold Amulet'}, 10564, 38,       'Gold Amulet') --9802

shopModule:addSellableItem({'Crystal Splinter'}, 8849, 44,       'Crystal Splinter')
shopModule:addSellableItem({'Crystal'}, 10565, 46,       'Crystal') --9240
shopModule:addSellableItem({'Biju Egg'}, 10566, 48,       'Biju Egg') --9389
npcHandler:addModule(FocusModule:new())