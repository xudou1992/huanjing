--门派转换-阿紫

--脚本号
x002115_g_ScriptId = 002115
--转换宝典
x002115_g_ModifyMenpaibookID = 38002427 

x002115_g_MainNPCName = "阿紫"
x002115_g_ItemYiGuDan = {38002426,38002428} --移骨丹
--规则列表
x002115_g_switchMPList = {
  [MP_SHAOLIN] = {MP_WUDANG, MP_EMEI, MP_DALI},
  [MP_MINGJIAO] = {MP_GAIBANG, MP_DALI, MP_XIAOYAO},
  [MP_GAIBANG] = {MP_MINGJIAO, MP_XINGSU, MP_DALI, MP_XIAOYAO},
  [MP_WUDANG] = {MP_SHAOLIN, MP_EMEI, MP_DALI, MP_TIANSHAN},
  [MP_EMEI] = {MP_SHAOLIN, MP_WUDANG, MP_DALI, MP_TIANSHAN},
  [MP_XINGSU] = {MP_GAIBANG, MP_DALI, MP_XIAOYAO},
  [MP_DALI] = {MP_SHAOLIN, MP_MINGJIAO, MP_GAIBANG, MP_WUDANG, MP_EMEI, MP_XINGSU, MP_TIANSHAN, MP_XIAOYAO},
  [MP_TIANSHAN] = {MP_WUDANG, MP_EMEI, MP_DALI},
  [MP_XIAOYAO] = {MP_MINGJIAO, MP_GAIBANG, MP_XINGSU, MP_DALI},
  [MP_MANTUO] = {MP_SHAOLIN, MP_GAIBANG, MP_WUDANG, MP_EMEI, MP_XINGSU, MP_DALI, MP_XIAOYAO},
}
--门派名称
x002115_g_MenPaiName = {
	"#{MPZH_180719_07}",
	"#{MPZH_180719_08}",
	"#{MPZH_180719_09}",
	"#{MPZH_180719_10}",
	"#{MPZH_180719_11}",
	"#{MPZH_180719_12}",
	"#{MPZH_180719_13}",
	"#{MPZH_180719_14}",
	"#{MPZH_180719_15}",
	"NULL",
	"#{MPZH_180719_16}"
}
--门派主属性
x002115_g_MenPaiMainAttr = {
	"#{MPZH_180719_30}",	--玄
	"#{MPZH_180719_29}",	--火
	"#{MPZH_180719_31}#{MPZH_180719_32}#{MPZH_180719_29}",	--毒 火
	"#{MPZH_180719_30}#{MPZH_180719_32}#{MPZH_180719_28}",	--玄 冰
	"#{MPZH_180719_28}#{MPZH_180719_32}#{MPZH_180719_30}",	--冰 玄
	"#{MPZH_180719_31}",
	"#{MPZH_180719_29}#{MPZH_180719_32}#{MPZH_180719_28}#{MPZH_180719_32}#{MPZH_180719_31}#{MPZH_180719_32}#{MPZH_180719_30}",
	"#{MPZH_180719_28}",
	"#{MPZH_180719_29}#{MPZH_180719_32}#{MPZH_180719_31}",	--火 毒
	"NULL",
	"#{MPZH_180719_30}"}
