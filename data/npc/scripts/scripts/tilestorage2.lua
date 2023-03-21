function onStepIn(cid, item, position, fromPosition)
          if getPlayerStorageValue(cid, 11003) <= 0 then
                    doTeleportThing(cid, fromPosition, TRUE)
                    doPlayerSendCancel(cid, "Voce precisa completar uma quest antes para poder passar aqui! .")
          end
          return TRUE
end