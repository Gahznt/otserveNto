local config = {
health = 225,
mana = 135
}


function onCastSpell(cid, var)

if getCreatureMaster(cid) then
local master = getCreatureMaster(cid)
if isInParty(master) then
	local members = getPartyMembers(getPlayerParty(master))
	local health = math.ceil( config.health / #members )
	local mana = math.ceil( config.mana / #members )
	for i = 1, #members do
	doCreatureAddHealth(members[i], health)
	doCreatureAddMana(members[i], mana)
	doSendAnimatedText(getCreaturePosition(members[i]), "+"..health, 18)	
	doSendMagicEffect(getCreaturePosition(members[i]), 5)		
	end
else
	doCreatureAddHealth(master, config.health)
	doCreatureAddMana(master, config.mana)
	doSendAnimatedText(getCreaturePosition(master), "+"..config.health, 18)		
	doSendMagicEffect(getCreaturePosition(master), 5)	
end
end
return true
end