--转门派所需最低等级
x002115_g_MinLevel = 60
--门派生活技能对应关系
--必须按主技能在左，辅助技能在右的顺序放
x002115_g_Ability = {
  [MP_SHAOLIN] = {ABILITY_KAIGUANG, ABILITY_FOFA},
  [MP_MINGJIAO] = {ABILITY_SHENGHUOSHU, ABILITY_CAIHUOSHU},
  [MP_GAIBANG] = {ABILITY_NIANGJIU,ABILITY_LIANHUALUO},
  [MP_WUDANG] = {ABILITY_LIANDAN,ABILITY_DAOFA},
  [MP_EMEI] = {ABILITY_ZHIFU,ABILITY_LINGXINSHU},
  [MP_XINGSU] = {ABILITY_ZHIDU,ABILITY_YINCHONGSHU},
  [MP_DALI] = {ABILITY_ZHIGU,ABILITY_JINGMAIBAIJUE},
  [MP_TIANSHAN] = {ABILITY_XUANBINGSHU,ABILITY_CAIBINGSHU},
  [MP_XIAOYAO] = {ABILITY_QIMENDUNJIA,ABILITY_LIUYIFENGGU},
  [MP_MANTUO] = {ABILITY_SHIHUA,ABILITY_TIAOXIANG}
}
--武道任务表
x002115_g_TianFuYinDaoMission = {
	2021,2022,2023,2024,2025,2026,2027,2079,2080
}
--**********************************
--事件列表
--**********************************
function x002115_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText( sceneId, "#{MPZH_180719_01}" )
		AddNumText( sceneId, x002115_g_ScriptId, "#{MPZH_180719_02}", 6, 0 )
		--反悔
		local nCurrentTime = LuaFnGetCurrentTime()
		local nLastTime = GetMissionDataEx(sceneId,selfId,MDEX_LAST_MODIFYMENPAI_TIME);
		if nCurrentTime < nLastTime then
			local nMenPaiID = GetMissionDataEx(sceneId,selfId,MDEX_LAST_MODIFYMENPAI_OLDID);
			if nMenPaiID ~= GetMenPai(sceneId,selfId) and nMenPaiID ~= 9 then
				AddNumText( sceneId, x002115_g_ScriptId, "#{MPZH_180719_03}", 6, 3 )
			end
		end
		AddNumText( sceneId, x002115_g_ScriptId, "#{YDS_180907_01}", 6, 1 )
		AddNumText( sceneId, x002115_g_ScriptId, "#{MPZH_180719_04}", 11, 2 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--事件列表选中一项
--**********************************
function x002115_OnEventRequest( sceneId, selfId, targetId, eventId )
    local Operation = GetNumText()
	if Operation == 0 then
		if GetMenPai(sceneId,selfId) == 9 then
			x002115_NotifyTip( sceneId, selfId, "#{MPZH_180719_83}" )
			return
		end
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, 22)
			UICommand_AddInt( sceneId, GetMenPai(sceneId,selfId))
			UICommand_AddInt( sceneId, targetId)
		EndUICommand( sceneId )
		DispatchUICommand(sceneId,selfId, 2115)
	end
	--领取宝典
	if Operation == 1 then
		local nNum = LuaFnGetAvailableItemCount(sceneId, selfId,x002115_g_ModifyMenpaibookID)
		if nNum >= 1 then
			x002115_NotifyTip( sceneId, selfId, "#{YDS_180907_02}" )
			return
		end
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
			x002115_NotifyTip( sceneId, selfId, "#{YDS_180907_03}" )
			return
		end
		TryRecieveItem(sceneId,selfId,x002115_g_ModifyMenpaibookID,1)
		
		x002115_NotifyTip( sceneId, selfId, "#{YDS_180907_04}" )
		
		BeginEvent(sceneId)
			AddText( sceneId, "#{YDS_180907_27}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	if Operation == 2 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{MPZH_180719_104}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	if Operation == 3 then
		if IsPilferLockFlag(sceneId,selfId) <= 0 then
			SendOResultToPlayer(sceneId,selfId,OR_PILFER_LOCK_FLAG)
			return
		end
		--反悔
		local nCurrentTime = LuaFnGetCurrentTime()
		local nLastTime = GetMissionDataEx(sceneId,selfId,MDEX_LAST_MODIFYMENPAI_TIME);
		if nCurrentTime < nLastTime then
			--计算剩余的天数、小时
			nLastTime = nLastTime - nCurrentTime

			local nResidueDay = floor(nLastTime / (24 * 60 * 60));
			local nResidueHour = floor((nLastTime - (nResidueDay * 24 * 60 * 60)) / (60 * 60));
			
			local nOldMenPaiID = GetMissionDataEx(sceneId,selfId,MDEX_LAST_MODIFYMENPAI_OLDID);
			local nNotifyMsg = ScriptGlobal_Format("#{MPZH_180719_68}",x002115_g_MenPaiName[nOldMenPaiID + 1],x002115_g_MenPaiName[GetMenPai(sceneId,selfId) + 1],tostring(nResidueDay),tostring(nResidueHour));
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, 6)
				UICommand_AddInt( sceneId, targetId)
				UICommand_AddInt( sceneId, GetMenPai(sceneId,selfId))
				UICommand_AddString( sceneId, nNotifyMsg)
			EndUICommand( sceneId )
			DispatchUICommand(sceneId,selfId, 2115)
		end
		return
	end
