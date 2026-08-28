--脚本号
x998257_g_ScriptId = 998257
x998257_g_NeedMaterial = 20600047
x998257_g_NeedNum = 5
x998257_g_GenItem = 20600004
--**********************************
--任务入口函数
--**********************************
function x998257_OnDefaultEvent( sceneId, selfId, targetId,opId )
	if sceneId ~= SCENE_SHUNANZHUHAI and sceneId ~= SCENE_BAIXIHU and sceneId ~= SCENE_XILIANGFENGLIN then
		x998257_NotifyTips(sceneId,selfId,"#{BLDPVP_221214_155}")
		return
	end
	if opId == -1 then
		BeginEvent( sceneId )
			AddText(sceneId,"#{BLDPVP_221214_157}")
			--合成灵级长春玉
			AddNumText( sceneId, x998257_g_ScriptId, "#{BLDPVP_221214_158}", 6, 1 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	elseif opId == 1 then
		local nBindItemNum =LuaFnGetBindItemCountInBag(sceneId,selfId,x998257_g_NeedMaterial)
		local nUnBindItemNum =LuaFnGetNotBindItemCountInBag(sceneId,selfId,x998257_g_NeedMaterial)
		if nBindItemNum + nUnBindItemNum < x998257_g_NeedNum then
			x998257_NotifyTips( sceneId, selfId, "#{BLDPVP_221214_156}")
			return
		end
		BeginAddItem(sceneId)
		if nBindItemNum >= x998257_g_NeedNum then
			AddBindItem(sceneId,x998257_g_GenItem, 1)
		elseif nBindItemNum > 0 and nBindItemNum < x998257_g_NeedNum and nUnBindItemNum > 0 then
			AddBindItem(sceneId,x998257_g_GenItem, 1)
		elseif nBindItemNum == 0 and nUnBindItemNum > 0 then
			AddItem(sceneId,x998257_g_GenItem, 1)
		end
		if EndAddItem(sceneId,selfId) <= 0 then
			return
		end
		--执行扣除
		if nBindItemNum >= x998257_g_NeedNum then
			LuaFnDelBindAvailableItem(sceneId,selfId,x998257_g_NeedMaterial,x998257_g_NeedNum)
		elseif nBindItemNum > 0 and nBindItemNum < x998257_g_NeedNum and nUnBindItemNum > 0 then
			LuaFnDelBindAvailableItem(sceneId,selfId,x998257_g_NeedMaterial,nBindItemNum)
			LuaFnDelNotBindAvailableItem(sceneId,selfId,x998257_g_NeedMaterial,x998257_g_NeedNum - nBindItemNum)
		elseif nBindItemNum == 0 and nUnBindItemNum > 0 then
			LuaFnDelNotBindAvailableItem(sceneId,selfId,x998257_g_NeedMaterial,x998257_g_NeedNum)
		end
		AddItemListToHuman(sceneId,selfId)
		
		x998257_NotifyTips( sceneId, selfId, "#{BLDPVP_221214_153}")
	end
	
end

--**********************************
--列举事件
--**********************************
function x998257_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId, x998257_g_ScriptId, "#{BLDPVP_221214_154}", 6, -1)
end

--**********************************
-- 屏幕中间提示
--**********************************
function x998257_NotifyTips(sceneId,selfId,tips)
	BeginEvent(sceneId)
		AddText(sceneId,tips);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
--**********************************
--对话框提示
--**********************************
function x998257_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end