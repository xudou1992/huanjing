--脚本号
x402050_g_scriptId = 402050
--**********************************
--事件列表
--**********************************
x402050_g_MissBoss = {8,9,10,11,12,13}
x402050_g_NpcID = {13550,13551,13552,13553,13554,13555,13556,13557,13558,13559,13560,13561}
function x402050_UpdateEventList( sceneId, selfId,targetId )
	local szName = GetName(sceneId,targetId)
	local IsZhanDouFlag = LuaFnGetCopySceneData_Param(sceneId,18)
	BeginEvent(sceneId)
		if szName == "吴永" then
			AddText(sceneId,"#{SXRW_090119_150}")
		elseif szName == "林充" then
			AddText(sceneId,"#{SXRW_090119_147}")
		elseif szName == "宋姜" then
			AddText(sceneId,"#{SXRW_090119_142}")
		elseif szName == "鲁志生" then
			AddText(sceneId,"#{SXRW_090119_145}")
		elseif szName == "花容" then
			AddText(sceneId,"#{SXRW_090119_152}")
		elseif szName == "关盛" then
			AddText(sceneId,"#{SXRW_090119_146}")
		elseif szName == "武颂" then
			AddText(sceneId,"#{SXRW_090119_149}")
		elseif szName == "公孙圣" then
			AddText(sceneId,"#{SXRW_090119_151}")
		elseif szName == "李魁" then
			AddText(sceneId,"#{SXRW_090119_144}")
		elseif szName == "秦冥" then
			AddText(sceneId,"#{SXRW_090119_148}")
		elseif szName == "呼延啄" then
			AddText(sceneId,"#{SXRW_090119_153}")
		elseif szName == "卢君逸" then
			AddText(sceneId,"#{SXRW_090119_143}")
		end
		if IsZhanDouFlag == 0 then
			AddNumText( sceneId, x402050_g_scriptId, "开启挑战！", 10,1)
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x402050_OnDefaultEvent( sceneId, selfId,targetId )
	x402050_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x402050_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText();
	local nIndex = 0;
	local nBossID = 0;
	local nTimeout = LuaFnGetCopySceneData_Param(sceneId,14)
	local IsZhanDouFlag = LuaFnGetCopySceneData_Param(sceneId,18)
	if IsZhanDouFlag > 0 then
		return
	end
	if nNumText == 1 then
		for i = 1,getn(x402050_g_MissBoss) do
			local MosDataID = GetMonsterDataID(sceneId,targetId)
			if MosDataID == x402050_g_NpcID[LuaFnGetCopySceneData_Param(sceneId,x402050_g_MissBoss[i])] then
				nIndex = i;
				break
			end
		end
		nBossID = LuaFnGetCopySceneData_Param(sceneId,x402050_g_MissBoss[nIndex])
		CallScriptFunction(402048,"CreateMonster",sceneId,nBossID) --生成怪物。
		LuaFnSetCopySceneData_Param(sceneId,18,1)
		if nTimeout > 0 then
			LuaFnSetCopySceneData_Param(sceneId,14,0)
		end
	end
end