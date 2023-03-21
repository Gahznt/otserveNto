local transform = {

-- Naruto

[100] = {[1] = 876,  effect = 600},

-- Sasuke
[200] = {[1] = 876,  effect = 600},
-- Sakura
[300] = {[1] = 876,  effect = 600},
-- Lee
[400] = {[1] = 876,  effect = 600},
-- Neji
[100] = {[1] = 876,  effect = 600},
-- Tenten
[100] = {[1] = 876,  effect = 600},
-- Gaara
[100] = {[1] = 876,  effect = 600},
-- Kiba
[100] = {[1] = 876,  effect = 600},
-- Shikamaru
[100] = {[1] = 876,  effect = 600},
-- Chouji
[100] = {[1] = 876,  effect = 600},
-- Hashirama
[100] = {[1] = 876,  effect = 600},
-- Tobirama
[100] = {[1] = 876,  effect = 600},
-- Hiruzen
[100] = {[1] = 876,  effect = 600},
-- Minato
[100] = {[1] = 876,  effect = 600},
-- Tsunade
[100] = {[1] = 876,  effect = 600},
-- Kakashi
[100] = {[1] = 876,  effect = 600},
-- Madara
[100] = {[1] = 876,  effect = 600},

}


local level = 10 -- Limite para liberar uma transform nova


function onSay(cid, words, param, channel)


 if(param == '') then
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Transform] Informe o número da transformação Ex : !transform 2")
  return true
 end


if not transform[getPlayerVocation(cid)] then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não pode trocar de transform agora.")
return true
end


local t = string.explode(param, ",")


 if(t[2]) then
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Comando não identificado.")
  return true
 end


 if not (tonumber(t[1])) then
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Transform] Informe o número da transformação Ex : !transform 2")
  return true
 end


if tonumber(t[1]) > #transform[getPlayerVocation(cid)] or tonumber(t[1]) < 1  then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Erro] Essa transformação não existe.")
return true
end


if  then
doSetCreatureOutfit(cid, {lookType = transform[getPlayerVocation(cid)][tonumber(t[1])]}, -1)
doSendMagicEffect(getThingPos(cid), transform[getPlayerVocation(cid)].effect)
doPlayerSendTextMessage(cid, 25, "Parabéns, Você alterou sua transformação !")
doPlayerSay(cid, "Aaahhh !", TALKTYPE_ORANGE_1)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Aviso] Desculpe mas você precisa estar no level "..(tonumber(t[1]) * level).." para usar essa transformação.")
end


return true
end