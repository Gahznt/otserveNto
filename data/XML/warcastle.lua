local eventdates = {{"Wednesday", "18:55"}, {"Sunday", "14:55"}} -- Dias e horários que ocorrem o evento.
local createpos = {x = 1021, y = 1024, z = 7} -- posição que será criado o teleport
local topos = {x = 805, y = 945, z = 7} -- posição que o teleport vai levar
local duration = 3600 -- tempo em segundos que o teleport vai durar
local paredeid = 9118 -- id da parede
local paredepos = {x = 841, y = 890, z = 6} --- posicao da parede

function onThink(interval, lastExecution, thinkInterval)
	for index, dates in ipairs(eventdates) do
		if table.find(dates, os.date("%A")) then
			if table.find(dates, os.date("%H:%M")) then
				doCreateTeleport(1387, topos, createpos)
				doBroadcastMessage("CASTELO ABERTO ! Comece a guerra ! !.", 18)
				local parede = getTileItemById(paredepos, paredeid)
				if parede.uid > 0 then
					doRemoveItem(parede.uid)
				end
				addEvent(function()
					local item = getTileItemById(createpos, 1387)
					if item.uid > 0 then
						doRemoveItem(item.uid)
						doBroadcastMessage("Teleport de acesso ao caslo FECHADO ! Parabens a guild dominante , trono trancado.", 18)
						doCreateItem(paredeid, 1, paredepos)
					end
				end, duration * 1000)
			end
		end
	end
return true
end





