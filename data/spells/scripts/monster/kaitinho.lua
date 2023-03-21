local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.0, -200, -1.0, -200)

local area = createCombatArea( AREA_CROSS1X1, AREA_CROSS1X1)
setCombatArea(combat, area)

function onCastSpell(cid, var)
local position1 = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}

doSendMagicEffect(position1, 53)
return doCombat(cid, combat, var)
end
