local time = 14400 -- tempo em segundos para usar
local monster = "Yonbi no Miwaku" -- "Monstro" entre aspas
local pos = {x=1160, y=730, z=5} -- Posição que irá nascer.


function onUse(cid, item, frompos, itemex, topos)
	if getStorage(23513) - os.time() < 1 then
			doSetStorage(23513, os.time() + time)
			addEvent(function() doCreateMonster(monster, pos) end, 5000)
			doCreatureSay(cid, "Prepare-se !", TALKTYPE_MONSTER)
	
	else
		doPlayerSendCancel(cid, "Voce precisa esperar ".. getStorage(23513) - os.time() .." Segundos restantes")
		doSendMagicEffect(getThingPos(cid), CONST_ME_POFF) return true
	end	
	return true
end