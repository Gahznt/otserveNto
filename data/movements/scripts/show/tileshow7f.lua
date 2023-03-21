local message = [[
Set Saga Nível [ 7 ]

Conquistável em :
Drop - Kyuubi do Recanto das Bijus

Requer Lv : 70 e Jounin

]]


function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end