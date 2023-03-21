local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 4)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.25, -300, -1.25, -350)


arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)


local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(doSendDistanceShoot, 100, getCreaturePosition(cid), pos, 112)
addEvent(onCastSpell1, 125, parameters)
addEvent(doSendDistanceShoot, 300, getCreaturePosition(cid), pos, 112)
addEvent(onCastSpell1, 325, parameters)
addEvent(doSendDistanceShoot, 500, getCreaturePosition(cid), pos, 112)
addEvent(onCastSpell1, 525, parameters)
addEvent(doSendDistanceShoot, 700, getCreaturePosition(cid), pos, 112)
addEvent(onCastSpell1, 725, parameters)
return TRUE
end 