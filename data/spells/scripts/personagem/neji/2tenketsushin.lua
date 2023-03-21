local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 5)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -2.0, -400, -2.0, -600)

function onCastSpell(cid, var)
--local positionME = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
--doSendMagicEffect(positionME, 13) 
return doCombat(cid, combat, var)
end
