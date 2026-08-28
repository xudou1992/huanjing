--云深深

--脚本号
x893077_g_ScriptId = 893077
--魂尘兑换的相关信息
x893077_g_PetSoul_HC_CostList ={
	[100] = {prizeItem = 38002534,nCost =2},
	[101] = {prizeItem = 38002533,nCost =4},
	[102] = {prizeItem = 38002532,nCost =10},
}
x893077_g_GameMaxTime = 5 --每日最大次数

--**********************************
--事件交互入口
--**********************************
function x893077_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{ZSPVP_211231_24}")
		AddNumText(sceneId,x893077_g_ScriptId,"#{ZSPVP_211231_25}",6,1)
		AddNumText(sceneId,x893077_g_ScriptId,"#{ZSPVP_211231_26}",6,2)	
		AddNumText(sceneId,x893077_g_ScriptId,"#{ZSPVP_211231_81}",6,3)	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x893077_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		if sceneId ~= SCENE_SUZHOU then
			x893077_NotifyTip( sceneId, selfId, "#{ZSPVP_211231_28}" )
			return
		end
		if GetLevel(sceneId,selfId) < 85 then
			x893077_NotifyBox( sceneId, selfId,targetId, "#{SHXT_20211230_189}" )
			return
		end
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			UICommand_AddInt( sceneId, GetMissionDataEx(sceneId,selfId,MDEX_PETSOUL_HUNCHEN) )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 89307801 )
		return
	end
	if GetNumText() == 2 then
		if sceneId ~= SCENE_SUZHOU then
			x893077_NotifyTip( sceneId, selfId, "#{ZSPVP_211231_28}" )
			return
		end
		if GetLevel(sceneId,selfId) < 85 then
			x893077_NotifyBox( sceneId, selfId,targetId, "#{SHXT_20211230_189}" )
			return
		end
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			UICommand_AddInt( sceneId, GetMissionDataEx(sceneId,selfId,MDEX_PETSOUL_HUNCHEN) )
			UICommand_AddInt( sceneId, x893077_g_GameMaxTime - GetMissionDataEx(sceneId,selfId,MDEX_PETSOUL_HUNCHENGAMETIME) )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 89307802 )
		return
	end

	if GetNumText() == 3 then
		if sceneId ~= SCENE_SUZHOU then
			x893077_NotifyTip( sceneId, selfId, "#{ZSPVP_211231_28}" )
			return
		end
		if GetLevel(sceneId,selfId) < 85 then
			x893077_NotifyBox( sceneId, selfId,targetId, "#{SHXT_20211230_189}" )
			return
		end
		BeginEvent(sceneId)
			AddText(sceneId,
			ScriptGlobal_Format("#{ZSPVP_211231_83}",tostring(GetMissionDataEx(sceneId,selfId,MDEX_PETSOUL_HUNCHEN))))
			
			AddNumText(sceneId,x893077_g_ScriptId,"#{ZSPVP_211231_86}",6,100)
			AddNumText(sceneId,x893077_g_ScriptId,"#{ZSPVP_211231_85}",6,101)	
			AddNumText(sceneId,x893077_g_ScriptId,"#{ZSPVP_211231_84}",6,102)	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	local nSelId = GetNumText()
	if nSelId >= 100 and nSelId <= 102 and x893077_g_PetSoul_HC_CostList[nSelId] ~= nil then
		if sceneId ~= SCENE_SUZHOU then
			x893077_NotifyTip( sceneId, selfId, "#{ZSPVP_211231_28}" )
			return
		end
		if GetLevel(sceneId,selfId) < 85 then
			x893077_NotifyBox( sceneId, selfId,targetId, "#{SHXT_20211230_189}" )
			return
		end
		local nCost = x893077_g_PetSoul_HC_CostList[nSelId].nCost
		if GetMissionDataEx(sceneId,selfId,MDEX_PETSOUL_HUNCHEN) < nCost then
			BeginEvent(sceneId)
				AddText(sceneId,"#{ZSPVP_211231_87}")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
			BeginEvent( sceneId )
				AddText( sceneId, "#{ZSPVP_211231_88}" )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
			return
		end
		local nItemID = x893077_g_PetSoul_HC_CostList[nSelId].prizeItem
		--检测背包空间
		BeginAddItem(sceneId)
		AddItem( sceneId,nItemID,5)	
		if EndAddItem(sceneId,selfId) <= 0 then
			BeginEvent(sceneId)
				AddText(sceneId,"#{ZSPVP_211231_90}")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
			BeginEvent( sceneId )
				AddText( sceneId, "#{ZSPVP_211231_91}" )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
			return
		end
		--扣除并赠与
		SetMissionDataEx(sceneId,selfId,MDEX_PETSOUL_HUNCHEN,GetMissionDataEx(sceneId,selfId,MDEX_PETSOUL_HUNCHEN) - nCost)
		AddItemListToHuman(sceneId,selfId)
		
		BeginEvent( sceneId )
			AddText( sceneId, ScriptGlobal_Format("#{ZSPVP_211231_89}",5,GetItemName(sceneId,nItemID)) )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		DispatchEventList(sceneId,selfId,targetId)
		
		return
	end
	
end
--**********************************
--醒目提示
--**********************************
function x893077_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
--对话提示
--**********************************
function x893077_NotifyBox( sceneId, selfId,targetId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchEventList(sceneId,selfId,targetId)
end
