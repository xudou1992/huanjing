--脚本号
x402049_g_scriptId = 402049
--**********************************
--事件列表
--**********************************
function x402049_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{SXRW_090119_041}")
		AddNumText( sceneId, x402049_g_scriptId, "#{YXJJ_091118_19}", 9,1)
		AddNumText( sceneId, x402049_g_scriptId, "#{YXJJ_091118_20}", 0,2)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x402049_OnDefaultEvent( sceneId, selfId,targetId )
	x402049_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x402049_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		--玩家主动离开副本
		CallScriptFunction(402048, "PlayerLeave",sceneId, selfId)
		--送回大理
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,130,77)
		return
	end
	if GetNumText() == 2 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
	end
end