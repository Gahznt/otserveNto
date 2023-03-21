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
 
local level = 80 -- Level preciso pra entra para akatsuki
local itemid = 8933 -- id do coração
local quantidade = 1 -- quantos hearts e preciso
local bonushp = 6000 -- quanto de bonus de life vai ganha
local experience = 1 -- Experience rates no caso 1x a experiencia do seu servidor.
local config = {
--[Vocation] = ( Nova Vocation, New Outfit )
[100] = { 300, 1412}, -- Naruto
[200] = { 300, 1412}, -- 
[2100] = { 2300, 1415}, -- Sasuke
[2200] = { 2300, 1415}, -- 
[3100] = { 3300, 1397}, -- Sakura
[3200] = { 3300, 1397}, -- 
[4100] = { 4300, 1411}, -- Rock Lee
[4200] = { 4300, 1411}, -- 
[5100] = { 5300, 1413}, -- Neji
[5200] = { 5300, 1413}, -- 
[6100] = { 6300, 1402}, -- Tenten
[6200] = { 6300, 1402}, -- 
[7100] = { 7300, 1408}, -- Gaara
[7200] = { 7300, 1408}, -- 
[8100] = { 8300, 1410}, -- Kiba
[8200] = { 8300, 1410}, -- 
[9100] = { 9300, 1417}, -- Shikamaru
[9200] = { 9300, 1417}, -- 
[1010] = { 1030, 1407}, -- Chouji
[1020] = { 1030, 1407}, -- 
[1110] = { 1130, 1379}, -- Hashirama
[1120] = { 1130, 1379}, -- 
[1210] = { 1230, 1403}, -- Tobirama
[1220] = { 1230, 1403}, -- 
[1310] = { 1330, 1398}, -- Hirzen
[1320] = { 1330, 1398}, -- 
[1410] = { 1430, 1392}, -- Minato
[1420] = { 1430, 1392}, -- 
[1510] = { 1530, 1404}, -- Tsunade
[1520] = { 1530, 1404}, -- 
[1610] = { 1630, 1409}, -- Kakashi
[1620] = { 1630, 1409}, -- 
[1710] = { 1730, 1418}, -- Madara
[1720] = { 1730, 1418}, -- 

[1820] = { 1830, 1382}, -- Hidan
[1810] = { 1830, 1382}, -- Hidan
[1910] = { 1930, 1394}, -- Obito
[1920] = { 1930, 1394}, -- Obito
[2010] = { 2030, 1380}, -- Killer bee
[2020] = { 2030, 1380}, -- Killer bee
[2110] = { 2130, 1390}, -- Kisame
[2120] = { 2130, 1390}, -- Kisame
[2210] = { 2230, 1391}, -- Konan
[2220] = { 2230, 1391}, -- Konan
[2310] = { 2330, 1401}, -- Temari
[2320] = { 2330, 1401}, -- Temari

--[100032] = { 100034, 1414}, -- Sai
--[100033] = { 100034, 1414}, -- 
--[100042] = { 100044, 1380}, -- Killer Bee
--[100043] = { 100044, 1380}, -- 
--[100052] = { 100054, 1392}, -- Minato
--[100053] = { 100054, 1392}, -- 
--[1000102] = { 1000104, 1399}, -- Shino
--[1000103] = { 1000104, 1399}, -- 
--[1000112] = { 1000114, 1383}, -- Hinata
--[1000113] = { 1000114, 1383}, --
--[1000132] = { 1000134, 1407}, -- Chouji
--[1000133] = { 1000134, 1407}, -- 
--[1000162] = { 1000164, 1389}, -- Kankuro
--[1000163] = { 1000164, 1389}, -- 
--[1000172] = { 1000174, 1401}, -- Temari
--[1000173] = { 1000174, 1401}, -- 
--[1000182] = { 1000184, 1386}, -- Jiraya
--[1000183] = { 1000184, 1386}, -- 
--[1000192] = { 1000194, 1395}, -- Orochimaru
--[1000193] = { 1000194, 1395}, -- 
--[1000202] = { 1000204, 1404}, -- Tsunade
--[1000203] = { 1000204, 1404}, -- 
--[1000212] = { 1000214, 1403}, -- Tobirama
--[1000213] = { 1000214, 1403}, -- 
--[1000222] = { 1000224, 1379}, -- Hashirama
--[1000223] = { 1000224, 1379}, -- 
--[1000232] = { 1000234, 1418}, -- Madara
--[1000233] = { 1000234, 1418}, -- 
--[1000242] = { 1000244, 1382}, -- Hidan
--[1000243] = { 1000244, 1382}, -- 
--[1000252] = { 1000254, 1388}, -- Kakuzo
--[1000253] = { 1000254, 1388}, -- 
--[1000262] = { 1000264, 1381}, -- Deidara
--[1000263] = { 1000264, 1381}, -- 
--[1000272] = { 1000274, 1390}, -- Kisame
--[1000273] = { 1000274, 1390}, -- 
--[1000282] = { 1000284, 1385}, -- Itachi
--[1000283] = { 1000284, 1385}, -- 
--[1000292] = { 1000294, 1381}, -- Konan
--[1000293] = { 1000294, 1391}, -- 
--[1000302] = { 1000304, 1387}, -- Kimimaru
--[1000303] = { 1000304, 1387}, -- 
--[1000312] = { 1000314, 1405}, -- Shisui
--[1000313] = { 1000314, 1405}, -- 
--[1000322] = { 1000324, 1396}, -- Raikage--
--[1000323] = { 1000324, 1396}, -- 
--[1000332] = { 1000334, 1409}, -- Kakashi
--[1000333] = { 1000334, 1409}, -- 
--[1000342] = { 1000344, 1406}, -- Yamato
--[1000343] = { 1000344, 1406}, -- 
--[1000352] = { 1000354, 1387}, -- Kabuto
--[1000353] = { 1000354, 1387}, -- 
--[1000362] = { 1000364, 1394}, -- Obito
--[1000363] = { 1000364, 1394}, -- 
--[1000372] = { 1000374, 1393}, -- Nagato
--[1000373] = { 1000374, 1393}, -- 
--[1000382] = { 1000384, 1396}, -- Tsuchikage FALTANDO
--[1000383] = { 1000384, 1396}, -- 
--[1000392] = { 1000394, 1400}, -- Suigetsu
--[1000393] = { 1000394, 1400}, -- 
--[1000402] = { 1000404, 1398}, -- Sarutobi
--[1000403] = { 1000404, 1398}, -- 
--[1000412] = { 1000414, X}, -- Boruto
--[100413] = { 100414, X}, -- 
--[100422] = { 100424, X}, -- Anbu
--[100423] = { 100424, X}, -- 
--[1000432] = { 1000434, 1393}, -- Sasori
--[1000433] = { 1000434, 1393}, -- 
--[100442] = { 100444, X}, -- Danzo
--[100443] = { 100444, X}, -- 
--[1000452] = { 1000454, 1415}, -- Menma
--[1000453] = { 1000454, 1415}, -- 
--[100462] = { 100464, X}, -- Mitsuki
--[100463] = { 100464, X}, -- 
--[100472] = { 100474, X}, -- Indra
--[100473] = { 100474, X}, -- 

------------------------------ > QUEM ERA AKAT PODER ENTRAR AKAT

}
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
 return false
