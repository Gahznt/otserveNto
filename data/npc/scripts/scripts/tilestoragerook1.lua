function onStepIn(cid, item, position, fromPosition)
          if getPlayerStorageValue(cid, 13201) <= 0 then
                    doTeleportThing(cid, fromPosition, TRUE)
                    doPlayerSendCancel(cid, "Voce precisa completar a primeira missao para passar por aqui!! .")
          end
          return TRUE
end