local time = 7200 -- tempo em segundos para usar
local monster = "King Octopus" -- "Monstro" entre aspas
local pos = {x=434, y=70, z=5} -- Posi��o que ir� nascer.

function onUse(cid, item, frompos, itemex, topos)
	if getStorage(23214) - os.time() < 1 then
		
			doSetStorage(23214, os.time() + time)
			addEvent(function() doCreateMonster(monster, pos) end, 5000)
			doCreatureSay(cid, "Prepare-se !", TALKTYPE_MONSTER)
		
	else
		doPlayerSendCancel(cid, "Voce precisa esperar ".. getStorage(23214) - os.time() .." Segundos restantes")
		doSendMagicEffect(getThingPos(cid), CONST_ME_POFF) return true
	end	
	return true
end