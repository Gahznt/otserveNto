local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local shopWindow = {}
local moeda = 11230 -- [iD DA MOEDA]
local t = {
	[6548] = {price = 50},
	[6549] = {price = 100},
	[9004] = {price = 10},
	[2193] = {price = 10},
	[2144] = {price = 1},
	[8981] = {price = 5},
	[2151] = {price = 1},
	[2146] = {price = 5}
	  }
local onBuy = function(cid, item, subType, amount, ignoreCap, inBackpacks)
	if  t[item] and not doPlayerRemoveItem(cid, moeda, t[item].price) then
		  selfSay("você não tem "..t[item].price.." "..getItemNameById(moeda), cid)
			 else
		doPlayerAddItem(cid, item)
		selfSay("aqui está seu item!", cid)
	   end
	return true
end
if (msgcontains(msg, 'trade') or msgcontains(msg, 'TRADE'))then
			for var, ret in pairs(t) do
					table.insert(shopWindow, {id = var, subType = 0, buy = ret.price, sell = 0, name = getItemNameById(var)})
				end
			openShopWindow(cid, shopWindow, onBuy, onSell)
		end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())