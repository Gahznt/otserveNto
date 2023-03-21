local mina = {
[4444] =		{delay  = 1, -- seconds
		mindamage = -1346,
		maxdamage = -1756,
		damagetype = COMBAT_FIREDAMAGE}
}

function onStepIn(cid, item, position, fromPosition)
local m = mina[item.actionid]
local function boom(cid, min, max, damagetype, pos)
		-- COMBAT FUNCTION --  
		local area = {
				{x = pos.x+1, y = pos.y, z = pos.z},
				{x = pos.x, y = pos.y+1, z = pos.z},
				{x = pos.x-1, y = pos.y, z = pos.z},
				{x = pos.x+1, y = pos.y+1, z = pos.z},
				{x = pos.x-1, y = pos.y-1, z = pos.z},
				{x = pos.x, y = pos.y-1, z = pos.z},
				{x = pos.x+1, y = pos.y-1, z = pos.z},
				{x = pos.x-1, y = pos.y+1, z = pos.z},
				{x = pos.x, y = pos.y, z = pos.z}
				}
		for i = 1,#area do
				doAreaCombatHealth(0, damagetype, area[i], 0, min, max, 0)
			   		 end
		return true
end
		if getPlayerName(cid) == getItemAttribute(item.uid, "description") then
				return doPlayerSendCancel(cid, "This is your bomb.")
		end
		addEvent(boom, m.delay * 100, cid, m.min, m.max, m.damagetype, position)
		doTargetCombatHealth(boom, cid, COMBAT_PHYSICALDAMAGE, -501, -902, CONST_ME_NONE)
		doItemEraseAttribute(item.uid, "aid")
		return true
end