function onDeath(cid, corpse, deathList)
local ID_ITEM = 2170
 if (getPlayerSlotItem(cid, CONST_SLOT_NECKLACE).itemid == ID_ITEM) and (getCreatureSkullType(cid) == SKULL_RED or getCreatureSkullType(cid) == SKULL_BLACK) then
  doPlayerRemoveItem(cid, 2170, 1)
 doCreatureSetDropLoot(cid, false)
 else if 
 (getPlayerSlotItem(cid, CONST_SLOT_NECKLACE).itemid == ID_ITEM) and getPlayerSkullType(cid) <= 3 then
 doCreatureSetDropLoot(cid, false)
 end
end
return true
end