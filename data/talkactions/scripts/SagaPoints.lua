domodlib('task_func')
function onSay(cid, words, param)
doPlayerSendTextMessage(cid,22,"Você possui [".. getTaskPoints(cid).."] Pontos de Graduação.")
	return true
end
