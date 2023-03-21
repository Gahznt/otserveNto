local castlearea = {{x = 488, y = 90, z = 3}, {x = 616, y = 294, z = 10}}  --- canto superior esquerdo, inferior direito
local newpos = {x=1043,y=1048,z=5} -- posição para onde serão teleportados


local eventdates = {{"Wednesday", "21:00"}, {"Sunday", "16:00"}} -- Dias e horários que ocorrem o evento.
local createpos = {x = 1037, y = 1054, z = 7} -- posição que será criado o teleport
local topos = {x = 539, y = 262, z = 6} -- posição que o teleport vai levar
local duration = 3600 -- tempo em segundos que o teleport vai durar
local paredeid = 8538 -- id da parede
local wallz = 1544 -- id da parede
local paredepos = {x = 538, y = 175, z = 5} --- posicao da parede
local paredeposb = {x = 546, y = 175, z = 5} --- posicao da parede
local walla = {x = 541, y = 180, z = 6}
local wallb = {x = 542, y = 180, z = 6}

function onThink(interval, lastExecution, thinkInterval)
	for index, dates in ipairs(eventdates) do
		if table.find(dates, os.date("%A")) then
			if table.find(dates, os.date("%H:%M")) then
				doCreateTeleport(1387, topos, createpos)
				doCreateItem(wallz, 1, walla)
				doCreateItem(wallz, 1, wallb)
				doBroadcastMessage("[ Castelo Guild Dominante ] Aberto por ( Exatos 60 Minutos ), que comece a War !.", 18)
				local parede = getTileItemById(paredepos, paredeid)
				if parede.uid > 0 then
					doRemoveItem(parede.uid)
				end
				local paredeb = getTileItemById(paredeposb, paredeid)
				if paredeb.uid > 0 then
					doRemoveItem(paredeb.uid)
				end
				
				addEvent(function()
					local wall1 = getTileItemById(walla, wallz)
					local wall2 = getTileItemById(wallb, wallz)
					local item = getTileItemById(createpos, 1387)
					if item.uid > 0 then
						doRemoveItem(item.uid)
						doRemoveItem(wall1.uid)
						doRemoveItem(wall2.uid)
						doBroadcastMessage("[ Castelo Guild Dominante ] Fechado, parabens a Atual Guild Dominante !", 18)
						doCreateItem(paredeid, 1, paredepos)
						doCreateItem(paredeid, 1, paredeposb)
					end
					local playersOnCastle = getAllPlayersInArea(castlearea[1], castlearea[2])
							if #playersOnCastle > 0 then
								for i = 1, #playersOnCastle do
								doTeleportThing(playersOnCastle[i], newpos)
								end
								doSendMagicEffect(newpos, CONST_ME_TELEPORT)
					end
				end, duration * 1000)
			end
		end
	end
return true
end

function getAllPlayersInArea(fromPosition, toPosition)
    local players = {}
    for _, pid in ipairs(getPlayersOnline()) do
        local f = {x = fromPosition.x, y = fromPosition.y, z = fromPosition.z}
        local t = {x = toPosition.x, y = toPosition.y, z = toPosition.z}
        local min = (fromPosition.z > toPosition.z and toPosition.z or fromPosition.z)
        for index = 0, math.abs(toPosition.z - fromPosition.z) do
            f.z = min + index
            t.z = min + index
            if isInRange(getPlayerPosition(pid), f, t) then
                table.insert(players, pid)
            end
        end    
    end
    return players
end 




