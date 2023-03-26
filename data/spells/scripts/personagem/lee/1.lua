function onGetFormulaValues(cid, level, maglevel)
    min = -(level * 2 + maglevel * 2) * 2
    max = -(level * 2.8 + maglevel * 2.8) * 2
    return min, max
end

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTGREEN)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatCallback(combat1, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

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
        x = getThingPosition(target).x + 1,
        y = getThingPosition(target).y + 1,
        z = getThingPosition(target).z
    }
    doSendMagicEffect(position1, 41)
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
    for k = 1, 5 do
        addEvent(function()
            if isCreature(cid) then
                addEvent(onCastSpell1, 1, cid, var)
            end
        end, 1 + ((k - 1) * 500))
    end
    exhaustion.set(cid, storage, waittime)
    return true
end
