--脚本号
x001225_g_ScriptId = 001225
--**********************************
--事件列表
--**********************************
function x001225_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{KLS_090604_08}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001225_OnDefaultEvent( sceneId, selfId,targetId )
	x001225_UpdateEventList( sceneId, selfId, targetId )
end
