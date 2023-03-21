local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 28)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -5.0, -1200, -5.0, -1400)

function onCastSpell(cid, var)
local waittime = 2
local storage = 8232

if exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+3, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 306)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end
