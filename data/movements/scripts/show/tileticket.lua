local message = [[
 
- Tickets Diarios -

Os Tickets sao items especiais que podem ser conquistado por
todos os jogadores do nosso servidor por meio da Recompensa
Diaria dos Hokages ou tambem atraves da Recompensa das Batalhas
Diarias do NPC Mestre de Batalhas !



]]

		--Mensagem que aparecerá ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end