--王绾绾

--**********************************
--事件交互入口
--**********************************
function x893287_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{MPSD_220622_90}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
