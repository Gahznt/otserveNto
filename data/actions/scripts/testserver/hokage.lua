function onUse(cid, item, frompos, item2, topos)
local stor = 82747
local position1 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}

setPlayerStorageValue(cid, stor, getPlayerStorageValue(cid, stor)+7)
doPlayerPopupFYI(cid, "Obrigado por participar do Test Server : Você recebeu a permissão para Hokage!" )
doSendMagicEffect(position1, 186)


return TRUE
end