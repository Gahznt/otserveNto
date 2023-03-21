local condition = createConditionObject(CONDITION_MUTED)
setConditionParam(condition, CONDITION_PARAM_TICKS, 6000)


local chance = 100


function silence(tar, text)
    if(isCreature(tar) == true) then
        doSendAnimatedText(getCreaturePosition(tar), text, 215)
        doAddCondition(tar, condition)
    end
    return true
end


function onCastSpell(cid, var)
local waittime = 125
local storage = 5358

if exhaustion.check(cid, storage) then
doCreatureSay(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.", TALKTYPE_MONSTER)
return false
end
    local tar = getCreatureTarget(cid)
    if hasCondition(tar, CONDITION_MUTED) == true then
        return false
    else
        if isCreature(tar) == true then
if math.random(1,100) <= chance then
local text = "Shinigami"
                    silence(tar, text)     
					exhaustion.set(cid, storage, waittime)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 273)
else
local text = "MISS"
doSendAnimatedText(getCreaturePosition(tar), text, 215)
end
        else
            if isPlayer(cid) == true then
                doPlayerSendCancel(cid, "O Selo Shinigami somente funciona em players")
            end
            return false
        end
    end
    return true
end