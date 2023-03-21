local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


shopModule:addSellableItem({'Shisui Sharingan'}, 11207, 20000,       'Shisui Sharingan') -- 50000, 100000, 150000

shopModule:addBuyableItem({'Shisui Sharingan'}, 11207, 50000,       'Shisui Sharingan') -- 50000, 100000, 150000


npcHandler:addModule(FocusModule:new())