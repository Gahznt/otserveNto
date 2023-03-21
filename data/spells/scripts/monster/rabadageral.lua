local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PURPLE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 157)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.0, -200, -1.0, -200)

local area = createCombatArea( AREA_CROSS6X6, AREA_CROSS6X6)
setCombatArea(combat, area)

function onCastSpell(cid, var)
return doCombat(cid, combat, var)
end
