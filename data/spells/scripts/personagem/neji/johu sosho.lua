local quant_hit = 1 -- quantidade de hit's que ira dar no target 
local timeHit = 0.5 -- segundos de diferença para cada hit

local quant_sqm = 2 -- sqms que ira empurrar o target
local sqmTime = 0.01 -- segundos para empurrar após hitar, exemplo de meio segundo.

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -200.2, 1, -230.2, 1)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 6000)
setConditionParam(condition, CONDITION_PARAM_SPEED, -400)
setConditionFormula(condition, -0.9, 0, -0.9, 0)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
local target = getCreatureTarget(cid)
if target > 0 then
	local position_target = nil
	local cont = 0
	for i=-1, 1 do
		for j=-1,1 do
			position_target = {x=getCreaturePosition(target).x+i, y=getCreaturePosition(target).y+j, z=getCreaturePosition(target).z}
			if isWalkable(position_target) then
				cont = cont+1
				break
			end
		end
		if cont > 0 then
			break
		end
		position_target = nil
	end
	                                    
	local px = math.random(-1,1)
	local py = 0
	if px == -1 or px == 1 then
		py = 0
	elseif px == 0 then 
		local n = {1,-1}
		py = n[math.random(1,#n)]
	end	
	local poscentral = {x=getCreaturePosition(target).x+px, y=getCreaturePosition(target).y+py, z=getCreaturePosition(target).z}
	if isWalkable(poscentral) then
		position_target = poscentral
	end
	
	if getDistanceBetween(getCreaturePosition(cid), getCreaturePosition(target)) <= 1 then
		position_target = getCreaturePosition(cid)
	end
	if position_target ~= nil then
		doTeleportThing(cid, position_target)			
		local tempo = 0
		while (tempo ~= quant_hit*(timeHit*1000)) do
			addEvent(sendEffect1, tempo, cid, target)
			tempo = tempo + 500
		end
		tempo = 0
		while (tempo ~= quant_hit*(timeHit*1000)) do
			addEvent(hitTarget, tempo, cid, target)
			tempo = tempo + (timeHit*1000)
		end
		local temp = tempo
		while (tempo ~= temp+quant_sqm*(sqmTime*1000)) do
			addEvent(empurrarTarget, tempo, cid, target, tempo)
			tempo = tempo + (sqmTime*1000)
		end
		doAddCondition(cid, condition)
		doAddCondition(target, condition)
		return true
	else
		doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
	end
else
	doPlayerSendCancel(cid, "Você precisa de um target!")
end
end

function isWalkable(pos, creature, pz, proj)
    if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
	local creature = getTopCreature(pos)
    if creature.type > 0 then	return false end
	if getTilePzInfo(pos) and not pz then return false end
	local n = not proj and 3 or 2
	for i = 0, 255 do
        pos.stackpos = i
        local tile = getTileThingByPos(pos)
        if tile.itemid ~= 0 and not isCreature(tile.uid) then
            if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
                return false
            end
        end
	end
return true
end

function hitTarget(cid, target)
if isCreature(target) and isPlayer(cid) then
	local effect423 = 27 -- efeito do hit na creatura.
	doAddCondition(target, condition)
	doTargetCombatHealth(cid, target, COMBAT_PHYSICALDAMAGE, -getHit(cid), -getHit(cid), effect423)
end
end

function getHit(cid)
local hit = getPlayerLevel(cid)*2 + getPlayerMagLevel(cid)*2 + math.random(650,750)
return hit
end

function empurrarTarget(cid, target, tempo)
if isPlayer(cid) then
	doRemoveCondition(cid, CONDITION_PARALYZE)
end
if isCreature(target) and isPlayer(cid) then
	local positions = nil
	doAddCondition(target, condition)
	if getPlayerLookDir(cid) == 0 then
        positions = {x=getCreaturePosition(target).x, y=getCreaturePosition(target).y-1, z=getCreaturePosition(target).z}
    elseif getPlayerLookDir(cid) == 1 then
        positions = {x=getCreaturePosition(target).x+1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z}
    elseif getPlayerLookDir(cid) == 2 then
        positions = {x=getCreaturePosition(target).x, y=getCreaturePosition(target).y+1, z=getCreaturePosition(target).z}
    elseif getPlayerLookDir(cid) == 3 then
       positions = {x=getCreaturePosition(target).x-1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z}
    end
	if positions ~= nil and isWalkable(positions) then
		doTeleportThing(target, positions)
	end
	local tp = sqmTime*1000*(quant_sqm-1)+quant_hit*timeHit*1000
	if tempo == tp then
		doRemoveCondition(target, CONDITION_PARALYZE)
	end	
end
end

function sendEffect423(cid, target)
local position1 = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
local position2 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
	doSendMagicEffect(position1, 256) 
	doSendMagicEffect(position2, 1)
    doCreatureSay(cid, "Seikentsuki", TALKTYPE_MONSTER)
end