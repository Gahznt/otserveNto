local storages = {13001} -- storages que serão verificadas

local message = [[

( Guia Nto Hard )

Você está pronto para iniciar uma nova jornada ? !

1º Escreva !jutsu para verificar seus jutsus disponíveis.
2º Procure por criaturas no subsolo de Konoha para adquirir experiência.
3º Após o level 5 não perca tempo, começe já suas missões com a NPC Naruto.
4º Utilize os nossos canais de comunicação : Conversa, Trocas e de Ajuda !

]]

function onStepIn(cid, item, position, fromPosition)
for _, v in ipairs(storages) do
    if getPlayerStorageValue(cid, v)  <= 0  then
		doPlayerPopupFYI(cid, message)
		setPlayerStorageValue(cid, 13001, 1)
        return doTeleportThing(cid, fromPosition)
    end
end
end