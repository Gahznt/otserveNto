function onStepIn(cid, item, position, fromPosition)
          if getPlayerStorageValue(cid, 11007) <= 0 then
                    doTeleportThing(cid, fromPosition, TRUE)
                    doPlayerSendCancel(cid, "Voce precisa completar QUEST DO CASTELO GGN! .")
          end
          return TRUE
end