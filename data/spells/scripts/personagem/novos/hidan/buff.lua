local outfit = {lookType = 1565} -- outfit
local tempo = 15 -- tempo em segundos.
local effect = {11} -- effect no player, caso queira apenas 1, basta remover os outros numeros.

local config = {
storage = 114305,
cooldown = 120,  --- tempo entre um uso e outro
}
     
local ml = 45 -- quantos ira aumentar o skill de ML
local skillfist = 0 -- quantos ira aumentar o skill de Fist
local skillsword = 0 -- quantos ira aumentar o skill de Sword
local skillaxe = 0 -- quantos ira aumentar o skill de Axe
local skillclub = 0 -- quantos ira aumentar o skill de Club
local skilldistance = 0 -- quantos ira aumentar o skill de Distance
local skillshield = 0 -- quantos ira aumentar o skill de Shield
local health = 10500 -- A cada 1 segundo quantos aumentar de vida
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
     
local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, ml)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, skillfist)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, skillsword)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXE, skillaxe)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, skillclub)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, skilldistance)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, skillshield)
setConditionParam(condition, CONDITION_PARAM_OUTFIT, outfit)
setCombatCondition(combat, condition)
     
local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_SPEED, 250)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setCombatCondition(combat, condition)
     
local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, health)
setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, 1000)
setCombatCondition(combat, condition)

local sys = createConditionObject(CONDITION_OUTFIT)
setConditionParam(sys, CONDITION_PARAM_TICKS, tempo)
addOutfitCondition(sys, outfit)
setCombatCondition(combat, sys)
            
function magicEffect2331(tempo2,tempo3,cid)
if (isCreature(cid)) then
    if getPlayerStorageValue(cid, 13333) > 0 and getCreatureCondition(cid, CONDITION_REGENERATION, 1) then
        for i=1, #effect do
        local position = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
doSendMagicEffect(position, effect[i])
        end
    end
end
end

local sys = createConditionObject(CONDITION_OUTFIT)
setConditionParam(sys, CONDITION_PARAM_TICKS, tempo*1000)
addOutfitCondition(sys, outfit)
setCombatCondition(combat, sys)
                  
function onCastSpell(cid, var)

local pos = getCreaturePosition(cid)
if isPlayer(cid) then
if os.time() - getPlayerStorageValue(cid, config.storage) >= config.cooldown then
setPlayerStorageValue(cid, config.storage, os.time())
else
doPlayerSendCancel(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, config.storage))).." segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
doSendMagicEffect(pos, 2)
return false
end
end

local position443 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
if getPlayerStorageValue(cid, 13333) ~= 1 or getCreatureCondition(cid, CONDITION_REGENERATION, 1) == false then
    doCombat(cid, combat, var)
    tempo2 = 0
    while (tempo2 ~= (tempo*1000)) do
        addEvent(magicEffect2331, tempo2, tempo2, tempo*1000, cid)
        tempo2 = tempo2 + 300
    end
    setPlayerStorageValue(cid, 13333,1) -- storage verifica transformado, quando = 1 player esta transformado.
    doCreatureSay(cid, "Im feeling much better!", TALKTYPE_MONSTER)
    doSendMagicEffect(position443, 275)
	doCreatureSetNoMove(cid, true)
	addEvent(doCreatureSetNoMove, 15 * 1000, cid, false)
else
    doPlayerSendCancel(cid, "Sorry, you are transformed.")
end
end