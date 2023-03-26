function onGetFormulaValues(cid, level, maglevel)
    min = -(level * 1.3 + maglevel * 1.1) * 1.2
    max = -(level * 1.5 + maglevel * 1.8) * 1.3 
    return min, max
end

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTGREEN)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatCallback(combat1, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local function onCastSpell1(cid, var)
local pos = getCreaturePosition(cid)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 60)
return doCombat(cid, combat1, var)
end
 
function onCastSpell(cid, var)
for k = 1, 2 do
    addEvent(function()
        if isCreature(cid) then
            addEvent(onCastSpell1, 1, cid, var)
        end
    end, 1 + ((k-1) * 500))
end
return true
end