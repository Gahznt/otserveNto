local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
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
addEvent(doSendDistanceShoot, 1, getCreaturePosition(cid), pos, 147)
addEvent(doSendMagicEffect, 300, {x = pos.x+1, y = pos.y+1, z = pos.z}, 82)
addEvent(doSendMagicEffect, 500, {x = pos.x+1, y = pos.y+1, z = pos.z}, 90)
addEvent(doSendMagicEffect, 1350, {x = pos.x+1, y = pos.y+1, z = pos.z}, 82)
addEvent(onCastSpell1, 500, parameters)
return TRUE
end 