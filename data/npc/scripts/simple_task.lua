domodlib('task_func')
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser,msg, str,rst = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid, msg:lower(),"",""
	local task,daily, hours = getTaskMission(cid),getDailyTaskMission(cid), 24
	if isInArray({"task","tasks","missao","mission"}, msg) then
		if task_sys[task] then
			if getPlayerStorageValue(cid, task_sys[task].start) <= 0 then
				if getPlayerLevel(cid) >= task_sys[task].level then
					setPlayerStorageValue(cid, task_sys[task].start, 1)
					npcHandler:say("Você deverá derrotar o "..task_sys[task].name.." vence-lo apenas "..task_sys[task].count.." vez."..(#task_sys[task].items > 0 and "Deverá trazer "..getItemsFromList(task_sys[task].items).." para mim." or "").."" , cid)
				else
					npcHandler:say("Desculpe, mas você precisa do level "..task_sys[task].level.." para receber a missão do "..task_sys[task].name.."!", cid)
				end
			else
				npcHandler:say("Desculpe,  "..task_sys[task].name..". Você pode {entregar} caso tenha terminado.", cid)
			end
		else
			npcHandler:say("Desculpe, mas não tenho missões disponíveis para você.", cid)
		end
	elseif isInArray({"diaria","daili","daily","dayli","diario"}, msg) then
		if getPlayerStorageValue(cid, task_sys_storages[6]) - os.time() > 0 then
			npcHandler:say("Desculpe, você deve esperar até "..os.date("%d %B %Y %X ", getPlayerStorageValue(cid,task_sys_storages[6])).." para iniciar uma nova missão diaria.!", cid) return true
		elseif daily_task[daily] and getPlayerStorageValue(cid, task_sys_storages[5]) >= daily_task[daily].count then
			npcHandler:say("Desculpe, você deve {entregar} sua missão !", cid) return true
		end
		local r = doRandomDailyTask(cid)
		if r == 0 then
			npcHandler:say("Desculpe, mas você não tem level necessário para receber uma missão diaria.", cid) return true
		end
		setPlayerStorageValue(cid, task_sys_storages[4], r)
		setPlayerStorageValue(cid, task_sys_storages[6], os.time()+hours*3600)
		setPlayerStorageValue(cid, task_sys_storages[7], 1)
		setPlayerStorageValue(cid, task_sys_storages[5], 0)
       local dtask = daily_task[r]
		npcHandler:say("[Missão Diaria] Você deverá derrotar "..dtask.name.." vence-lo "..dtask.count.." vezes até" ..os.date("%d %B %Y %X ", getPlayerStorageValue(cid,task_sys_storages[6]))..". Boa Sorte !" , cid)
	elseif isInArray({"receber","reward","recompensa","report","reportar","entregar","entrega"}, msg) then
		local v, k = task_sys[task], daily_task[daily] 
		if v then -- original task
			if getPlayerStorageValue(cid, v.start) > 0 then
				if getPlayerStorageValue(cid,task_sys_storages[3]) >= v.count then
					if #v.items > 0 and not doRemoveItemsFromList(cid, v.items) then
						npcHandler:say("Desculpe, mas você precisa entregar também os items "..getItemsFromList(v.items), cid) return true
					end
			 if v.exp > 0 then doPlayerAddExp(cid, v.exp) str = str.."".. (str == "" and "" or ", ") .." "..v.exp.." de exp" end
		         if v.points > 0 then setPlayerStorageValue(cid, task_sys_storages[2], (getTaskPoints(cid)+v.points)) str = str.."".. (str == "" and "" or ", ") .." + "..v.points.."task points" end
		         if v.money > 0 then doPlayerAddMoney(cid, v.money) str = str.."".. (str == "" and "" or ", ") ..""..v.money.." gps" end
		         if table.maxn(v.reward) > 0 then GiveRewardsTask(cid, v.reward) str = str.."".. (str == "" and "" or ", ") ..""..getItemsFromList(v.reward) end
					npcHandler:say("Receba sua Recompensa: "..(str == "" and "nenhuma" or ""..str.."").." por ter realizado a missão do "..v.name, cid)
					setPlayerStorageValue(cid, task_sys_storages[3], 0)
					setPlayerStorageValue(cid, task_sys_storages[1], (task+1))
				else
					npcHandler:say("Desculpe, mas você ainda não terminou a missão do "..v.name..". Preciso que derrote mais "..(getPlayerStorageValue(cid, task_sys_storages[3]) < 0 and v.count or -(getPlayerStorageValue(cid,task_sys_storages[3])-v.count)).." Destes alvos!", cid)
				end
			end
		end
		
		if k then -- daily task
			if getPlayerStorageValue(cid, task_sys_storages[7]) > 0 then
				if getPlayerStorageValue(cid, task_sys_storages[5]) >= k.count then
				if k.exp > 0 then doPlayerAddExp(cid, v.exp) rst = rst.."".. (rst == "" and "" or ", ") .." "..k.exp.." de exp" end
		         if k.points > 0 then setPlayerStorageValue(cid, task_sys_storages[2], (getTaskPoints(cid)+k.points)) rst = rst.."".. (rst == "" and "" or ", ") .." + "..k.points.."task points" end
		         if k.money > 0 then doPlayerAddMoney(cid, k.money) rst = rst.."".. (rst == "" and "" or ", ") ..""..k.money.." gps" end
		         if table.maxn(k.reward) > 0 then GiveRewardsTask(cid, k.reward) rst = rst.."".. (rst == "" and "" or ", ") ..""..getItemsFromList(k.reward) end
					npcHandler:say("Receba sua Recompensa: "..(rst == "" and "nenhuma" or ""..rst.."").." por realizar a missão do "..k.name, cid)
					setPlayerStorageValue(cid, task_sys_storages[4], 0)
					setPlayerStorageValue(cid, task_sys_storages[5], 0)
					setPlayerStorageValue(cid, task_sys_storages[7], 0)
					else
					npcHandler:say("Desculpe, mas você ainda não terminou a missão do "..k.name..". Preciso que derrote mais "..(getPlayerStorageValue(cid, task_sys_storages[5]) < 0 and k.count or -(getPlayerStorageValue(cid,task_sys_storages[5])-k.count)).." Destes alvos!", cid)
				end
			end
		end
		
	elseif msg == "no" then 
		selfSay("Ok, até mais.", cid) 
		talkState[talkUser] = 0 
		npcHandler:releaseFocus(cid) 
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())