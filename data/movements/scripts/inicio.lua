function onStepIn(cid, item, frompos, item2, topos)


if getPlayerStorageValue(cid, 19881) < 1 then
doPlayerSendTextMessage(cid,22,"Voce acabou de conseguir os Items Iniciais!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 2447, 1)
doAddContainerItem(bag, 130, 1)
doAddContainerItem(bag, 2417, 1)
doAddContainerItem(bag, 2545, 1)
doAddContainerItem(bag, 114, 1)
doAddContainerItem(bag, 3969, 1)
doAddContainerItem(bag, 2646, 1)
doAddContainerItem(bag, 2648, 1)
doAddContainerItem(bag, 2666, 20)
doAddContainerItem(bag, 2160, 15)
setPlayerStorageValue(cid, 19811, 1)
end


return TRUE
end