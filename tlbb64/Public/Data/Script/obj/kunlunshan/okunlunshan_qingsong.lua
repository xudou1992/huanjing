--脚本号
x001224_g_ScriptId = 001224
--**********************************
--事件列表
--**********************************
function x001224_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{KLS_090604_05}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001224_OnDefaultEvent( sceneId, selfId,targetId )
	x001224_UpdateEventList( sceneId, selfId, targetId )
end
