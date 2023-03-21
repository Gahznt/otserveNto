--- Criado por Absolute/Bodak ---
function onSay(cid, words, param)
file = io.open('data/talkactions/scripts/ajuda.txt','r')
notice = file:read(-1)
doShowTextDialog(cid, 7528, notice)
file:close()
end