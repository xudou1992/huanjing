--十方轮

x890130_g_ScriptId	= 890130
--**********************************
--事件交互入口
--**********************************
function x890130_OnDefaultEvent( sceneId, selfId,targetId )
	if GetMonsterDataID(sceneId,targetId) == 50903 then
		x890130_MsgBox( sceneId, selfId, targetId, "#{BLCC_20221214_51}" )
	else
		x890130_MsgBox( sceneId, selfId, targetId, "#{BLCC_20221214_52}" )
	end
end
--**********************************
--对话窗口信息提示
--**********************************
function x890130_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
