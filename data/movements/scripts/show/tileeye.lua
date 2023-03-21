local message = [[
Rinnegan Eye Rare Nivel [ II ]

Conquistável em :
Missão - Renegade Nagato

Bonus Especial :
+ 20 Leveis em Skill Ninjutsu.
Jutsu - Rinnegan Atract 

]]

		--Mensagem que aparecerá ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end