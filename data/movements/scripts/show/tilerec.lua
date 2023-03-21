local message = [[
 
- Recompensas de Graduação -

Pegue o certificado de sua graduação que está em cima
da mesa do Hokage Naruto.

Para isso, você deve completar as missões necessárias
e evoluir seu nível de graduação.

Você pode resgatar presentes para cada graduação, como
genin, chunin, jounin e kage.

Quer saber mais ? Faça parte da nossa comunidade forumeiros !

]]

		--Mensagem que aparecerá ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end