local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 193)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.25, -300, -1.25, -350)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 193)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -1.25, -300, -1.25, -350)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 193)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -1.25, -300, -1.25, -350)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 193)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -1.25, -300, -1.25, -350)
 
local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
doCombat(parameters.cid, combat3, parameters.var)
end

local function onCastSpell4(parameters)
doCombat(parameters.cid, combat4, parameters.var)
end

 
function onCastSpell(cid, var)
local waittime = 1 -- Tempo de exhaustion
local storage = 8121

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 300, parameters)
addEvent(onCastSpell3, 600, parameters)
addEvent(onCastSpell4, 900, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 