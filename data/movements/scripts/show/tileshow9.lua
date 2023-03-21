local message = [[
Set Saga Nível [ 9 ]

Conquistável em :

Kaguya Helmet      - Drop   : Kaguya
Royal Flame Coat   - Missão : Obito
Uchiha Kilt        - Drop   : Old Madara
Royal Uchiha Boots - Missão : Madara

Requer Lv : 90

]]

		--Mensagem que aparecerá ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end