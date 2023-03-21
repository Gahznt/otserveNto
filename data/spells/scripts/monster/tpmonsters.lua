function onCastSpell(cid, var)

	 if isPlayer(getCreatureTarget(cid)) then

	 local p = getCreaturePosition(getCreatureTarget(cid))

		 p.x = p.x+math.random(-1,1)

		 p.y = p.y+math.random(-1,1)

		 doTeleportThing(cid,p)

		 doCreatureSay(cid,'Kawarimi!',3)

	 end

	 return true

end