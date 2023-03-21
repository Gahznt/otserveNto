local t = {
storage = 613303,  -- storage, so mude se tiver usando pra outra coisa.
tempo = 24, -- Tempo em horas.
}


function onUse(cid, item, fromPos, itemEx, toPos)
	if getPlayerStorageValue(cid, t.storage) < os.time() then
		doPlayerAddItem(cid, 9636, 1)
		doPlayerSendTextMessage(cid,22,"Você encontrou um Argila Bunshin do Deidara.")
		setPlayerStorageValue(cid, t.storage, os.time() + t.tempo * 60 * 60)
	else
	doPlayerSendTextMessage(cid,22,"Você precisa aguardar ".. getPlayerStorageValue(cid, t.storage) - os.time() .." segundos para encontrar algo por aqui.")
	doSendMagicEffect(getPlayerPosition(cid), 3)
   end
    return true
end