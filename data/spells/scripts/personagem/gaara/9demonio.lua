local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.0, -0, -0.0, -0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 28)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -15.0, -1600, -15.0, -1800)

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

function onCastSpell(cid, var)

local waittime = 4
local storage = 8016

if exhaustion.check(cid, storage) then
return false
end
local position1 = {x=getPlayerPosition(cid).x+2, y=getPlayerPosition(cid).y+2, z=getPlayerPosition(cid).z}
doSendMagicEffect(position1, 535)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 10, parameters)
addEvent(onCastSpell2, 200, parameters)
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
addEvent(doSendMagicEffect, 100, {x = pos.x+1, y = pos.y, z = pos.z}, 543)
exhaustion.set(cid, storage, waittime)
return TRUE
end