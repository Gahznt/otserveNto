local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 3)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1497)

function onCastSpell(cid, var)
	doPlayerSay(cid, 'Mokuton !', TALKTYPE_ORANGE_1)
	doShowTimeByPos(cid, variantToPosition(var), 20, 20) -- essa linha aqui
	return doCombat(cid, combat, var)
end