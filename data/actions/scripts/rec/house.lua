local message = [[
[ ATENCAO ] Todas as houses passarão
por um processo de manutenção em busca
de solução para problemas encontrados.
Em breve, todas as houses serão resetadas,
todas estarão disponíveis para serem compradas
novamente. 
]]

function onUse(cid, item, fromPos, itemEx, toPos)
	doPlayerPopupFYI(cid, message)
    return true
end

