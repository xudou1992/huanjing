--花照水

--**********************************
--事件交互入口
--**********************************
function x893292_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{MPSD_220622_54}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
