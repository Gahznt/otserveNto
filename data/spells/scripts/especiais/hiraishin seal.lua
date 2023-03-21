local storage = 9873 -- storage
local item = 2181 -- id do item
local time = 30 -- tempo em segundos que o item vai ficar na posição.


local pos = {}


    function terminus(cid)
     local a = getTileItemById(pos[1], item)
       if a.uid > 0 then
          doRemoveItem(a.uid)
       end
       if isPlayer(cid) then
          doPlayerSendTextMessage(cid, 22, "Expirou Seu Hiraishin Seal.")
       end
        table.remove(pos, 1)
    end


function onCastSpell(cid, var)


if getPlayerStorageValue(cid, storage) - os.time() <= 0 then
  table.insert(pos, getCreaturePosition(cid))
    setPlayerStorageValue(cid, storage, os.time()+time)
     doCreateItem(item, getCreaturePosition(cid))
    doSendMagicEffect(getCreaturePosition(cid), 3)
  addEvent(terminus, time*1000, cid)
elseif getPlayerStorageValue (cid, storage) - os.time() >= 1 then
  doTeleportThing(cid, pos[1])
  doSendMag﻿icEffect(getCreaturePosition(cid), 10)
end


return true﻿
end