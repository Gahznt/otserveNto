local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 1)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -6.0, -600, -6.0, -600)  
function onCastSpell(cid, var)

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 81)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end
