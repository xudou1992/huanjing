--**********************************
-- 自动战斗程序脚本
--**********************************
x891330_g_ScriptId	= 891330





--**********************************
--信息提示
--**********************************
function x891330_NotifyTip( sceneId, selfId,  msg )
	BeginEvent(sceneId)
		AddText(sceneId,msg)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
