local message = [[
Kaguya Defense Rare Nivel [ II ]

Conquistável em :
Drop - Kaguya

Bonus Especial :
Proteção Extra a todo tipo de dano em 10 %.
Buff Kaguya :
Health And Chakra Regeneration 350p/s.

]]

		--Mensagem que aparecerá ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end