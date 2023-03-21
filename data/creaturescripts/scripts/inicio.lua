function onLogin(cid)
local storage = 2113
if getPlayerStorageValue(cid, storage) == -1 then
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 2447, 1)
doAddContainerItem(bag, 3969, 1)
doAddContainerItem(bag, 2646, 1)
doAddContainerItem(bag, 114, 1)
doAddContainerItem(bag, 2545, 1)
doAddContainerItem(bag, 2648, 1)
doAddContainerItem(bag, 130, 1)
doAddContainerItem(bag, 2689, 20)
doAddContainerItem(bag, 7618, 50)
doAddContainerItem(bag, 7620, 50)
setPlayerStorageValue(cid, storage, 1)
else
end
return true
end