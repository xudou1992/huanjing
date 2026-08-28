--脚本号
x893007_g_scriptId = 893007

x893007_g_AllBoss = {434}
--##18是场景ID，参考SceneInfo.ini

--##这里是系统公告，根据分组ID发布公告，同一组BOSS只发布一次
x893007_g_BossSysMsgByGroupID={}
x893007_g_BossSysMsgByGroupID[434]={Msg="#cff99cc昆仑福地的#Y高手BOSS#cff99cc已出现在#G昆仑福地#W（40，32  93，43   62，97  83，105）",isSended=0}

x893007_g_AllBoss[434]=
{	
	{ ID=55043, GroupId=434, Title="", PosX=40,  PosY=32,  BaseAI=0, ExtAIScript=244, ScriptID=-1 },	
	{ ID=55043, GroupId=434, Title="", PosX=93,  PosY=43,  BaseAI=0, ExtAIScript=244, ScriptID=-1 },
	{ ID=55043, GroupId=434, Title="", PosX=62,  PosY=97,  BaseAI=0, ExtAIScript=244, ScriptID=-1 },
	{ ID=55043, GroupId=434, Title="", PosX=83,  PosY=105,  BaseAI=0, ExtAIScript=244, ScriptID=-1 },
}

--##场景地图要加一个NPC，来触发脚本,如yannan_monster.ini，scripttimer是脚本回调时间，60000为60秒调用一次脚本
-- [monster142]
-- guid=9913082
-- type=0
-- pos_x=0
-- pos_z=0
-- dir=27
-- script_id=893007
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
--刷怪逻辑
--**********************************
function x893007_OnCharacterTimer( sceneId, objId, dataId, uTime )
	local nHour	 = GetHour()--小时
	local nMinute = GetMinute()--分钟
	
	if sceneId==434 then	--##玄海
	    if (nHour==2 and nMinute==00) 
		or (nHour==4 and nMinute==00) 
		or (nHour==6 and nMinute==00) 
		or (nHour==8 and nMinute==00)
		or (nHour==10 and nMinute==00)
		or (nHour==12 and nMinute==00)
		or (nHour==14 and nMinute==00)
		or (nHour==16 and nMinute==00)
		or (nHour==18 and nMinute==00)
		or (nHour==20 and nMinute==00)
		or (nHour==22 and nMinute==00)
		or (nHour==24 and nMinute==00)		then --##21点半和12点半刷雁南的怪
			x893007_CreateMonster( sceneId )	--刷怪
		end
	end
	--AddGlobalCountNews( sceneId, nMinute )
	--取消时钟
	--SetCharacterTimer( sceneId, objId, 0 )
end

--**********************************
--刷BOSS
--**********************************
function x893007_CreateMonster( sceneId )
	--##重置公告标识
	for j,msgData in x893007_g_BossSysMsgByGroupID do 
		msgData.isSended=0
	end
	--刷怪前如果怪存在的话全部清空，再刷
	for i,data in x893007_g_AllBoss[sceneId] do
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
	for i,data in x893007_g_AllBoss[sceneId] do
		local MstId = LuaFnCreateMonster(sceneId, data.ID, data.PosX, data.PosY, data.BaseAI, data.ExtAIScript, data.ScriptID )
		SetCharacterTitle(sceneId, MstId, data.Title)
		--x893007_SysMsg( sceneId, data.GroupId )
	end
		AddGlobalCountNews( sceneId, x893007_g_BossSysMsgByGroupID[434].Msg )
end

--**********************************
--系统公告
--**********************************
function x893007_SysMsg( sceneId, groupId )
	if x893007_g_BossSysMsgByGroupID[groupId].isSended==0 then
		--BroadMsgByChatPipe( sceneId, 0, x893007_g_BossSysMsgByGroupID[groupId].Msg, 4 )
		AddGlobalCountNews( sceneId, x893007_g_BossSysMsgByGroupID[groupId].Msg )
		x893007_g_BossSysMsgByGroupID[groupId].isSended=1
	end
end

--**********************************
--对话窗口信息提示
--**********************************
function x893007_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end


--**********************************
--醒目提示
--**********************************
function x893007_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--关闭对话框
--**********************************
function x893007_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end