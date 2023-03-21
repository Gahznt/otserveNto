local message = [[
 
- Recompensa P/ Videos - 
 
Os Kits podem ser adiquiridos por qualquer jogador
que com boas intencoes produza conteudo no Youtube.

Cada Kit possui um Nivel, de  I a III os Kits possuem
uma recompensa cada vez mais atrativa !

Para conseguir todos os Kits basta produzir conteudo no
YouTube e informar o ADM.

Requerimento :
1 - Os Videos devem ser produzidos utilizando Microfone !
Interessante conter audio de voz.
Dicas de Video :
1 - Voce pode fazer Videos Narrando GamePlay : Quests, PVP, Missoes, Etc.
2 - Voce pode fazer uma saga : Exemplo Varios Episodeos mostrando a evolucao ou caminhada de seu persoangem.
3 - Voce pode fazer videos Tutoriais : Voltados a ensinar qualquer coisa que considere interessante ser ensinada.
4 - Voce pode fazer videos no formato de Divulgação : Video mostrando os principais aspectos do server e indicando
como uma opção de jogo.
Enfim, seja criativo.

]]

		--Mensagem que aparecerá ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end