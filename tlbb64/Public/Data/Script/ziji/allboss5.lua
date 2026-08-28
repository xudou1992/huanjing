-- 脚本号
x893005_g_scriptId = 893005

x893005_g_AllBoss = {31}
--##18是场景ID，参考SceneInfo.ini

--##这里是系统公告，根据分组ID发布公告，同一组BOSS只发布一次
x893005_g_BossSysMsgByGroupID={}
x893005_g_BossSysMsgByGroupID[31]={Msg="#cff99cc龙泉的#Y中手BOSS#cff99cc已出现在#G龙泉#W（229，68  182，151  85，252  51，120）",isSended=0}

x893005_g_AllBoss[31]=
{	
	{ ID=55042, GroupId=31, Title="", PosX=229,  PosY=68,  BaseAI=0, ExtAIScript=259, ScriptID=-1 },	
	{ ID=55042, GroupId=31, Title="", PosX=182,  PosY=151,  BaseAI=0, ExtAIScript=259, ScriptID=-1 },
	{ ID=55042, GroupId=31, Title="", PosX=85,  PosY=252,  BaseAI=0, ExtAIScript=259, ScriptID=-1 },
	{ ID=55042, GroupId=31, Title="", PosX=51,  PosY=120,  BaseAI=0, ExtAIScript=259, ScriptID=-1 },
}

--##场景地图要加一个NPC，来触发脚本,如yannan_monster.ini，scripttimer是脚本回调时间，60000为60秒调用一次脚本
-- [monster142]
-- guid=9913082
-- type=0
-- pos_x=0
-- pos_z=0
-- dir=27
-- script_id=893005
-- respawn_time=1800000
-- base_ai=3
-- scripttimer=60000		
-- group_id=-1
-- team_id=-1
-- patrol_id=-1
-- shop0=-1
-- shop1=-1
-- shop2=-1
-- shop3=-1
-- ReputationID=-1
--**********************************
--刷怪逻辑（核心修复：函数名从x893005_OnCharacterTimer改为OnCharacterTimer）
--**********************************
function OnCharacterTimer( sceneId, objId, dataId, uTime )  -- 此处修改函数名
	local nHour	 = GetHour()--小时
	local nMinute = GetMinute()--分钟
	
	if sceneId==31 then	--##龙泉场景ID=31
	    if (nHour==2 and nMinute==00) 
		or (nHour==4 and nMinute==00) 
		or (nHour==6 and nMinute==17) 
		or (nHour==8 and nMinute==00)
		or (nHour==10 and nMinute==00)
		or (nHour==12 and nMinute==00)
		or (nHour==14 and nMinute==00)
		or (nHour==16 and nMinute==00)
		or (nHour==18 and nMinute==00)
		or (nHour==20 and nMinute==00)
		or (nHour==22 and nMinute==00)
		or (nHour==0 and nMinute==00)		then -- 修复：24点改为0点（小时范围是0-23，24点实际是0点）
			x893005_CreateMonster( sceneId )	--刷怪
		end
	end
	--AddGlobalCountNews( sceneId, nMinute )
	--取消时钟
	--SetCharacterTimer( sceneId, objId, 0 )
end

--**********************************
--刷BOSS（保留原逻辑）
--**********************************
function x893005_CreateMonster( sceneId )
	--##重置公告标识
	for j,msgData in x893005_g_BossSysMsgByGroupID do 
		msgData.isSended=0
	end
	--刷怪前如果怪存在的话全部清空，再刷
	for i,data in x893005_g_AllBoss[sceneId] do
		local nMonsterNum = GetMonsterCount(sceneId)
		for i=0, nMonsterNum-1 do
			local MonsterId = GetMonsterObjID(sceneId,i)
			local MosDataID = GetMonsterDataID( sceneId, MonsterId )
			if MosDataID == data.ID then
				--清怪
				LuaFnDeleteMonster(sceneId, MonsterId)
			end		
		end
	end
	--刷怪
	for i,data in x893005_g_AllBoss[sceneId] do
		local MstId = LuaFnCreateMonster(sceneId, data.ID, data.PosX, data.PosY, data.BaseAI, data.ExtAIScript, data.ScriptID )
		SetCharacterTitle(sceneId, MstId, data.Title)
		--x893005_SysMsg( sceneId, data.GroupId )
	end
	-- 修复：公告用正确的分组ID=31（原脚本用了1，会导致公告内容为空）
	AddGlobalCountNews( sceneId, x893005_g_BossSysMsgByGroupID[31].Msg )
end

--**********************************
--系统公告（保留原逻辑）
--**********************************
function x893005_SysMsg( sceneId, groupId )
	if x893005_g_BossSysMsgByGroupID[groupId].isSended==0 then
		--BroadMsgByChatPipe( sceneId, 0, x893005_g_BossSysMsgByGroupID[groupId].Msg, 4 )
		AddGlobalCountNews( sceneId, x893005_g_BossSysMsgByGroupID[groupId].Msg )
		x893005_g_BossSysMsgByGroupID[groupId].isSended=1
	end
end

--**********************************
--对话窗口信息提示（保留原逻辑）
--**********************************
function x893005_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end


--**********************************
--醒目提示（保留原逻辑）
--**********************************
function x893005_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--关闭对话框（保留原逻辑）
--**********************************
function x893005_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end