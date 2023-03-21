local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_GREY)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -2.0, -400, -2.0, -600) 


function onCastSpell(cid, var)

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 196)
return doCombat(cid, combat, var)
end
