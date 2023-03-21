local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'great health pill', 'ghp'},		7591, 575,	'great health pill')
shopModule:addBuyableItem({'great chakra pill', 'gmp'},			7590, 575,	'great mana pill')
shopModule:addBuyableItem({'strong health potion', 'shp'},		7588, 225,	'strong health potion')
shopModule:addBuyableItem({'strong chakra potion', 'smp'},		7589, 225,	'strong mana potion')
shopModule:addBuyableItem({'health potion', 'hp'},			7618, 75,	'health potion')
shopModule:addBuyableItem({'chakra potion', 'mp'},			7620, 75,	'chakra potion')

shopModule:addBuyableItem({'ultimate health pill', 'ghp'},		7441, 1750,	'ultimate health pill')
shopModule:addBuyableItem({'doton block', 'ghp'},		1671, 1750,	'doton block')
shopModule:addBuyableItem({'soldier pill', 'ghp'},		2145, 42500,	'soldier pill')

npcHandler:addModule(FocusModule:new())
