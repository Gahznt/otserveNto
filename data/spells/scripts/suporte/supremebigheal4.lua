local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(cid, level, maglevel)
	local min = ((level*8)+(maglevel*15))
	local max = ((level*9)+(maglevel*19)) --8000 =  Lv 150 + Nin 150 
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	local waittime = 900 -- Tempo de exhaustion
	local storage = 8205

if exhaustion.check(cid, storage) then
	return false
end
	exhaustion.set(cid, storage, waittime)
	return doCombat(cid, combat, var)
end
