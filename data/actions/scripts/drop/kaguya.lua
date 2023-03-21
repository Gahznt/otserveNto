local time = 3600 -- tempo em segundos para usar
local monster = "Kaguya" -- "Monstro" entre aspas
local pos = {x=1348, y=1466, z=7} -- Posição que irá nascer.
local from,to = {x=1326, y=1451, z=7},{x=1372, y=1482, z=7} -- area total da area onde o monstro vai estar


function onUse(cid, item, frompos, itemex, topos)
	if getStorage(7554) - os.time() < 1 then
			doSetStorage(7554, os.time() + time)
			addEvent(function() doCreateMonster(monster, pos) end, 5000)
			doCreatureSay(cid, "Prepare-se !", TALKTYPE_MONSTER)
	else
		doPlayerSendCancel(cid, "Voce precisa esperar ".. getStorage(7554) - os.time() .." Segundos restantes")
		doSendMagicEffect(getThingPos(cid), CONST_ME_POFF) return true
	end	
	return true
end