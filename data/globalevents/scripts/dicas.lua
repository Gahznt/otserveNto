local messages = {

"( Loot / Dinheiro ) Já aprendeu a utilizar nosso sistema !autoloot ? Não perca tempo, a melhor forma de se fazer dinheiro é vendendo Item's Loot para NPC's Compradores.",

"( Upar ) Em nosso servidor você pode upar eu personagem com inúmeras formas diferentes : Hunts, Missões, Batalhas Diárias, Kekkeis Generators, Participações PVP e outras.",

"( Skills ) Treine seu personagem, o Ninjutsu é responsável pelo dano de seus Jutsus, Taijutsu é responsável pela velocidade do seu ataque físico, Agilidade e Destreza são responsáveis pelo Dano do ataque físico.",

"( Set ) É muito importante que você esteja utilizando o Set equivalente ao seu Level, Set Nivel 1 = Level 10, Set Nivel 2 = Level 20. Busque sempre utilizar o Set do Seu level para evitar apuros em situações PVE e PVP.",

"( Discord ) Tire dúvidas, Dê sugestões, Aprenda mais sobre o jogo e Faça novos amigos ! Acesse : https://discord.gg/tN2MWVr ",
} 


local i = 0

function onThink(interval, lastExecution)

local message = messages[(i % #messages) + 1]

for _, pid in ipairs(getPlayersOnline()) do

doPlayerSendTextMessage(pid, 20, "ANUNCIO: ".. message ..". ") -- Exp , Dinheiro , Quest

i = i + 1

end

return TRUE

end