--测试脚本 程序
x777779_g_scriptId=777779

--**********************************
--事件交互入口
--**********************************
function x777779_DebugBegin(sceneId,selfId)
 
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x777779_NotifyFailTip( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end