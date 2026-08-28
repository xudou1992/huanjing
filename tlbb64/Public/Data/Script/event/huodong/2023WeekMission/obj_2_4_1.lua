--水幕摇柄

x890131_g_ScriptId	= 890131
--**********************************
--事件交互入口
--**********************************
function x890131_OnDefaultEvent( sceneId, selfId,targetId )
	if GetMonsterDataID(sceneId,targetId) == 50910 then
		x890131_MsgBox( sceneId, selfId, targetId, "#{BLCC_20221214_478}" )
	else
		x890131_MsgBox( sceneId, selfId, targetId, "#{BLCC_20221214_52}" )
	end
end
--**********************************
--对话窗口信息提示
--**********************************
function x890131_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
