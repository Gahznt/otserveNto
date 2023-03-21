-- Script Akatsuki System Advance 1.0 --
-- By RigBy --
-- Xtibia.com --
 
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
 
local level = 110 -- Level preciso pra entra para akatsuki
local itemv = 1
local bonushp = 10000 -- quanto de bonus de life vai ganha
local experience = 1 -- Experience rates no caso 1x a experiencia do seu servidor.
local config = {
--[Vocation] = ( Nova Vocation, New Outfit )
[300] = { 400, 1221}, -- Naruto
[2300] = { 2400, 1434}, -- Sasuke
[3300] = { 3400, 1434}, -- Sakura
[4300] = { 4400, 1434}, -- Rock Lee
[5300] = { 5400, 1434}, -- Neji
[6300] = { 6400, 1294}, -- Tenten
[7300] = { 7400, 1461}, -- Gaara
[8300] = { 8400, 1434}, -- Kiba
[9300] = { 9400, 1434}, -- Shikamaru
[1030] = { 1040, 1434}, -- Chouji
[1130] = { 1140, 1434}, -- Hashi
[1230] = { 1240, 1434}, -- Tobi
[1330] = { 1340, 1434}, -- Hiru
[1430] = { 1440, 1434}, -- Min
[1530] = { 1440, 1153}, -- Tsuna
[1630] = { 1640, 1497}, -- Kakashi
[1730] = { 1740, 1434}, -- Madara

[1830] = { 1840, 1434}, -- Madara
[1930] = { 1940, 1434}, -- Madara
[2030] = { 2040, 1434}, -- Madara
[2130] = { 2140, 1434}, -- Madara
[2230] = { 2240, 1434}, -- Madara
[2330] = { 2340, 1434}, -- Madara

--[100034] = { 100035, 1434}, -- Sai
--[100044] = { 100045, 1430}, -- Killer Bee
--[100054] = { 100055, 1434}, -- Minato
--[1000104] = { 1000105, 1434}, -- Shino
--[1000114] = { 1000115, 1434}, -- Hinata
--[1000134] = { 1000135, 1434}, -- Chouji
--[1000164] = { 1000165, 1433}, -- Kankuro
--[1000174] = { 1000175, 1433}, -- Temari
--[1000184] = { 1000185, 1434}, -- Jiraya
--[1000194] = { 1000195, 1434}, -- Orochimaru
--[1000204] = { 1000205, 1434}, -- Tsunade
--[1000214] = { 1000215, 1434}, -- Tobirama
--[1000224] = { 1000225, 1434}, -- Hashirama
--[1000234] = { 1000235, 1434}, -- Madara
--[1000244] = { 1000245, 1434}, -- Hidan
--[1000254] = { 1000255, 1434}, -- Kakuzo
--[1000264] = { 1000265, 1432}, -- Deidara
--[1000274] = { 1000275, 1433}, -- Kisame
--[1000284] = { 1000285, 1434}, -- Itachi
--[1000294] = { 1000295, 1433}, -- Konan
--[1000304] = { 1000305, 1434}, -- Kimimaru
--[1000314] = { 1000315, 1434}, -- Shisui
--[1000324] = { 1000325, 1430}, -- Raikage
--[1000334] = { 1000335, 1434}, -- Kakashi
--[1000344] = { 1000345, 1434}, -- Yamato
--[1000354] = { 1000355, 1434}, -- Kabuto
--[1000364] = { 1000365, 1434}, -- Obito
--[1000374] = { 1000375, 1434}, -- Nagato
--[1000384] = { 1000385, 1432}, -- Tsuchikage FALTANDO
--[1000394] = { 1000395, 1433}, -- Suigetsu
--[1000404] = { 1000405, 1434}, -- Sarutobi
--[1000414] = { 1000415, X}, -- Boruto
--[100424] = { 100425, X}, -- Anbu
--[1000434] = { 1000435, 1433}, -- Sasori
--[100444] = { 100445, X}, -- Danzo
--[1000454] = { 1000455, 1434}, -- Menma
--[100464] = { 100465, X}, -- Mitsuki
--[100474] = { 100475, X}, -- Indra

------------------------------ > QUEM ERA AKAT PODER ENTRAR AKAT

}
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
 return false
end
 
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
 
 
if msgcontains(msg, 'hokage') then
    if getPlayerVocation(cid) ~= config then
        if getPlayerStorageValue(cid, 82717) == -1 then
            if getPlayerLevel(cid) >= level then
                selfSay('Você deseja se tornar Hokage ? {sim}', cid)
                talkState[talkUser] = 1
            else
                selfSay('Você não possui level suficiente para realizar essa missão.', cid)
            end
        else
            selfSay('Você já é um Hokage.', cid)
        end
    else
        selfSay('Não preciso de você por enquanto.', cid)
    end
end
 
if talkState[talkUser] == 1 and msgcontains(msg, 'sim') then
    selfSay('Calma ! Antes você precisará da permissão de cada um dos Hokages e 100x Crystal of Victory Essence ! {pronto}', cid)
    talkState[talkUser] = 2
end
 
if talkState[talkUser] == 2 and msgcontains(msg, 'pronto') then
    if getPlayerStorageValue(cid, 83357) >= 5 then
		if(getPlayerItemCount(cid, 11329) >= 100) then
			local voc = config[getPlayerVocation(cid)]
			doPlayerSetVocation(cid, voc[1])
			local outfit = {lookType = voc[2]}
			doCreatureChangeOutfit(cid, outfit)
			setCreatureMaxHealth(cid, getCreatureMaxHealth(cid)+bonushp)
			doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
			setPlayerStorageValue(cid,82717,1)
			doPlayerRemoveItem(cid, 11329, 100)
			setPlayerStorageValue(cid,89455,1)
			doPlayerSetExperienceRate(cid, experience) 
			doPlayerPopupFYI(cid, "Parabéns, você se tornou Hokage.")
			talkState[talkUser] = 0
		else
        selfSay('Vejo que você não tem 100 Victory Essence.', cid)
		end
    else
        selfSay('Vejo que não conseguiu a permissão de todos os hokages.', cid)
    end
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())