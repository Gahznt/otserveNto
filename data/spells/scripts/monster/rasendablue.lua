local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_PURPLE)
-- setCombatParam(combat, COMBAT_PARAM_EFFECT, 443)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.0, -200, -1.0, -200)

local area = createCombatArea( AREA_CIRCLE3X3, AREA_CIRCLE3X3)
setCombatArea(combat, area)

function onCastSpell(cid, var)
local position1 = {x=getThingPosition(getCreaturePosition(cid)).x+3, y=getThingPosition(getCreaturePosition(cid)).y+2, z=getThingPosition(getCreaturePosition(cid)).z}
doSendMagicEffect(position1, 641) 
return doCombat(cid, combat, var)
end
