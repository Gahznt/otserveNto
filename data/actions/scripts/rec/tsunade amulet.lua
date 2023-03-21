local t = {
storage = 611320,  -- storage, so mude se tiver usando pra outra coisa.
tempo = 1, -- Tempo em horas.
}


function onUse(cid, item, fromPos, itemEx, toPos)
level = 25
if getPlayerLevel(cid) > level then
    if getPlayerStorageValue(cid, t.storage) < os.time() then
       doPlayerSendTextMessage(cid, 22, "Você acabou de receber Blessings of Tsunade.")
	    doPlayerAddBlessing(cid, 1)
        doPlayerAddBlessing(cid, 2)
        doPlayerAddBlessing(cid, 3)
        doPlayerAddBlessing(cid, 4)
		doPlayerAddBlessing(cid, 5)
		doPlayerAddBlessing(cid, 6)
	   doSendMagicEffect(getPlayerPosition(cid), 5)
       setPlayerStorageValue(cid, t.storage, os.time() + t.tempo * 60 * 60)
    else
       doPlayerPopupFYI(cid, "[ Tsunade ] Você precisa aguardar ".. getPlayerStorageValue(cid, t.storage) - os.time() .." segundos para usar novamente. ( Cooldown de 1 Hora )")
   doSendMagicEffect(getPlayerPosition(cid), 3)
   end
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[ Tsunade ] Você não precisa de Blessings por enquanto.")
end
    return true
end

