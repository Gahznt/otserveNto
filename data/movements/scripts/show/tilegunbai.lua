local message = [[
Gunbai Rare Nivel [ III ]

Conquistável em :
Drop - Old Madara

Bonus Especial : 
Defesa 200 
Proteção Extra a todo tipo de dano em 12 %.
Jutsu - Reflect Gunbai

]]

		--Mensagem que aparecerá ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end