--90地图限制
x777775_g_scriptId=777775
--**********************************
--事件交互入口
--**********************************
function x777775_OnSceneTimer(sceneId)
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	nHumanCount = nHumanCount - 1;
	local nHumanID;
	for i = 0,nHumanCount do
		nHumanID = LuaFnGetCopyScene_HumanObjId(sceneId,i)
		if LuaFnIsObjValid(sceneId,nHumanID) == 1 and LuaFnIsCanDoScriptLogic(sceneId,nHumanID) == 1 and LuaFnIsCharacterLiving(sceneId,nHumanID) == 1 then
			--等级不足90级，全送回去
			if GetLevel(sceneId,nHumanID) < 90 then
				CallScriptFunction(400900,"TransferFunc",sceneId,nHumanID,0,91,186)
			end
		end
	end
end