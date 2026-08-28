--脚本号

x790075_g_ScriptId = 790075

-- 魂冰石
x790075_g_tableHunBingItemID = 
{
	20310117,	--魂冰珠（1级）
	20310118,	--魂冰珠（2级）
	20310119,	--魂冰珠（3级）
	20310120,	--魂冰珠（4级）
	20310121,	--魂冰珠（5级）
}

-- 绑定魂冰石
x790075_g_tableHunBingBindItemID = 
{
	20310161,	--魂冰珠（1级）
	20310162,	--魂冰珠（2级）
	20310163,	--魂冰珠（3级）
	20310164,	--魂冰珠（4级）
	20310165,	--魂冰珠（5级）
}

-- 魂冰珠消耗道具数量
x790075_g_tableCommonCostItemNum	= {5, 5, 5, 5}
x790075_g_tableQuickCostItemNum 	= {5, 25, 125, 625}

-- 魂冰珠消耗金钱
x790075_g_tableCommonCostMoney 	= {5000 , 5000, 10000, 10000 }
x790075_g_tableQuickCostMoney 	= {5000 , 30000, 160000, 810000 }

--**********************************
--客户端请求进行魂冰珠合成
--**********************************
function x790075_OnHunBingZhuCompoundNew( sceneId, selfId,targetId,nCurSelectedPage,nCurSelectedIndex,bComfirmed )
	if nCurSelectedPage < 1 or nCurSelectedPage > 2 then
		x790075_NotifyMsg( sceneId, selfId, "#{HBZHC_210923_22}")
		return
	end
	
	if nCurSelectedIndex < 1 or nCurSelectedIndex > 4 then
		x790075_NotifyMsg( sceneId, selfId, "#{HBZHC_210923_22}")
		return
	end
	
	local nTargetLevel =  nCurSelectedIndex + 1
	local nNeedItemLevel	= nCurSelectedIndex
	local nNeedItemID 		= x790075_g_tableHunBingItemID[nCurSelectedIndex]
	local nNeedBindItemID 	= x790075_g_tableHunBingBindItemID[nCurSelectedIndex]
	local nNeedItemNum		= x790075_g_tableCommonCostItemNum[nCurSelectedIndex]
	local nNeedMoney		= x790075_g_tableCommonCostMoney[nCurSelectedIndex]
	-- 快捷合成，重新算次数和金钱
	if 2 == nCurSelectedPage then
		nNeedItemLevel		= 1
		nNeedItemID 		= x790075_g_tableHunBingItemID[1]
		nNeedBindItemID 	= x790075_g_tableHunBingBindItemID[1]
		nNeedItemNum 		= x790075_g_tableQuickCostItemNum[nCurSelectedIndex]
		nNeedMoney 			= x790075_g_tableQuickCostMoney[nCurSelectedIndex]
	end
	--金钱检测
	if GetMoney(sceneId,selfId) + GetMoneyJZ(sceneId,selfId) < nNeedMoney then
		x790075_NotifyMsg( sceneId, selfId, "#{HBZHC_210923_24}" )
		return
	end
	--所需背包空间检查
	if LuaFnGetMaterialBagSpace(sceneId,selfId) < 1 then
		x790075_NotifyMsg( sceneId, selfId, "#{HBZHC_210923_25}" )
		return
	end
	--数量检查
	local nHaveBindCount = LuaFnGetAvailableItemCount(sceneId,selfId,nNeedBindItemID);
	local nHaveCount = LuaFnGetAvailableItemCount(sceneId,selfId,nNeedItemID) + nHaveBindCount
	if nHaveCount < nNeedItemNum then
		--快捷合成
		if 2 == nCurSelectedPage then
			x790075_NotifyMsg( sceneId, selfId, ScriptGlobal_Format("#{HBZHC_210923_32}", 
				tostring(nNeedItemNum),tostring(nTargetLevel)) )
		else
		--非快捷合成
			x790075_NotifyMsg( sceneId, selfId, ScriptGlobal_Format("#{HBZHC_210923_23}", 
				tostring(nNeedItemLevel),tostring(nNeedItemLevel),tostring(nTargetLevel)) )
		end
		return
	end
	--检查背包内数量的绑定性
	local nHaveBindMat = 0
	if nHaveBindCount > 0 and nHaveBindCount < nNeedItemNum then
		--这种会出现绑定与非绑定混合，要做提示
		if bComfirmed ~= 1 then
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,targetId);
				UICommand_AddInt( sceneId,nCurSelectedPage)
				UICommand_AddInt( sceneId,nCurSelectedIndex)
			--快捷合成
			if 2 == nCurSelectedPage then
				UICommand_AddString( sceneId, ScriptGlobal_Format("#{HBZHC_210923_33}", tostring(nTargetLevel)) )
			else
			--非快捷合成
				UICommand_AddString( sceneId, ScriptGlobal_Format("#{HBZHC_210923_28}", tostring(nNeedItemLevel),tostring(nTargetLevel)) )
			end
			EndUICommand(sceneId )
			DispatchUICommand(sceneId,selfId, 79007502)
			return
		end
		
		nHaveBindMat = 1
		--扣除所有绑定魂冰珠
		LuaFnDelAvailableItem(sceneId,selfId,nNeedBindItemID,nHaveBindCount)
		--扣除余下的非绑定
		LuaFnDelAvailableItem(sceneId,selfId,nNeedItemID,nNeedItemNum - nHaveBindCount)
	elseif nHaveBindCount > 0 and nHaveBindCount >= nNeedItemNum then
		nHaveBindMat = 1
		--扣除所有绑定魂冰珠
		LuaFnDelAvailableItem(sceneId,selfId,nNeedBindItemID,nNeedItemNum)
	else
		--扣除非绑定
		LuaFnDelAvailableItem(sceneId,selfId,nNeedItemID,nNeedItemNum)
	end
	--扣钱
	LuaFnCostMoneyWithPriority( sceneId, selfId, nNeedMoney);
	--发放合成产物
	if nHaveBindMat == 1 then
		LuaFnTryRecieveSingleItem(sceneId,selfId,x790075_g_tableHunBingBindItemID[nTargetLevel],1,0)
		x790075_NotifyMsg( sceneId, selfId, ScriptGlobal_Format("#{HBZHC_210923_27}", tostring(nTargetLevel)) )
	else
		LuaFnTryRecieveSingleItem(sceneId,selfId,x790075_g_tableHunBingItemID[nTargetLevel],1,0)
		x790075_NotifyMsg( sceneId, selfId, ScriptGlobal_Format("#{HBZHC_210923_26}", tostring(nTargetLevel)) )
	end
	--给效果显示
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
end

--**********************************
--信息提示
--**********************************
function x790075_NotifyMsg( sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId,msg)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