end
--**********************************
--事件交互入口
--**********************************
function x002115_OnDefaultEvent( sceneId, selfId,targetId )
	x002115_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--死亡事件
--**********************************
function x002115_OnDie( sceneId, selfId, killerId )
end

--**********************************
-- 第一次返回确认
--**********************************
function x002115_OnRegretContinueSwitch(sceneId,selfId,targetId)
	--基本条件检查
	if x002115_CheckCanFogot( sceneId, selfId,targetId ) ~= 1 then
		return
	end
	local nOldMenPaiID = GetMissionDataEx(sceneId,selfId,MDEX_LAST_MODIFYMENPAI_OLDID);
	local nCurMenpaiName = x002115_g_MenPaiName[GetMenPai(sceneId,selfId) + 1]
	if nCurMenpaiName == nil then
		return
	end
	local nNewMenpaiName = x002115_g_MenPaiName[nOldMenPaiID + 1]
	if nNewMenpaiName == nil then
		return
	end
	local nNewMenpaiAttr = x002115_g_MenPaiMainAttr[nOldMenPaiID + 1]
	if nNewMenpaiAttr == nil then
		return
	end
	
	local nIceAttr = GetHumanAttr(sceneId, selfId, 3)
	local nFireAttr = GetHumanAttr(sceneId, selfId, 4)
	local nLightAttr = GetHumanAttr(sceneId, selfId, 5)
	local nPosionAttr = GetHumanAttr(sceneId, selfId, 6)
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, 8)
		UICommand_AddInt( sceneId, targetId)
		UICommand_AddInt( sceneId, GetMenPai(sceneId,selfId))
		UICommand_AddInt( sceneId, nOldMenPaiID)--newmenpai
		
		UICommand_AddInt( sceneId, nIceAttr)--ice
		UICommand_AddInt( sceneId, nFireAttr)--fire
		UICommand_AddInt( sceneId, nLightAttr)--light
		UICommand_AddInt( sceneId, nPosionAttr)--posion
		
		UICommand_AddString( sceneId, ScriptGlobal_Format("#{MPZH_180719_121}",nCurMenpaiName,nNewMenpaiName))--bot str
		UICommand_AddString( sceneId, ScriptGlobal_Format("#{MPZH_180719_122}",nNewMenpaiAttr))--img str
	EndUICommand( sceneId )
	DispatchUICommand(sceneId,selfId, 2115)
end

--**********************************
-- 反悔门派最终确认
--**********************************
function x002115_OnFinalConfirmRegret(sceneId,selfId,targetId,nMenPaiID)
	--基本条件检查
	if x002115_CheckCanFogot( sceneId, selfId,targetId ) ~= 1 then
		return
	end
	local nOldMenPaiID = GetMissionDataEx(sceneId,selfId,MDEX_LAST_MODIFYMENPAI_OLDID);
	local nNewMenpaiName = x002115_g_MenPaiName[nOldMenPaiID + 1]
	if nNewMenpaiName == nil then
		return
	end
	--保存旧门派编号
	local nNowMenPai = GetMenPai(sceneId,selfId)
	local nMenPaiID = GetMissionDataEx(sceneId,selfId,MDEX_LAST_MODIFYMENPAI_OLDID);
	--设置旧门派为9，用于区分是否返回过
	SetMissionDataEx(sceneId,selfId,MDEX_LAST_MODIFYMENPAI_OLDID,9)
	--转换门派
	LuaFnModifyMenPaiToNew(sceneId,selfId,nMenPaiID)
	--替换当前的生活技能
	LuaFnInheritHumanAbility(sceneId,selfId,x002115_g_Ability[nNowMenPai][1],x002115_g_Ability[nMenPaiID][1])
	LuaFnInheritHumanAbility(sceneId,selfId,x002115_g_Ability[nNowMenPai][2],x002115_g_Ability[nMenPaiID][2])
	--武道重置
	CallScriptFunction( 292000, "ChangeMenPai", sceneId, selfId,nNowMenPai,nMenPaiID )
	--中心提示
	x002115_NotifyTip( sceneId, selfId, ScriptGlobal_Format("#{MPZH_180719_73}",nNewMenpaiName) )	
	--转换完后有提示
	BeginEvent(sceneId)
		AddText( sceneId,ScriptGlobal_Format("#{MPZH_180719_74}",nNewMenpaiName)  )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- 转换门派最终确认
