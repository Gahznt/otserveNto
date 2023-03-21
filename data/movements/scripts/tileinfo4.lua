local storages = {13004} -- storages que serão verificadas

local message = [[

( Guia Nto Hard )

Conheça a Arena de Batalha !

1º Você pode convidar amigos ou inimigos para batalhar neste local !
2º Teste o dano de seu personagem sem correr risco de perder experiência ou items !



]]

function onStepIn(cid, item, position, fromPosition)
for _, v in ipairs(storages) do
    if getPlayerStorageValue(cid, v)  <= 0 then
		doPlayerPopupFYI(cid, message)
		setPlayerStorageValue(cid, 13004, 1)
        return doTeleportThing(cid, fromPosition)
    end
end
end