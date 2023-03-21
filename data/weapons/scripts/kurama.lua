local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_ORANGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, 1)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

setCombatFormula(combat, COMBAT_FORMULA_SKILL, 1, 0, 1, 0)

local area = createCombatArea({
	{0, 0, 0},
	{0, 3, 0},
	{0, 0, 0}
})

setCombatArea(combat, area)

function onUseWeapon(cid, var)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 161) 
	return doCombat(cid, combat, var)
end
