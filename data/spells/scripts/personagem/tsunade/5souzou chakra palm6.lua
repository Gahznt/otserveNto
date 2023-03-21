local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 213)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.25, -300, -1.25, -350)
 
local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell3(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell4(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

 
function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(onCastSpell1, 100, parameters)
addEvent(doSendMagicEffect, 100, {x = poz.x+1, y = poz.y+1, z = poz.z}, 506)
addEvent(onCastSpell2, 300, parameters)
addEvent(doSendMagicEffect, 300, {x = poz.x+1, y = poz.y+1, z = poz.z}, 506)
addEvent(onCastSpell3, 600, parameters)
addEvent(doSendMagicEffect, 600, {x = poz.x+1, y = poz.y+1, z = poz.z}, 506)
addEvent(onCastSpell4, 900, parameters)
addEvent(doSendMagicEffect, 900, {x = poz.x+1, y = poz.y+1, z = poz.z}, 506)
return TRUE
end 