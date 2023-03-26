function onGetFormulaValues(cid, level, maglevel)
    min = -(level * 1.4 + maglevel * 1.6) * 2
    max = -(level * 1.8 + maglevel * 2) * 2 
    return min, max
end

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_ORANGE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatCallback(combat1, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
arr1 = {{3}}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)

local function onCastSpell1(cid, var)
    local pos = getCreaturePosition(cid)

    local target = getCreatureTarget(cid);
    if not target or not isCreature(target) then
        return false
    end

    local position1 = getThingPosition(target)
    if not position1 then
        return false
    end

    local position1 = {
        x = getThingPosition(target).x,
        y = getThingPosition(target).y,
        z = getThingPosition(target).z
    }
	local position2 = {
        x = getThingPosition(target).x + 1,
        y = getThingPosition(target).y + 1,
        z = getThingPosition(target).z
    }
    doSendMagicEffect(position2, 509)
    doSendMagicEffect(position1, 691)
    return doCombat(cid, combat1, var)
end

function onCastSpell(cid, var)
    local waittime = 2
    local storage = 8242

    if exhaustion.check(cid, storage) then
        doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, storage) ..
            " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
        return false
    end
    local parameters = {
        cid = cid,
        var = var
    }
    addEvent(onCastSpell1, 100, cid, var)
    addEvent(onCastSpell1, 300, cid, var)
    addEvent(onCastSpell1, 500, cid, var)
    addEvent(onCastSpell1, 700, cid, var)
    addEvent(onCastSpell1, 900, cid, var)
    exhaustion.set(cid, storage, waittime)
    return TRUE
end