--**********************************
function x002115_OnFinalConfirmSwitch(sceneId,selfId,targetId,nMenPaiID)
	--可操作性条件检测
	if x002115_CheckCanSwitch( sceneId, selfId,targetId,nMenPaiID ) == 0 then
		return
	end
	local nNewMenpaiName = x002115_g_MenPaiName[nMenPaiID + 1]
	if nNewMenpaiName == nil then
		return
	end
	--保存旧门派编号
	local nNowMenPai = GetMenPai(sceneId,selfId)
	SetMissionDataEx(sceneId,selfId,MDEX_LAST_MODIFYMENPAI_OLDID,nNowMenPai)
	--设置可再次操作时间为7天后
	local nCurrentTime = LuaFnGetCurrentTime()
	SetMissionDataEx(sceneId,selfId,MDEX_LAST_MODIFYMENPAI_TIME,nCurrentTime );--+ 7 * 24 * 60 * 60);
	--扣除移骨丹
	local nRet = LuaFnMtl_CostMaterial(sceneId,selfId,1,x002115_g_ItemYiGuDan[1],x002115_g_ItemYiGuDan[2])
	if nRet ~= 1 then
		return
	end
	--转换门派
	LuaFnModifyMenPaiToNew(sceneId,selfId,nMenPaiID)
	--替换当前的生活技能
	LuaFnInheritHumanAbility(sceneId,selfId,x002115_g_Ability[nNowMenPai][1],x002115_g_Ability[nMenPaiID][1])
	LuaFnInheritHumanAbility(sceneId,selfId,x002115_g_Ability[nNowMenPai][2],x002115_g_Ability[nMenPaiID][2])
	--武道重置
	CallScriptFunction( 292000, "ChangeMenPai", sceneId, selfId,nNowMenPai,nMenPaiID )
	--邮件提示
	LuaFnSendSystemMail( sceneId, GetName( sceneId, selfId ), ScriptGlobal_Format("#{MPZH_180719_61}",nNewMenpaiName) )
	--中心提示
	x002115_NotifyTip( sceneId, selfId, ScriptGlobal_Format("#{MPZH_180719_59}",nNewMenpaiName) )	
	--转换完后有提示
	BeginEvent(sceneId)
		AddText( sceneId,ScriptGlobal_Format("#{MPZH_180719_155}",nNewMenpaiName)  )
		AddNumText( sceneId, x002115_g_ScriptId, "#{MPZH_180719_150}", 6,1 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
-- 第一次转换确认
--**********************************
function x002115_OnConfirmSwitch(sceneId,selfId,targetId,nMenPaiID)
	--安全时间
	if IsPilferLockFlag(sceneId,selfId) <= 0 then
		SendOResultToPlayer(sceneId,selfId,OR_PILFER_LOCK_FLAG)
		return
	end
	if GetName(sceneId,targetId) ~= x002115_g_MainNPCName then
		return
	end
	if sceneId ~= SCENE_DALI then
		x002115_NotifyTip( sceneId, selfId, "#{MPZH_180719_21}" )
		return
	end
	local nCurMenpaiName = x002115_g_MenPaiName[GetMenPai(sceneId,selfId) + 1]
	if nCurMenpaiName == nil then
		return
	end
	local nNewMenpaiName = x002115_g_MenPaiName[nMenPaiID + 1]
	if nNewMenpaiName == nil then
		return
	end
	local nNewMenpaiAttr = x002115_g_MenPaiMainAttr[nMenPaiID + 1]
	if nNewMenpaiAttr == nil then
		return
	end
	
	local nIceAttr = GetHumanAttr(sceneId, selfId, 3)
	local nFireAttr = GetHumanAttr(sceneId, selfId, 4)
	local nLightAttr = GetHumanAttr(sceneId, selfId, 5)
	local nPosionAttr = GetHumanAttr(sceneId, selfId, 6)
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, 77)
		UICommand_AddInt( sceneId, targetId)
		UICommand_AddInt( sceneId, GetMenPai(sceneId,selfId))
		UICommand_AddInt( sceneId, nMenPaiID)--newmenpai
		
		UICommand_AddInt( sceneId, nIceAttr)--ice
		UICommand_AddInt( sceneId, nFireAttr)--fire
		UICommand_AddInt( sceneId, nLightAttr)--light
		UICommand_AddInt( sceneId, nPosionAttr)--posion
		
		UICommand_AddString( sceneId, ScriptGlobal_Format("#{MPZH_180719_121}",nCurMenpaiName,nNewMenpaiName))--bot str
		UICommand_AddString( sceneId, ScriptGlobal_Format("#{MPZH_180719_122}",nNewMenpaiAttr))--img str
	EndUICommand( sceneId )
	DispatchUICommand(sceneId,selfId, 2115)
