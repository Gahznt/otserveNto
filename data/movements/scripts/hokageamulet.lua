local config = {
    tempo = 2,
    items = {2170} -- ITEM QUE VAI 
}

function MagicBuff(cid, tempo, item)

if (isCreature(cid) == FALSE) then
return false
end

if getPlayerStorageValue(cid, 192388) < 1 then
return TRUE
end

local position256 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
doSendMagicEffect(position256, 372)
doPlayerRemoveItem(cid, 2170, 1)
return addEvent(MagicBuff, config.tempo * 1000, cid)
end

function onEquip(cid, item)
if isInArray(config.items, item.itemid) then
if getPlayerStorageValue(cid, 192388) < 1 then
setPlayerStorageValue(cid, 192388, 1)
setPlayerStorageValue(cid, 192388, 1)
return addEvent(MagicBuff, config.tempo * 1000, cid)
end
end
return TRUE
end

function onDeEquip(cid, item)
if isInArray(config.items, item.itemid) then
setPlayerStorageValue(cid, 192388, 0)
end
return TRUE
end