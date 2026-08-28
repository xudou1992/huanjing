--脚本号
x001259_g_ScriptId = 001259
--**********************************
--事件列表
--**********************************
function x001259_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{SMEH_100222_10}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001259_OnDefaultEvent( sceneId, selfId,targetId )
	x001259_UpdateEventList( sceneId, selfId, targetId )
end