end
--**********************************
-- 门派转换提交
--**********************************
function x002115_OnContinueCheck(sceneId,selfId,targetId,nMenPaiID)
	--可操作性条件检测
	if x002115_CheckCanSwitch( sceneId, selfId,targetId,nMenPaiID ) == 0 then
		return
	end
	--客户端提醒-第一次确认
	local nNewMenpaiName = x002115_g_MenPaiName[nMenPaiID + 1]
	if nNewMenpaiName == nil then
		return
	end
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, 44)
		UICommand_AddInt( sceneId, targetId)
		UICommand_AddInt( sceneId, nMenPaiID)
		UICommand_AddString( sceneId,"#{MPZH_180719_120}")
	EndUICommand( sceneId )
	DispatchUICommand(sceneId,selfId, 2115)
end
--**********************************
-- 可反悔操作性条件检测
--**********************************
function x002115_CheckCanFogot( sceneId, selfId,targetId )
	--安全时间
	if IsPilferLockFlag(sceneId,selfId) <= 0 then
		SendOResultToPlayer(sceneId,selfId,OR_PILFER_LOCK_FLAG)
		return 0
	end
	if GetName(sceneId,targetId) ~= x002115_g_MainNPCName then
		return 0
	end
	if sceneId ~= SCENE_DALI then
		x002115_NotifyTip( sceneId, selfId, "#{MPZH_180719_21}" )
		return 0
	end
	
	local bCanOp = 0
	local nCurrentTime = LuaFnGetCurrentTime()
	local nLastTime = GetMissionDataEx(sceneId,selfId,MDEX_LAST_MODIFYMENPAI_TIME);
	local nOldMenPaiID = GetMissionDataEx(sceneId,selfId,MDEX_LAST_MODIFYMENPAI_OLDID);
	if nCurrentTime < nLastTime then
		if nOldMenPaiID ~= GetMenPai(sceneId,selfId) and nOldMenPaiID ~= 9 then
			bCanOp = 1
		end
	end
	if bCanOp == 0 then
		return 0;
	end
	local nCurMenpaiName = x002115_g_MenPaiName[GetMenPai(sceneId,selfId) + 1]
	if nCurMenpaiName == nil then
		return 0
	end
	local nNewMenpaiName = x002115_g_MenPaiName[nOldMenPaiID + 1]
	if nNewMenpaiName == nil then
		return 0
	end
	local nNewMenpaiAttr = x002115_g_MenPaiMainAttr[nOldMenPaiID + 1]
	if nNewMenpaiAttr == nil then
		return 0
	end
	--等级
	if GetLevel(sceneId,selfId) < x002115_g_MinLevel then
		x002115_NotifyTip( sceneId, selfId, "#{MPZH_180719_38}" )
		return 0
	end
	--师门任务检测
	local nMenPai = GetMenPai(sceneId,selfId)
	if nMenPai == nil or  nMenPai == -1 or nMenPai == 9 then
		x002115_NotifyTip( sceneId, selfId, "#{MPZH_180719_83}" )
		return 0
	end
	for i, v in MENPAI_SHIMEN_MISID do
		if v ~= -1 and IsHaveMission(sceneId,selfId,v) > 0 then
			x002115_NotifyTip( sceneId, selfId, "#{MPZH_180719_46}" )
			return 0
		end
	end
	--其他任务检测
	--检测队伍
	if LuaFnHasTeam(sceneId,selfId) == 1 then
		x002115_NotifyTip( sceneId, selfId, "#{MPZH_180719_85}" )
		return 0
	end
	--检测乘骑
	if LuaFnIsModelOrMount( sceneId, selfId ) == 1 then --是不是变身
		x002115_NotifyTip( sceneId, selfId, "#{MPZH_180719_87}" )
		return 0
	end
	--是否有武道修炼任务
	if CallScriptFunction( 891272, "HaveXiuLianMission", sceneId, selfId ) == 1 then
		x002115_NotifyTip( sceneId, selfId, "#{MPZH_180719_149}" )
		return 0
	end
	--是否有武道任务
	for i = 1,getn(x002115_g_TianFuYinDaoMission) do
		if IsHaveMission(sceneId,selfId,x002115_g_TianFuYinDaoMission[i]) > 0 then
			x002115_NotifyTip( sceneId, selfId, "#{MPZH_180719_152}" )
			return 0
		end
	end

	return 1
