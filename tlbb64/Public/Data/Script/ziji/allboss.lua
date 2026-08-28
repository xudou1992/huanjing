x900095_g_scriptId = 900095
x900095_g_AllBoss = {}
x900095_g_BossSysMsgByGroupID = {}

-- 保留BOSS刷新公告配置
x900095_g_BossSysMsgByGroupID[5] = {Msg="#cFF0000镜湖BOSS#W：#R镜湖出现了顶级BOSS镜湖·霸主！",isSended=0}

-- 保留BOSS刷新配置（ScriptID仍为100020，绑定到100020的死亡事件）
x900095_g_AllBoss[5] =
{
	{ ID=55040, GroupId=5, Title="镜湖·霸主", PosX=109,  PosY=149, BaseAI=27, ExtAIScript=209, ScriptID=100020 },
}

-- 保留BOSS刷新定时器（修复newsceneid未定义问题）
function x900095_OnCharacterTimer(sceneId, objId, dataId, uTime)
	if x900095_g_AllBoss[sceneId] == nil then return end
	local nHour = GetHour()
	local nMinute = GetMinute()
	if sceneId == 5 then	-- 镜湖地图
		--if nHour == 5 or nHour == 14 or nHour == 21 or nHour == 0 then
		if nHour == 21 then

			if nMinute == 01 then
				x900095_CreateMonster(sceneId, nil) -- 修复：传入nil替代未定义的newsceneid
			end
		end
    end	
end

-- 保留BOSS刷新逻辑（删除冗余判断，简化刷怪流程）
function x900095_CreateMonster(sceneId, newsceneid)
	if newsceneid == nil then
		newsceneid = sceneId
	end
	-- 重置公告发送状态
	for j, msgData in x900095_g_BossSysMsgByGroupID do
		msgData.isSended = 0
	end
	-- 先删除场景中已存在的同ID BOSS（避免重复）
	for i, data in x900095_g_AllBoss[newsceneid] do
		local nMonsterNum = GetMonsterCount(sceneId)
		for j = 0, nMonsterNum - 1 do
			local MonsterId = GetMonsterObjID(sceneId, j)
			local MosDataID = GetMonsterDataID(sceneId, MonsterId)
			if MosDataID == data.ID then
				LuaFnDeleteMonster(sceneId, MonsterId)
			end
		end
	end
	-- 生成新BOSS并发送公告
	for k, data in x900095_g_AllBoss[newsceneid] do
		local MstId = LuaFnCreateMonster(sceneId, data.ID, data.PosX + random(-5, 5), data.PosY + random(-5, 5), data.BaseAI, data.ExtAIScript, data.ScriptID)
		if MstId > 0 then -- 确保BOSS生成成功后再设置标题和公告
			SetCharacterTitle(sceneId, MstId, data.Title)
			x900095_SysMsg(sceneId, data.GroupId)
		end
	end		
end

-- 保留副本刷怪逻辑（如需保留副本场景BOSS刷新，可保留；无需则删除）
function x900095_CreateMonsterdange(sceneId)
	for j, msgData in x900095_g_BossSysMsgByGroupID do
		msgData.isSended = 0
	end
	for i, data in x900095_g_AllBoss[sceneId] do
		local isExist = 0
		local nMonsterNum = GetMonsterCount(sceneId)
		for i = 0, nMonsterNum - 1 do
			local MonsterId = GetMonsterObjID(sceneId, i)
			local MosDataID = GetMonsterDataID(sceneId, MonsterId)
			if MosDataID == data.ID then
				isExist = 1
				break
			end
		end
		if isExist == 0 then
			local MstId = LuaFnCreateMonster(sceneId, data.ID, data.PosX + random(-5, 5), data.PosY + random(-5, 5), data.BaseAI, data.ExtAIScript, data.ScriptID)
			if MstId > 0 then
				SetCharacterTitle(sceneId, MstId, data.Title)
			end
		end
		x900095_SysMsg(sceneId, data.GroupId)
	end
end

function x900095_SysMsg(sceneId, groupId)
	if x900095_g_BossSysMsgByGroupID[groupId] and x900095_g_BossSysMsgByGroupID[groupId].isSended == 0 then
		AddGlobalCountNews(sceneId, x900095_g_BossSysMsgByGroupID[groupId].Msg)
		x900095_g_BossSysMsgByGroupID[groupId].isSended = 1
	end
end