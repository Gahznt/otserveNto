local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTBLUE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.0, -0, -0.0, -0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTBLUE)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -4.0, -800, -4.0, -1000)  

local function onCastSpell1(cid, var)
local pos = getCreaturePosition(cid)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y-1, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 500)
return doCombat(cid, combat1, var)
end

local function onCastSpell2(cid, var)
local pos = getCreaturePosition(cid)
local position2 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position2, 132)
return doCombat(cid, combat2, var)
end 
 
function onCastSpell(cid, var)
for k = 1, 1 do
    addEvent(function()
        if isCreature(cid) then
            addEvent(onCastSpell1, 10, cid, var)
			addEvent(onCastSpell2, 500, cid, var)
        end
    end, 1 + ((k-1) * 1000))
end
return true
end