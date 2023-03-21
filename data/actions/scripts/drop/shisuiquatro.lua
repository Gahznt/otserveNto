local time = 900 -- tempo em segundos para usar
local monster = "Shisui" -- "Monstro" entre aspas
local pos = {x=1412, y=1167, z=5} -- Posição que irá nascer.


function onUse(cid, item, frompos, itemex, topos)
	if getStorage(2412) - os.time() < 1 then
			doSetStorage(2412, os.time() + time)
			addEvent(function() doCreateMonster(monster, pos) end, 5000)
			doCreatureSay(cid, "Prepare-se !", TALKTYPE_MONSTER)
	else
		doPlayerSendCancel(cid, "Voce precisa esperar ".. getStorage(2412) - os.time() .." Segundos restantes")
		doSendMagicEffect(getThingPos(cid), CONST_ME_POFF) return true
	end	
	return true
end