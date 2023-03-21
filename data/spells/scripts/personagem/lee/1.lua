local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTGREEN)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.0, -150, -1.0, -200)

local function onCastSpell1(cid, var)
local pos = getCreaturePosition(cid)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 41)
return doCombat(cid, combat1, var)
end
 
function onCastSpell(cid, var)
for k = 1, 3 do
    addEvent(function()
        if isCreature(cid) then
            addEvent(onCastSpell1, 1, cid, var)
        end
    end, 1 + ((k-1) * 500))
end
return true
end