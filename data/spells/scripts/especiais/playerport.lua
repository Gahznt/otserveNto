local config = {
storage = 49708,
tempo = 1.5,
effect = 65
}

local exception = {"Trainer", "Training Monk", "GOD"}
﻿
function onCastSpell(cid, var)
local name = getCreatureName(getCreatureTarget(cid))
if not isInArray(exception, name) then
	if getPlayerStorageValue(cid, config.storage) <= 0 then
		doPlayerSetStorageValue(cid, config.storage, 1)
		doSendMagicEffect(getThingPos(cid), config.effect)
		doSendMagicEffect(getThingPos(variantToNumber(var)), config.effect)
		addEvent(function()
		doPlayerSetStorageValue(cid, config.storage, 0)
			if isCreature(cid) and isCreature(variantToNumber(var)) then
				if isWalkable(getCreaturePosition(variantToNumber(var)), false, true, true) then
					doTeleportThing(cid, getThingPos(variantToNumber(var)), true)
					arr = {3}
					doAreaCombatHealth(cid, 1, getThingPos(variantToNumber(var)), arr, -getPlayerLevel(cid), -2*(getPlayerLevel(cid)), 0)
				elseif isCreature(cid) and not isWalkable(getCreaturePosition(variantToNumber(var)), false, true, true) then
					doPlayerSendCancel(cid, "You can't reach your target")
				end
			end
		end, 1000*config.tempo)
	elseif getPlayerStorageValue (cid, config.storage) > 0 then
		doSendMagicEffect(getThingPos(cid), 2)
		doPlayerSendCancel(cid, "You've already set your target.")
	end
	else﻿
	doPlayerSendCancel (cid, "You can't use this spell in this creature.")
	return false
	end
return true﻿﻿
end