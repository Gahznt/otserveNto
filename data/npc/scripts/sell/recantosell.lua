local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'Kyuubi Testicles'}, 11190, 2000,       'Kyuubi Testicles')
shopModule:addSellableItem({'Hachibi Tail'}, 11191, 1200,       'Hachibi Tail')
shopModule:addSellableItem({'Shukaku Nail'}, 11193, 1000,       'Shukaku Nail')
shopModule:addSellableItem({'Juubi Tail'}, 11192, 5500,       'Juubi Tail')

shopModule:addBuyableItem({'Kyuubi Testicles'}, 11190, 3000,       'Kyuubi Testicles')
shopModule:addBuyableItem({'Hachibi Tail'}, 11191, 2000,       'Hachibi Tail')
shopModule:addBuyableItem({'Shukaku Nail'}, 11193, 2000,       'Shukaku Nail')
shopModule:addBuyableItem({'Juubi Tail'}, 11192, 5500,       'Juubi Tail')

npcHandler:addModule(FocusModule:new())