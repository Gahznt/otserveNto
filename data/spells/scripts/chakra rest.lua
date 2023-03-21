local combat = createCombatObject() 
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN) 
setCombatParam(combat, COMBAT_PARAM_EFFECT, 5) 
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1) 
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0) 
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE) 
--setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 1.2, -30, 1.6, 0) 

function onGetFormulaValues(cid, level, maglevel) 
    min = (level * 1 + maglevel * 1) * 10.0 - 0 
    max = (level * 1 + maglevel * 1) * 12.0 
     
    if min < 250 then 
        min = 250 
    end 

    return min, max 
end 

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues") 

function onCastSpell(cid, var) 
	local waittime = 2 -- Tempo de exhaustion
	local storage = 8205

if exhaustion.check(cid, storage) then
	return false
end
	exhaustion.set(cid, storage, waittime)
    return doCombat(cid, combat, var) 
end  