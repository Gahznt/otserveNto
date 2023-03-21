local config = {
    storage = 10002, --use empty storage
    exhaust = 180 --Exhaust is in seconds 600 equals 10min
}


local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, (getConfigInfo('timeBetweenExActions') - 100))


function onUse(cid, item, fromPosition, itemEx, toPosition)
	local food = SPECIAL_FOODS[item.itemid]
	if(food == nil) then
		return false
	end
	if (getPlayerStorageValue(cid, config.storage) <= os.time()) then 
	setPlayerStorageValue(cid, config.storage, os.time() + config.exhaust)
	if(not doAddCondition(cid, exhaust)) then
	return true
	end

	doCreatureAddHealth(cid, getCreatureMaxHealth(cid) - getCreatureHealth(cid))
	doRemoveItem(item.uid, 1)

	doCreatureSay(cid, food, TALKTYPE_MONSTER)
	
	return true
	end
end
