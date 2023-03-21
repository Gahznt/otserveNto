

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 138) -- afeito no alvo sem time
local positionME = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z} --- efeito caster
doSendMagicEffect(positionME, 4) 

local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(doSendMagicEffect, 200, {x = poz.x+1, y = poz.y+0, z = poz.z}, 14)

local target = getCreatureTarget(cid) 
local pos = getCreaturePosition(target) -- efeito no target
addEvent(doSendDistanceShoot, 100, getCreaturePosition(cid), pos, 37)
addEvent(doSendMagicEffect, 100, {x = pos.x+1, y = pos.y+0, z = pos.z}, 113)

addEvent(onCastSpell1, 200, parameters) -- Chama nova func dano


--------------------------------------------------------------------
local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTBLUE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2.1, 1, -2.2, 1)


arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)


local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(doSendDistanceShoot, 300, getCreaturePosition(cid), pos, 37)
addEvent(doSendMagicEffect, 100, {x = poz.x, y = poz.y, z = poz.z}, 113)
addEvent(onCastSpell1, 100, parameters)
return TRUE
end 


----------------------------------------------------------------
Damages Formulas
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.0, -150, -1.0, -200)   -- SPELL 1 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2.0, -400, -2.0, -600)   -- SPELL 2 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.0, -600, -3.0, -800)   -- SPELL 3 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -4.0, -800, -4.0, -1000)   -- SPELL 4 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -5.0, -1200, -5.0, -1400)   -- SPELL 5 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -6.0, -1400, -6.0, -1600)   -- SPELL 6 =  
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -9.0, -1600, -9.0, -1800)   -- SPELL 7 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -12.0, -1600, -12.0, -1800)   -- SPELL 8 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -15.0, -1600, -15.0, -1800)   -- SPELL 9 = 
Damages Formulas 	--2X
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.5, -75, -2.0, -100)   -- SPELL 1 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.0, -200, -2.0, -300)   -- SPELL 2 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.5, -300, -2.0, -400)   -- SPELL 3 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2.0, -400, -2.0, -500)   -- SPELL 4 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2.5, -600, -2.0, -700)   -- SPELL 5 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.0, -700, -2.0, -800)   -- SPELL 6 =  
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -4.5, -800, -2.0, -900)   -- SPELL 7 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -6.0, -800, -2.0, -900)   -- SPELL 8 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -7.5, -800, -2.0, -900)   -- SPELL 9 = 
Damages Formulas 	--3X
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.35, -50, -0.35, -65)   -- SPELL 1 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.75, -135, -0.75, -200)   -- SPELL 2 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.0, -200, -1.0, -265)   -- SPELL 3 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.35, -265, -1.35, -335)   -- SPELL 4 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.75, -400, -1.75, -465)   -- SPELL 5 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2.0, -465, -2.0, -535)   -- SPELL 6 =  
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.0, -535, -3.0, -600)   -- SPELL 7 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -4.0, -535, -4.0, -600)   -- SPELL 8 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -5.0, -535, -5.0, -600)   -- SPELL 9 = 
Damages Formulas	--4X
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.25, -35, -0.25, -50)   -- SPELL 1 	= 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.5, -100, -0.5, -200)   -- SPELL 2 	= 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.75, -150, -0.75, -200)   -- SPELL 3 	= 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.0, -200, -1.0, -250)   -- SPELL 4 	= 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.25, -300, -1.25, -350)   -- SPELL 5 	= 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.5, -350, -1.5, -400)   -- SPELL 6 	=  
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2.25, -400, -2.25, -450)   -- SPELL 7 	= 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.0, -400, -3.0, -450)   -- SPELL 8 	= 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.75, -400, -3.75, -450)   -- SPELL 9 	= 
Damages Formulas	--5X
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.2, -30, -0.2, -40)   -- SPELL 1 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.4, -80, -0.4, -120)   -- SPELL 2 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.6, -120, -0.6, -160)   -- SPELL 3 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.8, -160, -0.8, -200)   -- SPELL 4 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.0, -240, -1.0, -280)   -- SPELL 5 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.2, -280, -1.2, -320)   -- SPELL 6 =  
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.8, -320, -1.8, -360)   -- SPELL 7 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2.4, -320, -2.4, -360)   -- SPELL 8 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.0, -320, -3.0, -360)   -- SPELL 9 = 
Damages Formulas	--6X
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.1, -25, -0.1, -35)   -- SPELL 1 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.3, -65, -0.3, -100)   -- SPELL 2 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.5, -100, -0.5, -135)   -- SPELL 3 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.6, -160, -0.6, -165)   -- SPELL 4 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.8, -200, -0.8, -235)   -- SPELL 5 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.0, -235, -1.0, -265)   -- SPELL 6 =  
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.5, -265, -1.5, -300)   -- SPELL 7 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2.0, -265, -2.0, -300)   -- SPELL 8 = 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2.5, -265, -2.5, -300)   -- SPELL 9 = 