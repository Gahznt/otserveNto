local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end
 
local items = {
	item1 = {11255, 2448}, -- item1 item que será pedido e que será dado na primeira troca
	item2 = {11255, 2259}, --
	item3 = {11255, 2454}, --
	item4 = {11255, 2455}, --
	item5 = {8849, 11255}, --

}
local counts = {
          count1 = {15, 1}, -- count1 quantidade que será pedido e que será dado na primeira troca
		  count2 = {100, 1}, -- count1 quantidade que será pedido e que será dado na primeira troca
		  count3 = {250, 1}, -- count1 quantidade que será pedido e que será dado na primeira troca
		  count4 = {250, 1}, -- count1 quantidade que será pedido e que será dado na primeira troca
		  count5 = {75, 1}, -- count1 quantidade que será pedido e que será dado na primeira troca
}
 
function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
		  
		    if msgcontains(msg, 'Kit Of Aprimoration') or msgcontains(msg, 'aprimoration') then
                    if getPlayerItemCount(cid, items.item1[1]) >= counts.count1[1] then
                              doPlayerRemoveItem(cid, items.item1[1], counts.count1[1])
                              doPlayerAddItem(cid, items.item1[2], counts.count1[2])
                              selfSay('Você acabou de trocar '.. counts.count1[1] ..' '.. getItemNameById(items.item1[1]) ..' por '.. counts.count1[2] ..' '.. getItemNameById(items.item1[2]) ..'.', cid)
                    else
                              selfSay('Você precisa '.. counts.count1[1] ..' '.. getItemNameById(items.item1[1]) ..'.', cid)
                    end
          end
		    if msgcontains(msg, 'Kit Of Critical Power') or msgcontains(msg, 'critical') then
                    if getPlayerItemCount(cid, items.item2[1]) >= counts.count2[1] then
                              doPlayerRemoveItem(cid, items.item2[1], counts.count2[1])
                              doPlayerAddItem(cid, items.item2[2], counts.count2[2])
                              selfSay('Você acabou de trocar '.. counts.count2[1] ..' '.. getItemNameById(items.item2[1]) ..' por '.. counts.count2[2] ..' '.. getItemNameById(items.item2[2]) ..'.', cid)
                    else
                              selfSay('Você precisa '.. counts.count2[1] ..' '.. getItemNameById(items.item2[1]) ..'.', cid)
                    end
          end
		    if msgcontains(msg, 'Senju Enchanted') or msgcontains(msg, 'senju') then
                    if getPlayerItemCount(cid, items.item3[1]) >= counts.count3[1] then
                              doPlayerRemoveItem(cid, items.item3[1], counts.count3[1])
                              doPlayerAddItem(cid, items.item3[2], counts.count3[2])
                              selfSay('Você acabou de trocar '.. counts.count3[1] ..' '.. getItemNameById(items.item3[1]) ..' por '.. counts.count3[2] ..' '.. getItemNameById(items.item3[2]) ..'.', cid)
                    else
                              selfSay('Você precisa '.. counts.count3[1] ..' '.. getItemNameById(items.item3[1]) ..'.', cid)
                    end
          end  
		  if msgcontains(msg, 'Sannin Enchanted') or msgcontains(msg, 'sannin') then
                    if getPlayerItemCount(cid, items.item4[1]) >= counts.count4[1] then
                              doPlayerRemoveItem(cid, items.item4[1], counts.count4[1])
                              doPlayerAddItem(cid, items.item4[2], counts.count4[2])
                              selfSay('Você acabou de trocar '.. counts.count4[1] ..' '.. getItemNameById(items.item4[1]) ..' por '.. counts.count4[2] ..' '.. getItemNameById(items.item4[2]) ..'.', cid)
                    else
                              selfSay('Você precisa '.. counts.count4[1] ..' '.. getItemNameById(items.item4[1]) ..'.', cid)
                    end
          end
		  if msgcontains(msg, 'forjar') or msgcontains(msg, 'adamantium') then
                    if getPlayerItemCount(cid, items.item5[1]) >= counts.count5[1] then
                              doPlayerRemoveItem(cid, items.item5[1], counts.count5[1])
                              doPlayerAddItem(cid, items.item5[2], counts.count5[2])
                              selfSay('Você acabou de forjar '.. counts.count5[1] ..' '.. getItemNameById(items.item5[1]) ..' em '.. counts.count5[2] ..' '.. getItemNameById(items.item5[2]) ..'.', cid)
                    else
                              selfSay('Você precisa '.. counts.count5[1] ..' '.. getItemNameById(items.item5[1]) ..'.', cid)
                    end
          end
          return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())