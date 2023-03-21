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
 
local level = 60 -- Level preciso pra entra para akatsuki
local itemid = 2472 -- id do coração
local quantidade = 50 -- quantos hearts e preciso
local bonushp = 3000 -- quanto de bonus de life vai ganha
local experience = 1 -- Experience rates no caso 1x a experiencia do seu servidor.
local config = {
--[Vocation] = ( Nova Vocation, New Outfit )
[1] = { 100, 876}, -- Naruto
[2] = { 2100, 878},-- Sasuke
[3] = { 3100, 880},-- Sakura
[4] = { 4100, 888},-- Rock Lee
[5] = { 5100, 890},-- Neji
[6] = { 6100, 892},-- Tenten
[7] = { 7100, 904},-- Gaara
[8] = { 8100, 894},-- Kiba
[9] = { 9100, 936},-- Shikamaru
[10] = { 1010, 938},-- Chouji
[11] = { 1110, 918},-- Hashirama
[12] = { 1210, 916},-- Tobirama
[13] = { 1310, 1238},-- Hiruzen
[14] = { 1410, 886},-- Mianto
[15] = { 1510, 914},-- Tsunade
[16] = { 1610, 938},-- Kakashi
[17] = { 1710, 942},-- Madara

[18] = { 1810, 922},-- Madara
[19] = { 1910, 920},-- Madara
[20] = { 2010, 884},-- Madara
[21] = { 2110, 926},-- Madara
[22] = { 2210, 930},-- Madara
[23] = { 2310, 908},-- Madara


--[4] = { 100032, 882},-- Sai
--[5] = { 100042, 884},-- Killer Bee
--[6] = { 100052, 886},-- Minato
--[11] = { 1000102, 896},-- Shino
--[12] = { 1000112, 898},-- Hinata
--[14] = { 1000132, 938},-- Chouji
--[17] = { 1000162, 906},-- Kankuro
--[18] = { 1000172, 908},-- Temari
--[19] = { 1000182, 940},-- Jiraya
--[20] = { 1000192, 912},-- Orochimaru
--[21] = { 1000202, 914},-- Tsunade
--[22] = { 1000212, 916},-- Tobirama
--[23] = { 1000222, 760},-- Hashirama
--[24] = { 1000232, 942},-- Madara
--[25] = { 1000242, 922},-- Hidan
--[26] = { 1000252, 924},-- Kakuzo
--[27] = { 1000262, 944},-- Deidara
--[28] = { 1000272, 926},-- Kisame
--[29] = { 1000282, 918},-- Itachi
--[30] = { 1000292, 930},-- Konan
--[31] = { 1000302, 1066},-- Kimimaru
--[32] = { 1000312, 874},-- Shisui
--[33] = { 1000322, 1144},-- Raikage
--[34] = { 1000332, 934},-- Kakashi
--[35] = { 1000342, 900},-- Yamato
--[36] = { 1000352, 910}, -- Kabuto
--[37] = { 1000362, 920},-- Obito
--[38] = { 1000372, 932},-- Nagato
--[39] = { 1000382, 1187},-- Tsuchikage FALTANDO
--[40] = { 1000392, 1169},-- Suigetsu
--[41] = { 1000402, 1238},-- Sarutobi
--[42] = { 1000412, 1227},-- Boruto
--[43] = { 1000432, X},-- Anbu
--[44] = { 1000433, X},-- Sasori
--[45] = { 1000442, X},-- Danzo
--[46] = { 1000452, 1215}, -- MENMA
--[47] = { 1000462, X}, -- MITSUKI
--[48] = { 1000472, X}, -- INDRA
--[49] = { 1000482, X},
--[50] = { 1000492, X},

}
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
 return false
end
 
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
 
 
if msgcontains(msg, 'anbu') then
    if getPlayerVocation(cid) ~= config then
        if getPlayerStorageValue(cid, 89745) == -1 then
            if getPlayerLevel(cid) >= level then
                selfSay('Tem certeza de que quer se juntar a Anbu?.{sim}', cid)
                talkState[talkUser] = 1
            else
                selfSay('Você não possui level suficiente para realizar essa Missão.', cid)
            end
        else
            selfSay('Você ja faz parte da Anbu !', cid)
        end
    else
        selfSay('Não preciso de você por enquanto.', cid)
    end
end
 
if talkState[talkUser] == 1 and msgcontains(msg, 'sim') then
    selfSay('Para provar a sua lealdade, invada a BASE DA AKATSUKI, mate os informantes e me traga '..quantidade..' Docs Secretos da Akatsuki.{sim}', cid)
    talkState[talkUser] = 2
end
 
if talkState[talkUser] == 2 and msgcontains(msg, 'sim') then
    if getPlayerItemCount(cid, 2472) >= 50 then
    local voc = config[getPlayerVocation(cid)]
        doPlayerSetVocation(cid, voc[1])
    local outfit = {lookType = voc[2]}
        doCreatureChangeOutfit(cid, outfit)
        setCreatureMaxHealth(cid, getCreatureMaxHealth(cid)+bonushp)
        doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
        doPlayerRemoveItem(cid, 2472, 50)
        setPlayerStorageValue(cid,89745,1)
		setPlayerStorageValue(cid,89111,1)
        doPlayerSetExperienceRate(cid, experience) 
		doPlayerPopupFYI(cid, "Parabéns, agora você é um membro da Anbu !")
        talkState[talkUser] = 0
    else
        selfSay('Vejo que você não tem '..quantidade..' docs secretos da akatsuki. Vá atrás conquistá-los!', cid)
    end
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())