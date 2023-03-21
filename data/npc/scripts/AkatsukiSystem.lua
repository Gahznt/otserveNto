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
local itemid = 2471 -- id do coração
local quantidade = 50 -- quantos hearts e preciso
local bonushp = 3000 -- quanto de bonus de life vai ganha
local experience = 1 -- Experience rates no caso 1x a experiencia do seu servidor.
local config = {
--[Vocation] = ( Nova Vocation, New Outfit )
[1] = { 200, 877}, -- Naruto
[2] = { 2200, 879},-- Sasuke
[3] = { 3200, 881},-- Sakura
[4] = { 4200, 889},-- Rock Lee
[5] = { 5200, 891},-- Neji
[6] = { 6200, 893},-- Tenten
[7] = { 7200, 905},-- Gaara
[8] = { 8200, 895},-- Kiba
[9] = { 9200, 937},-- Shikamaru
[10] = { 1020, 939},-- Chouji
[11] = { 1120, 919},-- Hashirama
[12] = { 1220, 917},-- Tobirama
[13] = { 1320, 1239},-- Hiruzen
[14] = { 1420, 887},-- Mianto
[15] = { 1520, 915},-- Tsunade
[16] = { 1620, 935},-- Kakashi
[17] = { 1720, 943},-- Madara

[18] = { 1820, 923},-- Hidan
[19] = { 1920, 943},-- Obito
[20] = { 2020, 1688},-- Killer Bee
[21] = { 2120, 927},-- Kisame 
[22] = { 2220, 931},-- Konan 
[23] = { 2320, 909},-- Temari

--[4] = { 100033, 883},-- Sai	
--[5] = { 100043, 885},-- Killer Bee
--[6] = { 100053, 887},-- Minato-
--[11] = { 1000103, 897},-- Shino
--[12] = { 1000113, 899},-- Hinata
--[14] = { 1000133, 939},-- Chouji
--[17] = { 1000163, 907},-- Kankuro
--[18] = { 1000173, 909},-- Temari
--[19] = { 1000183, 941},-- Jiraya
--[20] = { 1000193, 913},-- Orochimaru
--[21] = { 1000203, 915},-- Tsunade-
--[22] = { 1000213, 917},-- Tobirama
--[23] = { 1000223, 761},-- Hashirama
--[24] = { 1000233, 943},-- Madara
--[25] = { 1000243, 923},-- Hidan
--[26] = { 1000253, 925},-- Kakuzo
--[27] = { 1000263, 945},-- Deidara
--[28] = { 1000273, 927},-- Kisame
--[29] = { 1000283, 919},-- Itachi
--[30] = { 1000293, 931},-- Konan
--[31] = { 1000303, 1067},-- Kimimaru
--[32] = { 1000313, 1119},-- Shisui
--[33] = { 1000323, 1145},-- Raikage
--[34] = { 1000333, 935},-- Kakashi
--[35] = { 1000343, 901},-- Yamato
--[36] = { 1000353, 911},-- Kabuto
--[37] = { 1000363, 921},-- Obito
--[38] = { 1000373, 933},-- Nagato
--[39] = { 1000383, 1186},-- Tsuchikage FALTANDO
--[40] = { 1000393, 1168},-- Suigetsu
--[41] = { 1000403, 1239},-- Sarutobi
--[42] = { 1000413, 1227},-- Boruto
--[43] = { 1000433, X},
--[44] = { 1000433, 1314},-- Sasori
--[45] = { 1000443, X},
--[46] = { 1000453, 1214},-- MENMA
--[47] = { 1000463, X},
--[48] = { 1000473, X},
--[49] = { 1000483, X},
--[50] = { 1000493, X},

------------------------------ > QUEM ERA AKAT PODER ENTRAR AKAT

}
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
 return false
end
 
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
 
 
if msgcontains(msg, 'akatsuki') then
    if getPlayerVocation(cid) ~= config then
        if getPlayerStorageValue(cid, 89745) == -1 then
            if getPlayerLevel(cid) >= level then
                selfSay('Voce tem certeza que deseja se aliar a Akatsuki ? {sim}', cid)
                talkState[talkUser] = 1
            else
                selfSay('Você não possui level suficiente para realizar essa missão.', cid)
            end
        else
            selfSay('Você ja faz parte da Akatsuki.', cid)
        end
    else
        selfSay('Não preciso de você por enquanto.', cid)
    end
end
 
if talkState[talkUser] == 1 and msgcontains(msg, 'sim') then
    selfSay('Invada a BASE DA ANBU, mate os informantes e me traga '..quantidade..' Docs Secretos da Anbu.{sim}', cid)
    talkState[talkUser] = 2
end
 
if talkState[talkUser] == 2 and msgcontains(msg, 'sim') then
    if getPlayerItemCount(cid, 2471) >= 50 then
    local voc = config[getPlayerVocation(cid)]
        doPlayerSetVocation(cid, voc[1])
    local outfit = {lookType = voc[2]}
        doCreatureChangeOutfit(cid, outfit)
        setCreatureMaxHealth(cid, getCreatureMaxHealth(cid)+bonushp)
        doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
        doPlayerRemoveItem(cid, 2471, 50)
        setPlayerStorageValue(cid,89745,1)
		setPlayerStorageValue(cid,89211,1)
        doPlayerSetExperienceRate(cid, experience) 
        doPlayerPopupFYI(cid, "Parabéns, agora você faz parte da Akatsuki!")
        talkState[talkUser] = 0
    else
        selfSay('Vejo que voce não tem'..quantidade..' docs secretos da anbu. Vá atrás conquistá-los!', cid)
    end
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())