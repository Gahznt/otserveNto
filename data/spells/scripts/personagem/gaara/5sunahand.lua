local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.0, 0, -0.0, 0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -5.0, -1200, -5.0, -1400)

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 1
local storage = 8025

if exhaustion.check(cid, storage) then
return false
end
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 1, parameters)
local target = getCreatureTarget(cid) 
local pos = getCreaturePosition(target)
addEvent(doSendMagicEffect, 100, {x = pos.x+1, y = pos.y, z = pos.z}, 142)
addEvent(onCastSpell2, 400, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end