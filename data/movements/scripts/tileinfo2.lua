local storages = {13002} -- storages que serão verificadas

local message = [[

( Guia Nto Hard )

Desça no subsolo de Konoha e procure por criaturas para batalhar !

1º Utilize Jutsus para Curar ( Regeneration ) e Atacar ( Throw Kunai ).
2º Utilize a palavra ( skip ) para subir e sair do calabouço !

]]

function onStepIn(cid, item, position, fromPosition)
for _, v in ipairs(storages) do
    if getPlayerStorageValue(cid, v)  <= 0 then
		doPlayerPopupFYI(cid, message)
		setPlayerStorageValue(cid, 13002, 1)
        return doTeleportThing(cid, fromPosition)
    end
end
end