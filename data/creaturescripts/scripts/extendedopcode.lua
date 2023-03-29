OPCODE_LANGUAGE = 1

function onExtendedOpcode(cid, opcode, buffer)
	if(opcode == OPCODE_LANGUAGE) then
		if(buffer == 'de' or buffer == 'en' or buffer == 'es' or buffer == 'pl' or buffer == 'pt' or buffer == 'sv') then
		end
	else
		-- other opcodes can be ignored, and the server will just work fine...
	end

	if(opcode == 102) then
		print(opcode)
		return doSendPlayerExtendedOpcode(cid, 110, "uau")
	end

end
