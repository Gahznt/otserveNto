local message = [[
Kurama Sword Rare Nivel [ I ]

Conquistável em :
Drop - Kyuubi do Recanto das Bijus

Bonus Especial :
Proteção Extra a todo tipo de dano em 5 %.

]]

		--Mensagem que aparecerá ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end