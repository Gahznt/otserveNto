domodlib('task_func')

local t = {
storage = 621232,  -- storage, so mude se tiver usando pra outra coisa.
tempo = 24, -- Tempo em horas.
}


function onUse(cid, item, fromPos, itemEx, toPos)
    if getPlayerStorageValue(cid, t.storage) < os.time() then
       doPlayerSendTextMessage(cid, 22, "Você ganhou 1 Ponto de missão.")
	   doSendMagicEffect(getPlayerPosition(cid), 5)
       setPlayerStorageValue(cid, t.storage, os.time() + t.tempo * 60 * 60)
	   setPlayerStorageValue(cid, task_sys_storages[2], (getTaskPoints(cid)+1))
    else
   doPlayerPopupFYI(cid, "[ Onorate Scroll ] Você precisa aguardar ".. getPlayerStorageValue(cid, t.storage) - os.time() .." segundos para usar novamente. ( Cooldown de 24 Horas )")
   doSendMagicEffect(getPlayerPosition(cid), 3)
   end
    return true
end