end
--**********************************
-- 可操作性条件检测
--**********************************
function x002115_CheckCanSwitch( sceneId, selfId,targetId,nMenPaiID )
	--安全时间
	if IsPilferLockFlag(sceneId,selfId) <= 0 then
		SendOResultToPlayer(sceneId,selfId,OR_PILFER_LOCK_FLAG)
		return 0
	end
	if targetId == nil or nMenPaiID == nil then
		return 0
	end
	if sceneId ~= SCENE_DALI then
		x002115_NotifyTip( sceneId, selfId, "#{MPZH_180719_21}" )
		return 0
	end
	if GetName(sceneId,targetId) ~= x002115_g_MainNPCName then
		return 0
	end
	--时间检测
	local nCurrentTime = LuaFnGetCurrentTime()
	local nLastTime = GetMissionDataEx(sceneId,selfId,MDEX_LAST_MODIFYMENPAI_TIME);
	if nCurrentTime < nLastTime then
		x002115_NotifyTip( sceneId, selfId, "#{MPZH_180719_36}" )
		return 0
	end
	--等级
	if GetLevel(sceneId,selfId) < x002115_g_MinLevel then
		x002115_NotifyTip( sceneId, selfId, "#{MPZH_180719_38}" )
		return 0
	end
	--最高历史评分
	
	--师门任务检测
	local nMenPai = GetMenPai(sceneId,selfId)
	if nMenPai == nil or  nMenPai == -1 or nMenPai == 9 then
		x002115_NotifyTip( sceneId, selfId, "#{MPZH_180719_83}" )
		return 0
	end
	for i, v in MENPAI_SHIMEN_MISID do
		if v ~= -1 and IsHaveMission(sceneId,selfId,v) > 0 then
			x002115_NotifyTip( sceneId, selfId, "#{MPZH_180719_46}" )
			return 0
		end
	end
	--其他任务检测
	--检测队伍
	if LuaFnHasTeam(sceneId,selfId) == 1 then
		x002115_NotifyTip( sceneId, selfId, "#{MPZH_180719_85}" )
		return 0
	end
	--检测乘骑
	if LuaFnIsModelOrMount( sceneId, selfId ) == 1 then --是不是变身
		x002115_NotifyTip( sceneId, selfId, "#{MPZH_180719_87}" )
		return 0
	end
	--检测移骨丹
	if LuaFnMtl_GetCostNum(sceneId,selfId,x002115_g_ItemYiGuDan[1],x002115_g_ItemYiGuDan[2]) < 1 then
		x002115_NotifyTip( sceneId, selfId, "#{MPZH_180719_99}" )
		return 0
	end
	--是否有武道修炼任务
	if CallScriptFunction( 891272, "HaveXiuLianMission", sceneId, selfId ) == 1 then
		x002115_NotifyTip( sceneId, selfId, "#{MPZH_180719_149}" )
		return 0
	end
	--是否有武道任务
	for i = 1,getn(x002115_g_TianFuYinDaoMission) do
		if IsHaveMission(sceneId,selfId,x002115_g_TianFuYinDaoMission[i]) > 0 then
			x002115_NotifyTip( sceneId, selfId, "#{MPZH_180719_152}" )
			return 0
		end
	end
	--新门派的合法性检测
	local nIsIllgial = 0;
	for i = 1,getn(x002115_g_switchMPList[nMenPai]) do
		if x002115_g_switchMPList[nMenPai][i] == nMenPaiID then
			nIsIllgial = 1;
			break;
		end
	end
	if nIsIllgial == 0 then
		x002115_NotifyTip( sceneId, selfId, "#{MPZH_180719_109}" )
		return 0
	end
	
	return 1
end
--**********************************
-- 屏幕中间信息提示
--**********************************
function x002115_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end