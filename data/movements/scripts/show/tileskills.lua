local message = [[
 
- Area de Treinamento -

Skills como Ninjutsu, Taijutsu, Agilidade e Destreza
Devem ser Treinadas por todos os jogadores que desejam
aprimorar o Dano de seu personagem.

Ninjutsu :
O Ninjutsu e o Level de seu personagem sao multiplicadores
de DANO gerado por Jutsus !

Taijutsu :
Quando treinado, aprimora a velocidade de seu ataque.

Agilidade :
Quando treinado, aprimora o Dano da sua arma de curta
distancia, exemplo : espadas, machados e luvas.

Destreza :
Quando treinada, influencia diretamente no Dano de armas
a distância, exemplo : shurikens, kunais, dentre outras.


]]

		--Mensagem que aparecerá ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end