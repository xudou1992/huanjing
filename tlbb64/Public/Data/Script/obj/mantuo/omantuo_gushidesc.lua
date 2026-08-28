--曼陀山庄NPC
--王离忧
--普通

x893281_g_scriptId = 893281

--**********************************
--事件交互入口
--**********************************
function x893281_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{MPSD_220622_58}")
		AddNumText(sceneId, x893281_g_scriptId, "#{MPSD_220622_59}",-1,0)
		AddNumText(sceneId, x893281_g_scriptId, "#{MPSD_220622_60}",-1,1)
		AddNumText(sceneId, x893281_g_scriptId, "#{MPSD_220622_61}",-1,2)
		AddNumText(sceneId, x893281_g_scriptId, "#{MPSD_220622_62}",-1,3)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x893281_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		BeginEvent(sceneId)
			AddText(sceneId, "#{MPSD_220622_63}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	elseif GetNumText() == 1 then
		BeginEvent(sceneId)
			AddText(sceneId, "#{MPSD_220622_64}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	elseif GetNumText() == 2 then
		BeginEvent(sceneId)
			AddText(sceneId, "#{MPSD_220622_65}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	elseif GetNumText() == 3 then
		BeginEvent(sceneId)
			AddText(sceneId, "#{MPSD_220622_66}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
end
