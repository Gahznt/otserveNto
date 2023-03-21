
local time = 600 -- tempo em segundos para usar
local monster = "Yonbi" -- "Monstro" entre aspas
local pos = {x=1767, y=772, z=8} -- Posição que irá nascer.

function onUse(cid, item, frompos, itemex, topos)

if item.itemid % 2 == 1 then
doTransformItem(item.uid, item.itemid + 1)
else
doTransformItem(item.uid, item.itemid + -1)
end

if getStorage(2114) - os.time() < 1 then
     doSetStorage(2114, os.time() + time)
     addEvent(function() doCreateMonster(monster, pos) end, 10000)
     doCreatureSay(cid, "Biju Invocada ! Prepare-se !", TALKTYPE_MONSTER)
else
doPlayerSendCancel(cid, "Voce precisa esperar ".. getStorage(2114) - os.time() .." Segundos restantes")
     doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
    end    
return true

end