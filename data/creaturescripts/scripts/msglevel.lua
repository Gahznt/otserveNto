domodlib('task_func')
local pos = {x = 1026, y = 1087, z = 6}
local storage = 66620
local storage_a = 66621
local storage_b = 66622
local storage_c = 66623
local storage_d = 66624
local storage_e = 66625
local storage_f = 66626
local stor_g = 66627
local stor_c = 66628
local stor_j = 66629
local stor_k = 66630

local message1  = [[

Parabéns ( Level 5 )     

Agora você deverá iniciar  sua primeira
missão com o NPC Hokage Naruto.

Você liberou um novo JUTSU de ATAQUE !
Diga !Jutsu para verificar.

 
]]

local message2  = [[

Parabéns ( Level 10 )

Você liberou um novo Jutsu de Ataque 
Diga !Jutsu para verificar.

]]

local message5  = [[

Parabéns ( Level 20 )

Você liberou um novo Jutsu de Ataque 
Diga !Jutsu para verificar.

]]

local message6  = [[

Parabéns ( Level 25 )

Você liberou um novo Jutsu de Cura 	
Diga !Jutsu para verificar.

]]

local message8  = [[

Parabéns ( Level 30 )

-> ATENÇÃO <-
 
Apartir de agora a modalidade PVP está ativada, você pode ser atacado ou pode
atacar qualquer outro jogador.

Utilize o Tsunade Amulet para prevenir o Drop em casos de morte, também pode
optar por utilizar a Bless da Tsunade que além de prevenir o Drop também reduz
as perdas de Skill e Experiência.

]]

local message3  = [[

Parabéns ( Level 60 )
Agora você tem level suficiente para
se aliar a ORG Anbu ou Akatsuki!

Bonus : + 10 % Extra Damage com Ninjutsu 
Bonus : + 3.000 Pontos de Vida Extra

]]

local message4  = [[

Parabéns ( Level 80 )

Agora você tem level suficiente para
se aliar a ORG Otsutsuki !

Bonus : + 10 % Cura Extra
Bonus : + 6.000 Pontos de Vida Extra

]]

local message7  = [[

Parabéns ( Level 110 )

Agora você tem level suficiente para
se aliar a ORG Hokage !

Bonus : + 10.000 Pontos de Vida Extra

]]

local message_g  = [[

Parabéns ( Genin )

Você atingiu a quantidade de pontos de missão 
suficientes para se graduar como Genin pegue o 
certificado em cima da mesa do naruto e entregue 
ao Iruka para receber sua recompensa !

]]

local message_c  = [[

Parabéns ( Chunin )

Você atingiu a quantidade de pontos de missão 
suficientes para se graduar como Chunin pegue o 
certificado em cima da mesa do naruto e entregue 
ao Iruka para receber sua recompensa !

]]

local message_j  = [[

Parabéns ( Jounin )

Você atingiu a quantidade de pontos de missão 
suficientes para se graduar como Jounin pegue o 
certificado em cima da mesa do naruto e entregue 
ao Iruka para receber sua recompensa !

]]

local message_k  = [[

Parabéns ( Kage )

Você atingiu a quantidade de pontos de missão 
suficientes para se graduar como Kage pegue o 
certificado em cima da mesa do naruto e entregue 
ao Iruka para receber sua recompensa !

]]

function onAdvance(cid, oldLevel, newLevel)

	if getPlayerLevel(cid) == 5 and  getPlayerStorageValue(cid, storage) < 1 then
	doPlayerPopupFYI(cid, message1)
	setPlayerStorageValue(cid, storage, 1)
    elseif getPlayerLevel(cid) == 10 and  getPlayerStorageValue(cid, storage_a) < 1 then
	setPlayerStorageValue(cid, storage_a, 1)
    doPlayerPopupFYI(cid, message2)
	elseif getPlayerLevel(cid) == 60 and  getPlayerStorageValue(cid, storage_b) < 1 then
	setPlayerStorageValue(cid, storage_b, 1)
    doPlayerPopupFYI(cid, message3)
	elseif getPlayerLevel(cid) == 80 and  getPlayerStorageValue(cid, storage_c) < 1 then
	setPlayerStorageValue(cid, storage_c, 1)
    doPlayerPopupFYI(cid, message4)
	elseif getPlayerLevel(cid) == 20 and  getPlayerStorageValue(cid, storage_d) < 1 then
	setPlayerStorageValue(cid, storage_d, 1)
    doPlayerPopupFYI(cid, message5)
	elseif getPlayerLevel(cid) == 25 and  getPlayerStorageValue(cid, storage_e) < 1 then
	setPlayerStorageValue(cid, storage_e, 1)
    doPlayerPopupFYI(cid, message6)
	elseif getPlayerLevel(cid) == 110 and  getPlayerStorageValue(cid, storage_f) < 1 then
	setPlayerStorageValue(cid, storage_f, 1)
    doPlayerPopupFYI(cid, message7)	
	elseif getTaskPoints(cid) >= 40 and getPlayerStorageValue(cid, stor_g) < 1 then
	setPlayerStorageValue(cid, stor_g, 1)
    doPlayerPopupFYI(cid, message_g)
	elseif getTaskPoints(cid) >= 60 and getPlayerStorageValue(cid, stor_c) < 1 then
	setPlayerStorageValue(cid, stor_c, 1)
    doPlayerPopupFYI(cid, message_c)
	elseif getTaskPoints(cid) >= 80 and getPlayerStorageValue(cid, stor_j) < 1 then
	setPlayerStorageValue(cid, stor_j, 1)
    doPlayerPopupFYI(cid, message_j)
	elseif getTaskPoints(cid) >= 100 and getPlayerStorageValue(cid, stor_k) < 1 then
	setPlayerStorageValue(cid, stor_k, 1)
    doPlayerPopupFYI(cid, message_k)
	end
return TRUE

end