function onUse(cid, item, frompos, item2, topos)

  queststatus = getPlayerStorageValue(cid,50100)
  if queststatus == -1 then
  doPlayerSendTextMessage(cid,22,"Você ativou o modo Gunbai Protect.")
  doPlayerRemoveItem(cid, 11425, 1)
  doPlayerAddDodgeItem(cid, 11425, 5.0)
  --setPlayerStorageValue(cid,50100,1)
  else
  doPlayerSendTextMessage(cid,22,"Gunbai já está em modo Protect.")
end
return true
end 