--七情刃 技能相关

--脚本号
x888815_g_ScriptId = 888815
x888815_g_LimitLevel = 65
x888815_g_UnlockNeed_Mondy = 200000

--**********************************
--技能解锁
--**********************************
function x888815_ShenBingUnlockSkill( sceneId, selfId, targetId,nPos,nSelect )
	if sceneId ~= SCENE_DALI then
		x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_47}" )
		return
	end
	if IsInDist( sceneId, selfId, targetId, 6 ) ~= 1 then
		x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_141}" )
		return
	end
	if GetLevel(sceneId,selfId) < x888815_g_LimitLevel then
		x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_157}" )
		return
	end
	--需要二级密码
	if LuaFnIsPasswordSetup( sceneId, selfId, 0 ) == 1 then
		if LuaFnIsPasswordUnlocked( sceneId, selfId, 1 ) == 0 then
			return
		end
	end
	if LuaFnIsBagItemShenBing(sceneId,selfId,nPos) ~= 1 then
		x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_138}" )
		return
	end
	local skill_active_1 = LuaFnGetBagShenBingData(sceneId,selfId,nPos, "SKILL_LOCK", 0)
	local skill_active_2 = LuaFnGetBagShenBingData(sceneId,selfId,nPos, "SKILL_LOCK", 1)
	local skill_active_3 = LuaFnGetBagShenBingData(sceneId,selfId,nPos, "SKILL_LOCK", 2)
			
	if skill_active_1 == 1 and skill_active_2 == 1 and skill_active_3 == 1 then
		x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_156}" )
		return
	end
	--要求选择未解锁的槽位
	if nSelect < 0 or nSelect > 2 then
		x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_158}" )
		return
	end
	local skill_active = LuaFnGetBagShenBingData(sceneId,selfId,nPos, "SKILL_LOCK", nSelect)
	if skill_active == 1 then
		x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_158}" )
		return
	end
	--检测注情等级是否足够
	local sb_level = LuaFnGetBagShenBingData(sceneId,selfId,nPos, "LEVEL")
	if (nSelect == 0 and sb_level < 5) or (nSelect == 1 and sb_level < 10) or (nSelect == 2 and sb_level < 15) then
		x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_159}" )
		return
	end
	--检测用于解锁的物品
	local need_item = LuaFnGetShenBingLimitSkillActiveNeed(sceneId,selfId,nPos, nSelect)
	if need_item <= 0 then
		return
	end
	--材料检测
	if LuaFnGetAvailableItemCount(sceneId, selfId, need_item) < 1 then
		x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_267}" )
		return
	end
	--检测钱够不够
	local nMoneySelf = GetMoneyJZ(sceneId,selfId) + GetMoney(sceneId,selfId)
	if nMoneySelf < x888815_g_UnlockNeed_Mondy then
		x888815_NotifyTip(sceneId,selfId,"#{SBFW_20230707_277}");
		return
	end
	--扣钱
	LuaFnCostMoneyWithPriority(sceneId, selfId, x888815_g_UnlockNeed_Mondy)
	LuaFnMtl_CostMaterial(sceneId,selfId,1,need_item)
	
	--解锁技能
	LuaFnShenBingUnLockSkill(sceneId,selfId,nPos,nSelect)
	
	x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_160}" )
	--给特效
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
end

