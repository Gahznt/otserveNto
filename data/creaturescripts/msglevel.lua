local pos = {x = 1026, y = 1087, z = 6}
local storage = 66620
local storage_a = 66621
local storage_b = 66622
local storage_c = 66623

local message1  = [[

Parabéns ( Level 5 ) !

Agora você deverá iniciar com sua primeira
missão com o NPC Hokage Naruto.

 
]]

local message2  = [[

Parabéns ( Level 10 ) !

Você liberou novos Jutsus de Ataque !
Diga !Jutsu para verificar.

]]

local message3  = [[

Parabéns ( Level 60 ) !

Agora você tem level suficiente para
se aliar a ORG Anbu ou Akatsuki !

Bonus : + 10 % Dano em Ninjutsu Extra
Bonus : + 10.000 Pontos de Vida Extra

]]

local message4  = [[

Parabéns ( Level 80 ) !

Agora você tem level suficiente para
se aliar a ORG Otsutsuki !

Bonus : + 10 % Cura Extra
Bonus : + 15.000 Pontos de Vida Extra

]]


function onAdvance(cid, oldLevel, newLevel)

	if getPlayerLevel(cid) == 5 and  getPlayerStorageValue(cid, storage) < 1 then
	doPlayerPopupFYI(cid, message1)
	setPlayerStorageValue(cid, storage, 1)
	doTeleportThing(cid, pos)	
    elseif getPlayerLevel(cid) == 10 and  getPlayerStorageValue(cid, storage_a) < 1 then
	setPlayerStorageValue(cid, storage_a, 1)
    doPlayerPopupFYI(cid, message2)
	elseif getPlayerLevel(cid) == 60 and  getPlayerStorageValue(cid, storage_b) < 1 then
	setPlayerStorageValue(cid, storage_b, 1)
    doPlayerPopupFYI(cid, message3)
	elseif getPlayerLevel(cid) == 80 and  getPlayerStorageValue(cid, storage_c) < 1 then
	setPlayerStorageValue(cid, storage_c, 1)
    doPlayerPopupFYI(cid, message4)
	end

return TRUE

end