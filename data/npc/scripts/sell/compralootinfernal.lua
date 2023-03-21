local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler) 

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()                        end 

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule) 


shopModule:addSellableItem({'Couro de Dragao'}, 5877, 64,       'Couro de Dragao')
shopModule:addSellableItem({'Couro de Hellhound'}, 5881, 64,       'Couro de Hellhound') 

npcHandler:addModule(FocusModule:new()) 