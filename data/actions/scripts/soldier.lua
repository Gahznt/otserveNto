
local exhausted_seconds = 25
local exhausted_storagevalue = 6720

function onUse(cid, item, frompos, item2, topos)
if(os.time() > getPlayerStorageValue(cid, exhausted_storagevalue)) then
		 local life = getCreatureMaxHealth(cid)
		 doCreatureSay(cid,"I feel the good!", TALKTYPE_MONSTER)
		 doCreatureAddHealth(cid, getCreatureMaxHealth(cid) - getCreatureHealth(cid))
		 doSendAnimatedText(topos, life, 66)
		 setPlayerStorageValue(cid, exhausted_storagevalue, os.time() + exhausted_seconds)		 
		 doRemoveItem(item.uid, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, "Aguarde " .. getPlayerStorageValue(cid, exhausted_storagevalue) - os.time() .." segundos para comer novamente.")
end
end