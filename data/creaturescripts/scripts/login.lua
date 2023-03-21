local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

function onLogin(cid)
	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end

	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		else
			str = str .. " Please choose your outfit."
			doPlayerSendOutfitWindow(cid)
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, it appears that your character has been locked for name violating rules, what new name would you like to have?", TALKTYPE_PRIVATE_NP, true, cid)
	elseif(accountManager == MANAGER_ACCOUNT) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to manage your account. If you would like to start over, type {cancel} anywhere.", TALKTYPE_PRIVATE_NP, true, cid)
	else
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to create an account or {recover} to recover an account.", TALKTYPE_PRIVATE_NP, true, cid)
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end

	registerCreatureEvent(cid, "Idle")
	registerCreatureEvent(cid, "Mail")

	registerCreatureEvent(cid, "ReportBug")
	if(config.useFragHandler) then
		registerCreatureEvent(cid, "SkullCheck")
	end

	registerCreatureEvent(cid, "GuildEvents")
	registerCreatureEvent(cid, "AdvanceSave")
	registerCreatureEvent(cid, "recordIp")
	registerCreatureEvent(cid, "partyAndGuildProtection")
	registerCreatureEvent(cid, "PushPlayerThere")
	registerCreatureEvent(cid, "savePlayer")
	registerCreatureEvent(cid, "savePlayer_L")
	
	-- News
	registerCreatureEvent(cid, "advancedMSG")
	registerCreatureEvent(cid, "critical")
	registerCreatureEvent(cid, "Inicio")
	registerCreatureEvent(cid, "apt")
	registerCreatureEvent(cid, "bpt")
	registerCreatureEvent(cid, "cpt")
	registerCreatureEvent(cid, "dpt")
	registerCreatureEvent(cid, "FragReward")
	registerCreatureEvent(cid, "PlayerAntKillSummon")
	registerCreatureEvent(cid, "SummonAntKillPlayer")
	--Boss
	registerCreatureEvent(cid, "IndraKill")
	registerCreatureEvent(cid, "AshuraKill")
	registerCreatureEvent(cid, "MizukiKill")
	registerCreatureEvent(cid, "ZabuzaKill")
	registerCreatureEvent(cid, "JiroboKill")
	registerCreatureEvent(cid, "OrochimaruKill")
	registerCreatureEvent(cid, "KimimaruKill")
	registerCreatureEvent(cid, "KisameKill")
	registerCreatureEvent(cid, "DeidaraKill")
	registerCreatureEvent(cid, "HidanKill")
	registerCreatureEvent(cid, "KakuzoKill")
	registerCreatureEvent(cid, "KabutoKill")
	registerCreatureEvent(cid, "SasoriKill")
	registerCreatureEvent(cid, "TobiKill")
	registerCreatureEvent(cid, "NagatoKill")
	registerCreatureEvent(cid, "KonanKill")
	registerCreatureEvent(cid, "DanzouKill")
	registerCreatureEvent(cid, "ObitoKill")
	registerCreatureEvent(cid, "ItachiKill")
	registerCreatureEvent(cid, "MadaraKill")
	registerCreatureEvent(cid, "KaguyaKill")
	registerCreatureEvent(cid, "HagoromoKill")
	registerCreatureEvent(cid, "corpse")
	--Storage
	registerCreatureEvent(cid, "firstmessage")
	registerCreatureEvent(cid, "StorageKilla")
	registerCreatureEvent(cid, "teleportmonster")
	registerCreatureEvent(cid, "HeartDrop")
	registerCreatureEvent(cid, "HatDrop")
	registerCreatureEvent(cid, "autoBless")
	registerCreatureEvent(cid, "targetCreature")	
	registerCreatureEvent(cid, "invencible")
	registerCreatureEvent(cid, "kaiten")
	registerCreatureEvent(cid, "sunadefense")
	if getPlayerStorageValue(cid, 3433301) ~= 0 then
        setPlayerStorageValue(cid, 3433301, 0) 
	end
	if getPlayerStorageValue(cid, 3424675) ~= 0 then
        setPlayerStorageValue(cid, 3424675, 0) 
	end 
	if getPlayerStorageValue(cid, 3727678) ~= 0 then
        setPlayerStorageValue(cid, 3727678, 0) 
	end
	registerCreatureEvent(cid, "reflectrob")
	registerCreatureEvent(cid, "checkBless")
	registerCreatureEvent(cid, "showKD")
	doPlayerOpenChannel(cid, 9)
	doPlayerOpenChannel(cid, 8)
	doPlayerOpenChannel(cid, 10)
	
	if getCreatureName(cid) == "Account Manager" then
    return false
	end
	registerCreatureEvent(cid, "reborn")
	if getPlayerStorageValue(cid, 19332) == -1 then
        setPlayerStorageValue(cid, 19332, 0) 
    end 
	registerCreatureEvent(cid, "PushPlayerThere")
	---------- PlayerPort---------------
	if getPlayerStorageValue(cid, 49708) ~= 0 then
        setPlayerStorageValue(cid, 49708, 0) 
	end
	-- doPlayerPopupFYI(cid, "[ APROVEITE ] Double POINTS + Double EXP + Double SKILL !")
	
	return true
end
