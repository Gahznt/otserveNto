local config = {
	removeOnUse = "yes",
	usableOnTarget = "yes", -- can be used on target? (fe. healing friend)
	splashable = "no",
	realAnimation = "yes", -- make text effect visible only for players in range 1x1
	healthMultiplier = 1.0,
	manaMultiplier = 1.0
}

config.removeOnUse = getBooleanFromString(config.removeOnUse)
config.usableOnTarget = getBooleanFromString(config.usableOnTarget)
config.splashable = getBooleanFromString(config.splashable)
config.realAnimation = getBooleanFromString(config.realAnimation)

local POTIONS = {
	[7618] = {empty = 7636, splash = 2, health = {500, 750}, level = 1}, -- health potion
	[7588] = {empty = 7634, splash = 2, health = {1000, 1500}, level = 40}, -- strong health potion
	[7591] = {empty = 7635, splash = 2, health = {2000, 2500}, level = 80}, -- great health potion
	[7620] = {empty = 7636, splash = 7, mana = {500, 1000}, level = 1}, -- mana potion
	[7589] = {empty = 7634, splash = 7, mana = {1500, 2000}, level = 40}, -- strong mana potion
	[7590] = {empty = 7635, splash = 7, mana = {2500, 3000}, level = 80}, -- great mana potion
	[7441] = {empty = 7635, splash = 2, health = {3250, 3500}, mana = {2500, 3000}, level = 110}, -- great spirit potion
}

local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, (getConfigInfo('timeBetweenExActions') - 2000))

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local potion = POTIONS[item.itemid]
	if(not potion) then
		return false
	end

	if(not isPlayer(itemEx.uid) or (not config.usableOnTarget and cid ~= itemEx.uid)) then
		if(not config.splashable) then
			return false
		end

		if(toPosition.x == CONTAINER_POSITION) then
			toPosition = getThingPos(item.uid)
		end

		doDecayItem(doCreateItem(2016, potion.splash, toPosition))
		doTransformItem(item.uid, potion.empty)
		return true
	end

	if(hasCondition(cid, CONDITION_EXHAUST_HEAL)) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return true
	end

	if(((potion.level and getPlayerLevel(cid) < potion.level) or (potion.vocations and not isInArray(potion.vocations, getPlayerVocation(cid)))) and
		not getPlayerCustomFlagValue(cid, PLAYERCUSTOMFLAG_GAMEMASTERPRIVILEGES))
	then
		doCreatureSay(itemEx.uid, "Somente " .. potion.vocStr .. (potion.level and (" do level " .. potion.level) or "") .. " ou maior para usar este potion.", TALKTYPE_ORANGE_1)
		return true
	end

	local health = potion.health
	if(health and not doCreatureAddHealth(itemEx.uid, math.ceil(math.random(health[1], health[2]) * config.healthMultiplier))) then
		return false
	end

	local mana = potion.mana
	if(mana and not doPlayerAddMana(itemEx.uid, math.ceil(math.random(mana[1], mana[2]) * config.manaMultiplier))) then
		return false
	end

	doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_EXPLOSIONHIT)
	if(not realAnimation) then
		doCreatureSay(itemEx.uid, "Glup Glup...", TALKTYPE_ORANGE_1)
	else
		for i, tid in ipairs(getSpectators(getCreaturePosition(cid), 1, 1)) do
			if(isPlayer(tid)) then
				doCreatureSay(itemEx.uid, "Glup Glup...", TALKTYPE_ORANGE_1, false, tid)
			end
		end
	end

	doAddCondition(cid, exhaust)
	if(not potion.empty or config.removeOnUse) then
		doRemoveItem(item.uid, 1)
		return true
	end
	doRemoveItem(item.uid, 1)
     doPlayerAddItem(cid, potion.empty, 1)
	return true
end