--**********************************
--技能升级
--**********************************
function x888815_ShenBingSkillUp( sceneId, selfId, targetId,nPos,nSelect )
	if sceneId ~= SCENE_DALI then
		x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_47}" )
		return
	end
	if IsInDist( sceneId, selfId, targetId, 6 ) ~= 1 then
		x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_141}" )
		return
	end
	if GetLevel(sceneId,selfId) < x888815_g_LimitLevel then
		x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_173}" )
		return
	end
	--需要二级密码
	if LuaFnIsPasswordSetup( sceneId, selfId, 0 ) == 1 then
		if LuaFnIsPasswordUnlocked( sceneId, selfId, 1 ) == 0 then
			return
		end
	end
	if LuaFnIsBagItemShenBing(sceneId,selfId,nPos) ~= 1 then
		x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_138}" )
		return
	end
	if nSelect < 1 or nSelect > 5 then
		x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_169}" )
		return
	end
	local skill_id = -1	
	if nSelect == 1 then
		local sb_skill, _ = LuaFnGetBagShenBingData(sceneId,selfId,nPos, "COMMONSKILL")
		skill_id = sb_skill
	elseif nSelect == 2 then
		local _, sb_skill = LuaFnGetBagShenBingData(sceneId,selfId,nPos, "COMMONSKILL")
		skill_id = sb_skill
	elseif nSelect >= 3 and nSelect <= 5 then
		skill_id = LuaFnGetBagShenBingData(sceneId,selfId,nPos, "LIMITSKILL", nSelect - 3)
		--检测技能是否解锁了
		local skill_active = LuaFnGetBagShenBingData(sceneId,selfId,nPos, "SKILL_LOCK", nSelect - 3)
		if skill_active ~= 1 then
			x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_170}" )
			return
		end
	end
	local sb_skill_level, new_id, need_item, need_item_count, need_money = LuaFnGetShenBingSkillUpInfo(skill_id)
	if sb_skill_level == nil or sb_skill_level < 0 then
		return
	end
	if sb_skill_level == 10 then
		x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_171}" )
		return
	end
	--材料检测
	if LuaFnGetAvailableItemCount(sceneId, selfId, need_item) < need_item_count then
		x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_267}" )
		return
	end
	--检测钱够不够
	local nMoneySelf = GetMoneyJZ(sceneId,selfId) + GetMoney(sceneId,selfId)
	if nMoneySelf < need_money then
		x888815_NotifyTip(sceneId,selfId,"#{SBFW_20230707_277}");
		return
	end
	--扣钱
	LuaFnCostMoneyWithPriority(sceneId, selfId, need_money)
	LuaFnMtl_CostMaterial(sceneId,selfId,need_item_count,need_item)
	--技能升级
	LuaFnShenBingUpdateSkill(sceneId,selfId,nPos,nSelect,new_id)
	
	x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_174}" )
	--给特效
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
end
--**********************************
--选择技能
--**********************************
function x888815_ShenBingSelectSkill( sceneId, selfId, targetId,nPos,nSelectA,nSelectB )
	if sceneId ~= SCENE_DALI then
		x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_47}" )
		return
	end
	if IsInDist( sceneId, selfId, targetId, 6 ) ~= 1 then
		x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_48}" )
		return
	end
	if GetLevel(sceneId,selfId) < x888815_g_LimitLevel then
		x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_150}" )
		return
	end
	--需要二级密码
	if LuaFnIsPasswordSetup( sceneId, selfId, 0 ) == 1 then
		if LuaFnIsPasswordUnlocked( sceneId, selfId, 1 ) == 0 then
			return
		end
	end
	if LuaFnIsBagItemShenBing(sceneId,selfId,nPos) ~= 1 then
		x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_151}" )
		return
	end
	local sb_skill_1, sb_skill_2 = LuaFnGetBagShenBingData(sceneId,selfId,nPos,  "COMMONSKILL")
	--从数据池获取神兵的同组技能数据
	local pool_skill_1 = LuaFnGetShenBingCustomSkillFromPool(sceneId,selfId,nPos, 0,nSelectA)
	local pool_skill_2 = LuaFnGetShenBingCustomSkillFromPool(sceneId,selfId,nPos, 1, nSelectB)
	if pool_skill_1 <= 0 or pool_skill_2 <= 0 then
		x888815_NotifyTip( sceneId, selfId, "哦豁，错误了哦 x888815_ShenBingSelectSkill" )
		return
	end
	if pool_skill_1 == sb_skill_1 and sb_skill_2 == pool_skill_2 then
		x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_152}" )
		return
	end
	--改变七情功法
	LuaFnShenBingUpdateSkill(sceneId,selfId,nPos,1,pool_skill_1)
	LuaFnShenBingUpdateSkill(sceneId,selfId,nPos,2,pool_skill_2)
	
	x888815_NotifyTip( sceneId, selfId, "#{SBFW_20230707_153}" )
	--给特效
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
end
--**********************************
--醒目提示
--**********************************
function x888815_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
