--洛阳NPC
--范纯仁
--建立帮会
--脚本号
x000030_g_scriptId = 000030

--所拥有的事件ID列表
x000030_g_eventList={600000}
x000030_g_DeliveryScript = 006668
x000030_g_DeliveryList = {1018714}
--**********************************
--事件交互入口
--**********************************
function x000030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  想要创建帮会就来找我吧！")
	
	AddNumText( sceneId, x000030_g_scriptId, "帮会与领地介绍", 11, 10 )
	
		AddNumText(sceneId,x000030_g_scriptId,"查看帮会列表",6,2)	
		if IsShutout( sceneId, selfId, ONOFF_T_GUILD ) == 0 then
			AddNumText(sceneId,x000030_g_scriptId,"创建帮会",6,1)
		end
		AddNumText(sceneId,x000030_g_scriptId,"管理帮会会员信息",6,3)
		AddNumText(sceneId,x000030_g_scriptId,"查看本帮详细资讯",6,4)
		if(GetHumanGuildID(sceneId, selfId) ~= -1) then
			if IsShutout( sceneId, selfId, ONOFF_T_CITY ) == 0 then
				AddNumText(sceneId,x000030_g_scriptId,"申请城市",6,5)
			end
			if(CityGetSelfCityID(sceneId, selfId) ~= -1) then
				AddNumText(sceneId,x000030_g_scriptId,"进入本帮城市",9,6)
			end
		end
		AddNumText(sceneId,x000030_g_scriptId,"关于帮派繁荣度",11,11)
		AddNumText(sceneId,x000030_g_scriptId,"同盟介绍",11,12)
		for i,Deliveryidx in x000030_g_DeliveryList do
			CallScriptFunction( x000030_g_DeliveryScript, "OnEnumerate",sceneId, selfId, targetId ,Deliveryidx)
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x000030_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_069}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	if GetNumText() == 11 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{Guild_Boom_Help}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	if GetNumText() == 12 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{TM_20080331_07}".."#{TM_20080320_02}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	local sel = GetNumText();
	--配表任务
	for i,Deliveryidx in x000030_g_DeliveryList do
		if eventId == x000030_g_DeliveryScript then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId ,Deliveryidx)
		end
	end
	for i, eventId in x000030_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId, sel)
	end
end
--**********************************
--接受此NPC的任务
--**********************************
function x000030_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	--配表任务
	local ret = 0
	for i,Deliveryidx in x000030_g_DeliveryList do
		if missionScriptId == x000030_g_DeliveryScript then
			ret = CallScriptFunction( missionScriptId, "CheckAccept",sceneId, selfId ,Deliveryidx)
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId,Deliveryidx)
			end
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x000030_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000030_g_eventList do
		if missionScriptId == findId then
			x000030_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000030_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	--配表任务
	for i,Deliveryidx in x000030_g_DeliveryList do
		if missionScriptId == x000030_g_DeliveryScript then
			CallScriptFunction( missionScriptId, "OnContinue",sceneId, selfId ,targetId,Deliveryidx)
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000030_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	--配表任务
	for i,Deliveryidx in x000030_g_DeliveryList do
		if missionScriptId == x000030_g_DeliveryScript then
			CallScriptFunction( missionScriptId, "OnSubmit",sceneId, selfId ,targetId,selectRadioId,Deliveryidx)
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000030_OnDie( sceneId, selfId, killerId )
end
