local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.0, -600, -3.0, -800)

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)

local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 100, parameters)
local positionME = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
doSendMagicEffect(positionME, 141) 
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 49)
return TRUE
end