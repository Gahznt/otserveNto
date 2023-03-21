local storages = {8205} -- storages que serão verificadas

function onStepIn(cid, item, position, fromPosition)
		exhaustion.set(cid, storages, 5)
		doCreatureSay(cid, "Hupp!", TALKTYPE_MONSTER)
end
