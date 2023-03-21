local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 34)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.0, -25, -0.0, -50) 

function onCastSpell1(cid, var)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 0)
return doCombat(cid, combat, var)
end

function onCastSpell(cid, var)
for k = 1, 2 do
    addEvent(function()
        if isCreature(cid) then
            addEvent(onCastSpell1, 1, cid, var)
        end
    end, 1 + ((k-1) * 300))
end
return true
end