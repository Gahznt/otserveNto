local message = [[

						( Guia Nto Hard )

Area Restrita : Complete a Quest do Set Saga Nível ( 1 ) primeiro.

Proximo a saída Sul de Konoha, procure pela criatura Grub até encontrar 
uma passagem para a Quest do Set Level 10 !

]]

function onStepIn(cid, item, position, fromPosition)
          if getPlayerStorageValue(cid, 11111) <= 0 then
                    doTeleportThing(cid, fromPosition, TRUE)
                    doPlayerPopupFYI(cid, message)
          end
          return TRUE
end