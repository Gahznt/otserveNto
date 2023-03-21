local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 4)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -5.0, -1200, -5.0, -1400)


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
addEvent(doSendMagicEffect, 100, {x = pos.x, y = pos.y+1, z = pos.z}, 517)
addEvent(onCastSpell1, 200, parameters)
return TRUE
end 