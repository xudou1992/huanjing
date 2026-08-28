--巡逻 王云聚

--**********************************
--事件交互入口
--**********************************
function x893284_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{MPSD_220622_83}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
