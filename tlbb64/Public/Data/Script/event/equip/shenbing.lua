--七情刃相关
--脚本号
x888812_g_ScriptId = 888812

x888812_g_LimitLevel = 65
x888812_g_Max_ShenBingLevel = 50

--分解的有关配置
x888812_g_MeltNeed_Mondy = 50000
x888812_g_MeltToItem = {	
	[4] = {id = 38002944, count = 2},
	[5] = {id = 38002945, count = 2},
	[6] = {id = 38002945, count = 5},
}

x888812_g_TransNeed_Mondy = 100000
--**********************************
--七情刃转移
--**********************************
function x888812_ShenBingTransition( sceneId, selfId, targetId,nSourcePos,nTargetPos )
	if sceneId ~= SCENE_DALI then
		x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_47}" )
		return
	end
	if IsInDist( sceneId, selfId, targetId, 6 ) ~= 1 then
		x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_141}" )
		return
	end
	if GetLevel(sceneId,selfId) < x888812_g_LimitLevel then
		x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_140}" )
		return
	end
	--需要二级密码
	if LuaFnIsPasswordSetup( sceneId, selfId, 0 ) == 1 then
		if LuaFnIsPasswordUnlocked( sceneId, selfId, 1 ) == 0 then
			return
		end
	end
	if LuaFnIsBagItemShenBing(sceneId,selfId,nSourcePos) ~= 1 then
		x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_142}" )
		return
	end
	if LuaFnIsBagItemShenBing(sceneId,selfId,nTargetPos) ~= 1 then
		x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_143}" )
		return
	end
	--检测注情等级及技能等级
	local sb_level = LuaFnGetBagShenBingData(sceneId,selfId,nSourcePos, "LEVEL")
	local bLevelUpSkill = LuaFnGetBagShenBingData(sceneId,selfId,nSourcePos, "IS_LEVELUPSKILL")
	if sb_level <= 1 and bLevelUpSkill ~= 1 then
		x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_144}" )
		return
	end
	--检测钱够不够
	local nMoneySelf = GetMoneyJZ(sceneId,selfId) + GetMoney(sceneId,selfId)
	if nMoneySelf < x888812_g_TransNeed_Mondy then
		x888812_NotifyTip(sceneId,selfId,"#{SBFW_20230707_145}");
		return
	end
	--扣钱
	LuaFnCostMoneyWithPriority(sceneId, selfId, x888812_g_TransNeed_Mondy)
	--转移
	LuaFnShenBingTransition(sceneId,selfId,nSourcePos,nTargetPos)
	x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_147}" )
	--给特效
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
end
--**********************************
--七情刃分解
--**********************************
function x888812_ShenBingMelt( sceneId, selfId, targetId,nPos )
	if sceneId ~= SCENE_DALI then
		x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_47}" )
		return
	end
	if IsInDist( sceneId, selfId, targetId, 6 ) ~= 1 then
		x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_48}" )
		return
	end
	if GetLevel(sceneId,selfId) < x888812_g_LimitLevel then
		x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_276}" )
		return
	end
	--需要二级密码
	if LuaFnIsPasswordSetup( sceneId, selfId, 0 ) == 1 then
		if LuaFnIsPasswordUnlocked( sceneId, selfId, 1 ) == 0 then
			return
		end
	end
	if LuaFnIsBagItemShenBing(sceneId,selfId,nPos) ~= 1 then
		x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_49}" )
		return
	end
	--检测钱够不够
	local nMoneySelf = GetMoneyJZ(sceneId,selfId) + GetMoney(sceneId,selfId)
	if nMoneySelf < x888812_g_MeltNeed_Mondy then
		x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_277}" )
		return
	end
	--检测能否分解
	local sb_level = LuaFnGetBagShenBingData(sceneId,selfId,nPos, "LEVEL")
	if sb_level > 1 then
		x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_295}" )
		return
	end
	--检测技能等级
	local bLevelUpSkill = LuaFnGetBagShenBingData(sceneId,selfId,nPos, "IS_LEVELUPSKILL")
	if bLevelUpSkill == 1 then
		x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_295}" )
		return
	end
	--镶嵌宝石数量和强化等级
	local strongLevel = LuaFnGetEquipEnhanceLevel( sceneId, selfId, nPos)
	if strongLevel > 0 then
		x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_296}" )
		return
	end
	local GemNum = GetGemEmbededCount( sceneId, selfId, nPos )
	if GemNum ~= 0 then
	    x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_296}" )
		return
	end
	--分解
	local sb_star = LuaFnGetBagShenBingData(sceneId,selfId,nPos, "STAR")
	if x888812_g_MeltToItem[sb_star] == nil then
		x888812_NotifyTip( sceneId, selfId, "哦豁，错误了哦 x888812_ShenBingMelt" )
		return
	end
	BeginAddItem(sceneId)
	AddItem( sceneId, x888812_g_MeltToItem[sb_star].id, x888812_g_MeltToItem[sb_star] .count )
	if EndAddItem(sceneId,selfId)<=0  then
		return
	end
	AddItemListToHuman(sceneId,selfId)
	--扣除
	LuaFnEraseItem( sceneId, selfId, nPos )
	--扣钱
	LuaFnCostMoneyWithPriority(sceneId, selfId, need_money)
	x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_279}" )
	--给特效
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
end
--**********************************
--七情刃融魂等级提升
--**********************************
function x888812_ShenBingLevelUp( sceneId, selfId, targetId,nPos )
	if sceneId ~= SCENE_DALI then
		x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_47}" )
		return
	end
	if IsInDist( sceneId, selfId, targetId, 6 ) ~= 1 then
		x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_48}" )
		return
	end
	if GetLevel(sceneId,selfId) < x888812_g_LimitLevel then
		x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_46}" )
		return
	end
	--需要二级密码
	if LuaFnIsPasswordSetup( sceneId, selfId, 0 ) == 1 then
		if LuaFnIsPasswordUnlocked( sceneId, selfId, 1 ) == 0 then
			return
		end
	end
	if LuaFnIsBagItemShenBing(sceneId,selfId,nPos) ~= 1 then
		x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_49}" )
		return
	end
	local sb_level = LuaFnGetBagShenBingData(sceneId,selfId,nPos, "LEVEL")
	if sb_level >= x888812_g_Max_ShenBingLevel then
		x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_50}" )
		return
	end
	--材料检测
	local need_item, need_item_count, need_money = LuaFnGetShenBingLevelUpInfo(sb_level)	
	if need_item <= 0 then
		x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_50}" )
		return
	end
	if LuaFnGetAvailableItemCount(sceneId, selfId, need_item) < need_item_count then
		x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_51}" )
		return
	end
	--检测钱够不够
	local nMoneySelf = GetMoneyJZ(sceneId,selfId) + GetMoney(sceneId,selfId)
	if nMoneySelf < need_money then
		x888812_NotifyTip(sceneId,selfId,ScriptGlobal_Format("#{SBFW_20230707_52}",need_money));
		return
	end
	--扣钱
	LuaFnCostMoneyWithPriority(sceneId, selfId, need_money)
	LuaFnMtl_CostMaterial(sceneId,selfId,need_item_count,need_item)
	--升级
	LuaFnShenBingLevelUp(sceneId,selfId,nPos)
	x888812_NotifyTip( sceneId, selfId, "#{SBFW_20230707_53}" )
	--给特效
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
end
--**********************************
--醒目提示
--**********************************
function x888812_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
