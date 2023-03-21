local t = {
storage = 611108,  -- storage, so mude se tiver usando pra outra coisa.
tempo = 24, -- Tempo em horas.
}


function onUse(cid, item, fromPos, itemEx, toPos)
	 if getPlayerStorageValue(cid, t.storage) < os.time() then
		doPlayerAddExp(cid, 35000)
		doPlayerSendTextMessage(cid,22,"Você extraiu um Kekkei Generator.")
		setPlayerStorageValue(cid, t.storage, os.time() + t.tempo * 60 * 60)
		doSendMagicEffect(getPlayerPosition(cid), 442)
	else
	doPlayerSendTextMessage(cid,22,"Você precisa aguardar ".. getPlayerStorageValue(cid, t.storage) - os.time() .." segundos para extrair esse gerador novamente.")
	doSendMagicEffect(getPlayerPosition(cid), 3)
   end
    return true
end