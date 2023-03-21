local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(cid, level, maglevel)
	local min = ((level*0)+(maglevel*0)+1000)
	local max = ((level*0)+(maglevel*0)+1500)
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	local waittime = 1 -- Tempo de exhaustion
	local storage = 8205

if exhaustion.check(cid, storage) then
	return false
end
	exhaustion.set(cid, storage, waittime)
	return doCombat(cid, combat, var)
end
