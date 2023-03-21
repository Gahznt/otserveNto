local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_GREY)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.0, -200, -1.0, -200)

local area = createCombatArea( AREA_CIRCLE3X3, AREA_CIRCLE3X3)
setCombatArea(combat, area)

function onCastSpell(cid, var)
local positionME = {x=getPlayerPosition(cid).x+3, y=getPlayerPosition(cid).y+2, z=getPlayerPosition(cid).z}
doSendMagicEffect(positionME, 303) 
return doCombat(cid, combat, var)
end
