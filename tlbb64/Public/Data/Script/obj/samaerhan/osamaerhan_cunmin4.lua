--脚本号
x001261_g_ScriptId = 001261
--**********************************
--事件列表
--**********************************
function x001261_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{SMEH_100222_12}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001261_OnDefaultEvent( sceneId, selfId,targetId )
	x001261_UpdateEventList( sceneId, selfId, targetId )
end
