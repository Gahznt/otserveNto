--- CRITICAL System by Night Wolf
   
  local config = {
   effectonuse = 5, -- efeito que sai
   levelscrit = 15,  --- leveis que terão
   storagecrit = 48910 -- storage que será verificado
   }
   
function onUse(cid, item, frompos, item2, topos)
    if getPlayerStorageValue(cid, config.storagecrit) < config.levelscrit then
	doRemoveItem(item.uid, 1)
	doSendMagicEffect(topos,config.effectonuse)
	setPlayerStorageValue(cid, config.storagecrit, getPlayerStorageValue(cid, config.storagecrit)+1)
	doPlayerPopupFYI(cid,"Você aumentou seu Nível de Crítico para ["..(getPlayerStorageValue(cid, config.storagecrit)+1).."/"..config.levelscrit.."].")
	elseif getPlayerStorageValue(cid, config.storagecrit) >= config.levelscrit then
	doPlayerPopupFYI(cid,"Você atingiu o Nível Máximo (15).\n                     Parabéns!")
    return 0
    end
return 1
end