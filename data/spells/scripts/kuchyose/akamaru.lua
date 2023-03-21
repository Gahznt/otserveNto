function onCastSpell(cid, var)

local waittime = 60 -- Tempo de exhaustion
local storage = 8321

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

        local maxSummons = 1    
        for n = 1, maxSummons do
                if #getCreatureSummons(cid) >= maxSummons then
                        break
                end
                local clone = doCreateMonster("Akamaru Clone", getThingPos(cid), false)
                if isCreature(clone) then
                        doTeleportThing(clone, getThingPos(cid), false)
                        doConvinceCreature(cid, clone)
                        setCreatureMaxHealth(clone, getCreatureMaxHealth(cid))
                        doCreatureAddHealth(clone, getCreatureHealth(cid))
                        doSendMagicEffect(getThingPos(cid), 111)
                end
        end
		local poz = getCreaturePosition(cid) -- effeito no caster
		local seconds = 15
		for _, monsters in ipairs(getCreatureSummons(cid)) do
				addEvent(doRemoveCreature, seconds*1000, monsters)
				addEvent(doSendMagicEffect, seconds*1000, {x = poz.x, y = poz.y, z = poz.z}, 111)
		end
		
exhaustion.set(cid, storage, waittime)
return true
end




