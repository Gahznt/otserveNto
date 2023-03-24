function onGetFormulaValues(cid, level, maglevel)
    min = -(level * 7.28 + maglevel * 7.48) * 7.4
    max = -(level * 8.34 + maglevel * 8.34) * 8.4
    return min, max
end

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_ORANGE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 83)
setCombatCallback(combat1, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
arr1 = {{3}}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)

local function onCastSpell1(cid, var)
    local pos = getCreaturePosition(cid)
    local position1 = {
        x = getThingPosition(getCreatureTarget(cid)).x,
        y = getThingPosition(getCreatureTarget(cid)).y,
        z = getThingPosition(getCreatureTarget(cid)).z
    }
    doSendMagicEffect(position1, 688)
    return doCombat(cid, combat1, var)
end

function onCastSpell(cid, var)
    local parameters = {
        cid = cid,
        var = var
    }
    addEvent(onCastSpell1, 100, cid, var)
    addEvent(onCastSpell1, 300, cid, var)
    addEvent(onCastSpell1, 500, cid, var)
    addEvent(onCastSpell1, 700, cid, var)
    addEvent(onCastSpell1, 900, cid, var)
    return TRUE
end
