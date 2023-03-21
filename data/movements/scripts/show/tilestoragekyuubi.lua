function onStepIn(cid, item, position, fromPosition)
          if getPlayerStorageValue(cid, 35000) <= 0 then
                    doTeleportThing(cid, fromPosition, TRUE)
                    doPlayerSendCancel(cid, "Voce precisa do chakra da kyuubi para passar por aqui.")
          end
          return TRUE
end