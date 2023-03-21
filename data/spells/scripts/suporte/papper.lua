local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 8)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 2193)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end

