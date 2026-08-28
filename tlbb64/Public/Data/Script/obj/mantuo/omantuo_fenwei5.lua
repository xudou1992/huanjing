--王凝悦

--**********************************
--事件交互入口
--**********************************
function x893289_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{MPSD_220622_117}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
