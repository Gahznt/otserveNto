local bless = {1, 2, 3, 4, 5}
local cost = 2000
function onSay(cid, words, param)
for i = 1, table.maxn(bless) do
if(getPlayerBlessing(cid, bless[i])) then
doPlayerSendCancel(cid, "Voce ja possui a bless do Hokage Sarutobi.")
return TRUE
end
end
 
if(doPlayerRemoveMoney(cid, cost) == TRUE) then
for i = 1, table.maxn(bless) do
doPlayerAddBlessing(cid, bless[i])
end
doCreatureSay(cid, "Agora voce esta abencoado pelo Hokage Sarutobi" ,19)
doSendMagicEffect(getPlayerPosition(cid), 5)
else
doPlayerSendCancel(cid, "Para comprar Bless Voce precisa de 20 Gold, Caso nao tenha dinheiro pra bless use !jam por 10 Dollars.")
end
return TRUE
end 