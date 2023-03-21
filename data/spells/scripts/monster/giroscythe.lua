local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_GREY)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.7, -400, -1.7, -400)

local area = createCombatArea( AREA_CIRCLE2X2, AREA_CIRCLE2X2)
setCombatArea(combat, area)

function onCastSpell(cid, var)
local position1 = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
doSendMagicEffect(position1, 139)
return doCombat(cid, combat, var)
end
