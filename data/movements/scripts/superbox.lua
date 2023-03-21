local message = [[
Rare Box 

Conquistável em :
Recompensa P/ Kages / NPC Kakashi

Sorteie ( 1 ) Item

Items disponíveis : 
Items Raros Nível III
]]

		

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end