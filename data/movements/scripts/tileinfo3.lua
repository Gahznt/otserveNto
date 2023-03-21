local storages = {13003} -- storages que serão verificadas

local message = [[

( Guia Nto Hard )

Conheça todos os NPC em nosso servidor !

1º Você pode comprar Items, Vender Items !
2º Você pode realizar missões e receber recompensas !
3º Você pode realizar trocas de items especiais !


]]

function onStepIn(cid, item, position, fromPosition)
for _, v in ipairs(storages) do
    if getPlayerStorageValue(cid, v)  <= 0 then
		doPlayerPopupFYI(cid, message)
		setPlayerStorageValue(cid, 13003, 1)
        return doTeleportThing(cid, fromPosition)
    end
end
end