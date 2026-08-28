--传送中心脚本
x400999_g_ScriptId = 400999

x400999_g_PetIsLandMissionId = 2062
--**********************************
--玩家进入一个 area 时触发
--**********************************
function x400999_OnEnterArea( sceneId, selfId , areaId)
	if sceneId == SCENE_PETISLAND then
		--传送到玄武岛镜
		if areaId == 1 then
			if GetLevel(sceneId,selfId) < 85 then
				x400999_NotifyTip( sceneId, selfId, "#{ZSPVP_211231_02}" )
				return
			end
			if IsMissionHaveDone(sceneId,selfId,x400999_g_PetIsLandMissionId) <= 0 then
				x400999_NotifyTip( sceneId, selfId, "#{ZSPVP_211231_01}" )
				return
			end
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId, x400999_g_ScriptId);
				UICommand_AddString(sceneId, "GotoPetIslandPVP");
				UICommand_AddString(sceneId, "#{ZSPVP_211231_58}");
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 24)
		end
	end
	if sceneId == SCENE_PETISLANDPVP then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, SCENE_PETISLAND, 130, 197, 15 );
	end
	if sceneId == SCENE_PETISLAND2 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, SCENE_PETISLAND, 106, 88, 15 );
	end
	--草原->白溪湖
	if sceneId == 20 and areaId == 2013 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, SCENE_BAIXIHU, 220,62, 75 );
	end
	--白溪湖->草原
	if sceneId == SCENE_BAIXIHU and areaId == 0 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 20,254,185, 10 );
	end
	--苍山->蜀南竹海
	if sceneId == 25 and areaId == 2514 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, SCENE_SHUNANZHUHAI, 126,222, 75 );
	end
	--蜀南竹海->苍山
	if sceneId == SCENE_SHUNANZHUHAI and areaId == 0 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 25,50,59, 10 );
	end
	--敦煌->西凉枫林
	if sceneId == 8 and areaId == 814 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, SCENE_XILIANGFENGLIN, 199,212, 75 );
	end
	--西凉枫林->敦煌
	if sceneId == SCENE_XILIANGFENGLIN and areaId == 0 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,8,94,44, 85 );
	end
	--长春谷·横崖->乌衣巷
	if sceneId == SCENE_CHANGCHUNGU_HY and areaId == 0 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,SCENE_CHANGCHUNGU_WYX,219,41, 85 );
	end
	--乌衣巷->长春谷·横崖
	if sceneId == SCENE_CHANGCHUNGU_WYX and areaId == 0 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,SCENE_CHANGCHUNGU_HY,49,57, 85 );
	end
	--熔岩蜃景->洛阳
	if sceneId == SCENE_SHENGJING_HUO and areaId == 0 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,0,199,200, 85 );
	end
	--熔岩蜃景->密林蜃景
	if sceneId == SCENE_SHENGJING_HUO and areaId == 1 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,SCENE_SHENGJING_MU,74,40, 85 );
	end
	--熔岩蜃景->清湖蜃景
	if sceneId == SCENE_SHENGJING_HUO and areaId == 2 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,SCENE_SHENGJING_SHUI,219,61, 85 );
	end
	--熔岩蜃景->地火岛
	if sceneId == SCENE_SHENGJING_HUO and areaId == 3 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,SCENE_DAO_DIHUO,36,98, 85 );
	end
	--密林蜃景->洛阳
	if sceneId == SCENE_SHENGJING_MU and areaId == 0 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,0,199,200, 85 );
	end
	--密林蜃景->清湖蜃景
	if sceneId == SCENE_SHENGJING_MU and areaId == 1 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,SCENE_SHENGJING_SHUI,52,201, 85 );
	end
	--密林蜃景->熔岩蜃景
	if sceneId == SCENE_SHENGJING_MU and areaId == 2 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,SCENE_SHENGJING_HUO,59,48, 85 );
	end
	--密林蜃景->繁林岛
	if sceneId == SCENE_SHENGJING_MU and areaId == 3 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,SCENE_DAO_FANLING,44,224, 85 );
	end
	--清湖蜃景->洛阳
	if sceneId == SCENE_SHENGJING_SHUI and areaId == 0 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,0,199,200, 85 );
	end
	--清湖蜃景->熔岩蜃景
	if sceneId == SCENE_SHENGJING_SHUI and areaId == 1 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,SCENE_SHENGJING_HUO,200,213, 85 );
	end
	--清湖蜃景->密林蜃景
	if sceneId == SCENE_SHENGJING_SHUI and areaId == 2 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,SCENE_SHENGJING_MU,183,212, 85 );
	end
	--清湖蜃景->沉月岛
	if sceneId == SCENE_SHENGJING_SHUI and areaId == 3 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,SCENE_DAO_CHENYUE,192,214, 85 );
	end
	--沉月岛->清湖蜃景
	if sceneId == SCENE_DAO_CHENYUE and areaId == 0 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,SCENE_SHENGJING_SHUI,90,63, 85 );
	end
	--沉月岛->繁林岛
	if sceneId == SCENE_DAO_CHENYUE and areaId == 1 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,SCENE_DAO_FANLING,228,206, 85 );
	end
	--沉月岛->地火岛
	if sceneId == SCENE_DAO_CHENYUE and areaId == 2 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,SCENE_DAO_DIHUO,208,51, 85 );
	end
	--地火岛->沉月岛
	if sceneId == SCENE_DAO_DIHUO and areaId == 0 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,SCENE_DAO_CHENYUE,170,32, 85 );
	end
	--地火岛->熔岩蜃景
	if sceneId == SCENE_DAO_DIHUO and areaId == 1 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,SCENE_SHENGJING_HUO,95,188, 85 );
	end
	--地火岛->繁林岛
	if sceneId == SCENE_DAO_DIHUO and areaId == 2 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,SCENE_DAO_FANLING,140,51, 85 );
	end
	--繁林岛->沉月岛
	if sceneId == SCENE_DAO_FANLING and areaId == 0 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,SCENE_DAO_CHENYUE,78,210, 85 );
	end
	--繁林岛->密林蜃景
	if sceneId == SCENE_DAO_FANLING and areaId == 1 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,SCENE_SHENGJING_MU,161,74, 85 );
	end
	--繁林岛->地火岛
	if sceneId == SCENE_DAO_FANLING and areaId == 2 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId,SCENE_DAO_DIHUO,47,136, 85 );
	end
end

--**********************************
--任务入口函数
--**********************************
function x400999_GotoPetIslandPVP( sceneId, selfId, targetId )
	
	-- 检查玩家是不是还在这个范围内
	if sceneId ~= SCENE_PETISLAND or QueryCurAreaId(sceneId,selfId) ~= 1 then
		x400999_NotifyTip( sceneId, selfId, "#{SJZ_100129_118}" )
		return
	end	
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, SCENE_PETISLANDPVP, 87, 31, 15 );
end
--**********************************
--玩家在一个 area 呆了一段时间没走则定时触发
--**********************************
function x400999_OnTimer( sceneId, selfId )
	-- 毫秒，看在这个 area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5秒后仍未传送
	if StandingTime >= 5000 then
		x400999_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end
--**********************************
--玩家离开一个 area 时触发
--**********************************
function x400999_OnLeaveArea( sceneId, selfId )
end

--**********************************
--对话窗口信息提示
--**********************************
function x400999_NotifyBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x400999_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
