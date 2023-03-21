local pos = {
   {x = 242, y = 144, z = 8},
   {x = 256, y = 144, z = 8},
   {x = 242, y = 158, z = 8},
   {x = 256, y = 158, z = 8},
}


local config = {
key = 14567, -- storage que salvara a pos (Note que esse e os proximos 2 storages seguintes serao utilizados)
effect = 82, -- efeito ao entrar no kamui
storagecol = 14565, -- storage que fica salvo o cooldown 
cooldown = 900, -- tempo entre 1 uso e outro
from = {x=207, y=127, z=5}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)
to = {x=300, y=178, z=10}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)  
from1 = {x=781, y=853, z=6}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)
to1 = {x=891, y=953, z=8}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)   
from2 = {x = 488, y = 90, z = 3}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)
to2 = {x = 616, y = 294, z = 10}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)  
msgligada = true, -- true/false para ligar/desligar o envio de msg.
msg = "Lets Go", -- msg a ser enviada ao dizer a spell
exceptions = {'trainer', 'emperium', 'informante anbu', 'informante akatsuki', 'gamaken', 'gamahiro', 'gamaken', 'Senju Master Saga', 'Kabuto Saga', 'Hashirama Saga', 'Sarutobi Saga', 'Rikkudou Sennin Saga', 'Juubi', 'Kurama', 'Gobi', 'Son Goku', 'Matatabi', 'Shukaku', 'Hagoromo', 'Shisui', 'Naruto', 'Sasuke', 'Neji', 'Lee', 'Gaara', 'Zabuza', 'Kisame', 'Deidara', 'Itachi', 'Madara', 'Kaguya', 'Rikkudo', 'Lee Boss', 'Gaara Boss', 'Kisame Boss', 'Madara Boss', 'Haku Boss', 'Sasuke Boss', 'Neji Boss', 'Zabuza Boss', 'Itachi Boss', 'Deidara Boss', 'Suigetsu Boss', 'Shisui Boss', 'Red Naruto Boss', 'Crystal Samurai Boss', 'Kyuubi', 'Kurama', 'Itachi Izanami', 'Obito Black Zetsu', 'Ashura', 'Kaguya Rare', 'Guy Open Gate', 'Uchiha Madara', 'Sasuke The Last'} --- nome das criaturas que não poderão ser levadas pro kamui (sempre em minúsculo e entre aspas)
}

function onCastSpell(cid, var)
	if isInRange(getCreaturePosition(cid), config.from, config.to) then
		doPlayerSendCancel(cid, "Você não pode usar esse jutsu aqui.")
		doSendMagicEffect(getCreaturePosition(cid), 2)
	return false
	end
	if isInRange(getCreaturePosition(cid), config.from1, config.to1) then
		doPlayerSendCancel(cid, "Você não pode usar esse jutsu aqui.")
		doSendMagicEffect(getCreaturePosition(cid), 2)
	return false
	end
	if isInRange(getCreaturePosition(cid), config.from2, config.to2) then
		doPlayerSendCancel(cid, "Você não pode usar esse jutsu aqui.")
		doSendMagicEffect(getCreaturePosition(cid), 2)
	return false
	end
	if getPlayerStorageValue(cid, config.storagecol) - os.time() <= 0 then	
		for i = 1, #config.exceptions do
			if getCreatureName(variantToNumber(var)):lower() == config.exceptions[i] then
				doPlayerSendCancel(cid, "You can't take ".. getCreatureName(variantToNumber(var)) .." to Kamui.")
				doSendMagicEffect(getCreaturePosition(cid), 2)
			return false
			end
		end
		setPlayerStorageValue(cid, config.storagecol, os.time() + config.cooldown)
		if config.msgligada then
			doCreatureSay(cid, config.msg, 20)
		end
		savePos(cid, config.key)
		savePos(variantToNumber(var), config.key)
		addEvent(doSendMagicEffect, 1, getCreaturePosition(cid), config.effect)
		addEvent(doSendMagicEffect, 1, getCreaturePosition(variantToNumber(var)), config.effect)
		doTeleportThing(cid, pos[math.random(1, #pos)])
		doTeleportThing(variantToNumber(var), pos[math.random(1, #pos)])
	else
		doPlayerSendCancel(cid, "Jutsu em cooldown.")
		doSendMagicEffect(getCreaturePosition(cid), 2)
	return false
	end
return true
end