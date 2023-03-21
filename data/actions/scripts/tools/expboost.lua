local t = {
storage = 621230,  -- storage, so mude se tiver usando pra outra coisa.
tempo = 24, -- Tempo em horas.
}


function onUse(cid, item, fromPos, itemEx, toPos)
level = 110
if getPlayerLevel(cid) < level then
    if getPlayerStorageValue(cid, t.storage) < os.time() then
       doPlayerSendTextMessage(cid, 22, "Você upou 235 Mil pontos de experiência.")
	   doPlayerAddExp(cid, 235000)
	   doSendMagicEffect(getPlayerPosition(cid), 5)
       setPlayerStorageValue(cid, t.storage, os.time() + t.tempo * 60 * 60)
    else
       doPlayerPopupFYI(cid, "[ Exp Boost] Você precisa aguardar ".. getPlayerStorageValue(cid, t.storage) - os.time() .." segundos para usar novamente. ( Cooldown de 24 Horas )")
   doSendMagicEffect(getPlayerPosition(cid), 3)
   end
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[ Exp Boost ] Você não pode usar boost no level atual.")
end
    return true
end