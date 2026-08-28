--往日梦境副本

--脚本号
x998480_g_ScriptId = 998480

--**********************************
-- 获取本副本的MonsterID
--**********************************
function x998480_GetFubenMonsterDataId(sceneId,selfId,nIndex)
	if nIndex == 1 then
		return 51214,0
	elseif nIndex == 2 then
		return 51220,0
	elseif nIndex == 3 then
		return 51226,0
	elseif nIndex == 4 then
		return 51232,1
	end
end
