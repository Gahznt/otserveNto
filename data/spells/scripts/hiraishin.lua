local config = {
	storageID = 49609,
	mark_time = 30,
}

local errorMsg = {
	pz = "Seu alvo nao pode estar fora do PZ.",
	playerOnly = "Voce so pode usar este jutsu em players.",
	alreadyMarked = "Voce ja marcou um jogador.",
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 474)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -10, -1, -20, 5, 5, 1.4, 2.1)


function onCastSpell(cid, var)
	--local target = getThingFromPosition(variantToPosition(var), 1)
	if isPlayer(getCreatureTarget(cid)) then
		if not getTilePzInfo(getThingPosition(getCreatureTarget(cid))) then
			if getPlayerStorageValue (cid, config.storageID) <= 0 then
				setPlayerStorageValue(cid, config.storageID, 1)
				doPlayerSendTextMessage(cid,22, "Voce marcou o player ".. getCreatureName(getCreatureTarget(cid)))
				local struct = {
					left = config.mark_time, 
					player = cid,
					target = target,
					var = var
				}
				addEvent(teleportIsTrue, 1000, struct)
			else
				doSendMagicEffect(getPlayerPosition(cid), 2)
				doPlayerSendCancel(cid, errorMsg.alreadyMarked)
			end
		else
			doSendMagicEffect(getPlayerPosition(cid), 2)
			doPlayerSendCancel(cid, errorMsg.pz)
		end
	else
		doSendMagicEffect(getPlayerPosition(cid), 2)
		doPlayerSendCancel(cid, errorMsg.playerOnly)		
	end
	return doCombat(cid, combat, var)
end

function teleportIsTrue (struct)
	if struct.left ~= 0 then
		if getPlayerStorageValue (struct.player, config.storageID) == 2 then
			doTeleportThing(struct.player, getThingPosition(getCreatureTarget(struct.player)), true)
			setPlayerStorageValue(struct.player, config.storageID, 0)
			doPlayerSendTextMessage(struct.player,22, "Voce perdeu sua marcacao.")
			return true
		end
		doPlayerSendTextMessage(struct.player,22, struct.left .. " segundos restantes.")
		struct.left = struct.left - 1
		addEvent (teleportIsTrue, 1000, struct)
	elseif struct.left == 0 then
		doPlayerSendTextMessage(struct.player,22, "Voce perdeu sua marcacao.")
		setPlayerStorageValue(struct.player, config.storageID, 0)
	else
		return false
	end
end