end
 
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
 
 
if msgcontains(msg, 'otsutsuki') then
    if getPlayerVocation(cid) ~= config then
        if getPlayerStorageValue(cid, 82746) == -1 then
            if getPlayerLevel(cid) >= level then
                selfSay('Você deseja se tornar membro do clã Otsutsuki ? {sim}', cid)
                talkState[talkUser] = 1
            else
                selfSay('Você não possui level suficiente para realizar essa missão.', cid)
            end
        else
            selfSay('Você ja faz parte do nosso clã.', cid)
        end
    else
        selfSay('Não preciso de você por enquanto.', cid)
    end
end
 
if talkState[talkUser] == 1 and msgcontains(msg, 'sim') then
    selfSay('Certo, prove-me que é capaz e conquiste suas esferas da verdade. Volte apenas quando tiver as esferas em mãos! {esferas}', cid)
    talkState[talkUser] = 2
end
 
if talkState[talkUser] == 2 and msgcontains(msg, 'esferas') then
    if getPlayerItemCount(cid, 8933) >= 1 then
    local voc = config[getPlayerVocation(cid)]
        doPlayerSetVocation(cid, voc[1])
    local outfit = {lookType = voc[2]}
        doCreatureChangeOutfit(cid, outfit)
        setCreatureMaxHealth(cid, getCreatureMaxHealth(cid)+bonushp)
        doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
        doPlayerRemoveItem(cid, 8933, 1)
        setPlayerStorageValue(cid,82746,1)
		setPlayerStorageValue(cid,89311,1)
        doPlayerSetExperienceRate(cid, experience) 
        doPlayerPopupFYI(cid, "Parabéns, agora você faz parte do clã Otsutsuki.")
        talkState[talkUser] = 0
    else
        selfSay('Vejo que voce não tem as esferas da verdade. Vá atrás conquistá-las!', cid)
    end
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())