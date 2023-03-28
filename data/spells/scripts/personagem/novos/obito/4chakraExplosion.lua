local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 501)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -12.0, -1600, -12.0, -1800)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 501)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -12.0, -1600, -12.0, -1800)


arr1 = {
	{0, 0, 1, 0, 0},
	{0, 1, 1, 1, 0},
	{1, 1, 3, 1, 1},
	{0, 1, 1, 1, 0},
	{0, 0, 1, 0, 0}
}


arr2 = {
    {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
    {0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0},
	{1, 1, 1, 0, 0, 3, 0, 0, 1, 1, 1},
	{0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
    {0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}
}
	
local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)

setCombatArea(combat1, area1)
setCombatArea(combat2, area2)

local function onCastSpell1(parameters)
   return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
   return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end


function onCastSpell(cid, var)
local waittime = 1.5 -- Tempo de exhaustion
local storage = 8223

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 400, parameters)
addEvent(onCastSpell2, 800, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 