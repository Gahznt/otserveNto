local message = [[
Susano Arch Rare Nivel [ I ]

Conquistável em :
Drop - Sasuke The Last

Bonus Especial :
+ 20 Leveis em Skill Destreza.


]]

		--Mensagem que aparecerá ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end