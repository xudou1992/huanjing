--*****************************************************************
-- Gm工具 全新改版 客户端取自师傅焚尽铅华 2022年9月25日 21:15:30 已突破场景限制发放物品，后续研发玩家下线发放。
--*****************************************************************
--"@game.sohu.com"
x999998_g_GMList = 
{
	    "祭道",
	   -- "嘉志",
         "123",
        -- "14",
        -- "15",
        -- "16",
		-- "17",
		-- "18",
		-- "19",
		-- "20",
		-- "21",
		-- "22",
		-- "23",
		-- "24",
		-- "25",
		-- "26",
	    -- "27",
		-- "28",
		-- "29",
		-- "30",
		-- "31",
		-- "31",
		-- "33",
		-- "34",
		-- "35",
		-- "36",
		-- "37",
		-- "38",
		-- "39",
		-- "40",
		-- "123123",
		-- "花间．ˋ ",


}
x999998_g_XinFaInfo = {
{1,2,3,4,5,6,55},
{7,8,9,10,11,12,56},
{13,14,15,16,17,18,57},
{19,20,21,22,23,24,58},
{25,26,27,28,29,30,59},
{31,32,33,34,35,36,60},
{37,38,39,40,41,42,61},
{43,44,45,46,47,48,62},
{49,50,51,52,53,54,63},
{0,0,0,0,0,0,0,0},
{64,65,66,67,68,69,70},
{81,82,83,84,85,86,87},
{64,65,66,67,68,69,70}, 
}
--**************************************
-- 回调测试1
--**************************************
function x999998_FjqhGmTool_ServerCallOne(sceneId,selfId)

end
--**************************************
-- 回调测试2
--**************************************
function x999998_FjqhGmTool_ServerCallTwo(sceneId,selfId)
end
--**************************************
-- 全局操作
--**************************************
function x999998_FjqhGmTool_AllUse(sceneId,selfId,nIndex,nPar1,nPar2,nPar3)
	if x999998_IsGM(sceneId,selfId) ~= 1 then
		x999998_tips(sceneId,selfId,"你不是管理员，无任何操作权限。")
		return
	end
	if nIndex == 1 then --创建怪物，全场景操作，直接给王超生成在身边。。
		if nPar1 < 0 or nPar1 > 55043 then
			x999998_tips(sceneId,selfId,"GM_TOOL-AllUse-Error_1!!!")
			return
		end
		if nPar2 < -1 then
			x999998_tips(sceneId,selfId,"GM_TOOL-AllUse-Error_2!!!")
			return
		end
		if nPar2 == -1 then
			nPar2 = sceneId;
		end
		local x,z = GetWorldPos(sceneId,selfId)
		LuaFnCreateMonster(nPar2,nPar1, x, z, 21, -1,nPar3)
	end
	if nIndex == 2 then
		if nPar1 < 0 or nPar1 > 55043 then
			x999998_tips(sceneId,selfId,"GM_TOOL-AllUse-Error_1!!!")
			return
		end
		if nPar2 < -1 then
			x999998_tips(sceneId,selfId,"GM_TOOL-AllUse-Error_2!!!")
			return
		end
		if nPar2 == -1 then
			nPar2 = sceneId;
		end
		local x,z = GetWorldPos(sceneId,selfId)
		LuaFnCreateMonster(nPar2,nPar1, x, z, 3, -1,nPar3)
	end
	if nIndex == 3 then
		if nPar1 < 0 or nPar1 > 55043 then
			x999998_tips(sceneId,selfId,"GM_TOOL-AllUse-Error_1!!!")
			return
		end
		local nMonsterNum = GetMonsterCount(sceneId)
		for i=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,i)
			if GetMonsterDataID(sceneId,nMonsterId) == nPar1 then
				LuaFnDeleteMonster(sceneId,nMonsterId)
			end
		end
	end
end
--**************************************
-- 个人操作
--**************************************
function x999998_FjqhGmTool_SelfUse(sceneId,selfId,nIndex,nPar1,nPar2,nPar3)
	if x999998_IsGM(sceneId,selfId) ~= 1 then
		x999998_tips(sceneId,selfId,"你不是管理员，无任何操作权限。")
		return
	end
	if sceneId < 0 or selfId < 14999 or selfId > 29999 then
		x999998_tips( sceneId,selfId,"GM_TOOL-SelfUse-Error_1!!!")
		return
	end
	if nIndex < 1 or nIndex > 44 then
		x999998_tips( sceneId,selfId,"GM_TOOL-SelfUse-Error_2!!!")
		return
	end
	local Logstr = ""
	local nowYear = GetTodayYear();
	local nowMonth = GetTodayMonth();
	nowMonth=nowMonth+1;
	local nowDate = GetTodayDate();
	local nHour	 = GetHour()
	local nMinute = GetMinute()
	local nName = GetName( sceneId, selfId )
	if nIndex == 1 then --刷物品
		if nPar1 < 10000000 or nPar1 > 59999999 then
			x999998_tips( sceneId,selfId,"输入的物品代码有误，建议使用GM工具物品搜索功能获取物品代码。")
			return
		end
		if nPar2 < 1 or nPar2 > 9999 then
			x999998_tips( sceneId,selfId,"物品数量不得小于1或者大于9999，防止出现BUG。")
			return
		end
		BeginAddItem(sceneId)
			AddItem(sceneId,nPar1,nPar2)
			if EndAddItem(sceneId,selfId) <= 0 then
				return
			end
		AddItemListToHuman(sceneId,selfId)
		Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，成功使用管理员权限领取了%d个%s。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,nPar2,GetItemName(sceneId,nPar1))
		x999998_GameLog(sceneId,selfId,1,Logstr)
		x999998_tips(sceneId,selfId,format("已获得%s个%s",tostring(nPar2),GetItemName(sceneId,nPar1)))
	end
	if nIndex == 2 then --设置称号
		if nPar1 < 0 or nPar1 > 2000 then
			x999998_tips( sceneId,selfId,"GM_TOOL-idx_2_Error_1!!!")
			return
		end
		local retCanAddTitle = LuaFnCanAddTitle( sceneId, selfId, nPar1 )
		if	retCanAddTitle == 0 then
			x999998_tips( sceneId,selfId,"当前已经拥有该称号了啊。")
			return
		end
		LuaFnAwardCharTitle( sceneId, selfId, nPar1 )
		LuaFnSetCurTitleById( sceneId, selfId, nPar1 )
		LuaFnDispatchAllTitle(sceneId, selfId)
		Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，成功使用管理员权限领取了称号ID为%d。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,nPar1)
		x999998_GameLog(sceneId,selfId,1,Logstr)

	end
	if nIndex == 3 then --清背包
		if nPar1 < 0 or nPar2 < nPar1 or nPar2 > 200 or nPar1 > nPar2 then
			x999998_tips( sceneId,selfId,"GM_TOOL-idx_3_Error_1!!!")
			return
		end
		if nPar1 == nPar2 then --等于的情况下只清理一个格子。
			LuaFnEraseItem(sceneId,selfId,nPar1)
			x999998_tips(sceneId,selfId,"清理完毕。")
			return
		end
		for i = nPar1,nPar2 do --不等于的情况下直接全清理。
			local nItemID = LuaFnGetItemTableIndexByIndex(sceneId,selfId,i)
			if nItemID > 0 then  --只有有物品的清理，没物品的不循环。
				LuaFnEraseItem(sceneId,selfId,i)
			end
		end
		x999998_tips(sceneId,selfId,"清理完毕。")
	end
	if nIndex == 4 then --领金币
		if nPar1 < 0 or nPar1 > 2000000000 then
			x999998_tips(sceneId,selfId,"领取数量不得小于0，或大于20万金。")
			return
		end
		local Money = GetMoney(sceneId,selfId)
		if Money + nPar1 > 2000000000 then
			x999998_tips(sceneId,selfId,"自身金币与领取金币相加已达上限，请减少领取数量。")
			return
		end
		AddMoney(sceneId,selfId,nPar1)
		Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，成功使用管理员权限领取了%d金。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,nPar1)
		x999998_GameLog(sceneId,selfId,1,Logstr)
	end
	if nIndex == 5 then --扣金币
		if nPar1 < 0 or nPar1 > 2000000000 then
			x999998_tips(sceneId,selfId,"GM_TOOL-idx_5_Error_1!!!")
			return
		end
		local Money = GetMoney(sceneId,selfId)
		if nPar1 > Money then
			AddMoney(sceneId,selfId,-Money) --扣剩余全部金币。
			return
		end
		AddMoney(sceneId,selfId,-nPar1) --只扣输入金币。
		Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，成功使用管理员权限扣除了%d金。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,nPar1)
		x999998_GameLog(sceneId,selfId,1,Logstr)
	end
	if nIndex == 6 then --领交子
		if nPar1 < 0 or nPar1 > 2000000000 then
			x999998_tips(sceneId,selfId,"领取数量不得小于0，或大于20万交子。")
			return
		end
		local MoneyJz = GetMoneyJZ(sceneId,selfId)
		if MoneyJz + nPar1 > 2000000000 then
			x999998_tips(sceneId,selfId,"自身交子与领取交子相加已达上限，请减少领取数量。")
			return
		end
		AddMoneyJZ(sceneId,selfId,nPar1)
		Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，成功使用管理员权限领取了%d交子。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,nPar1)
		x999998_GameLog(sceneId,selfId,1,Logstr)
		x999998_tips(sceneId,selfId,format("你获得了#{_EXCHG%s}。",nPar1))
	end
	if nIndex == 7 then --扣交子
		if nPar1 < 0 or nPar1 > 2000000000 then
			x999998_tips(sceneId,selfId,"GM_TOOL-idx_7_Error_1!!!")
			return
		end
		local MoneyJz = GetMoneyJZ(sceneId,selfId)
		if nPar1 > MoneyJz then
			LuaFnCostMoneyWithPriority(sceneId,selfId,MoneyJz)
			x999998_tips(sceneId,selfId,format("已扣除#{_EXCHG%s}。",MoneyJz))
			return
		end
		LuaFnCostMoneyWithPriority(sceneId,selfId,nPar1)
		Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，成功使用管理员权限扣除了%d交子。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,nPar1)
		x999998_GameLog(sceneId,selfId,1,Logstr)
		x999998_tips(sceneId,selfId,format("已扣除#{_EXCHG%s}。",nPar1))
	end
	if nIndex == 8 then   --领元宝
		if nPar1 < 0 or nPar1 > 2100000000 then
			x999998_tips(sceneId,selfId,"GM_TOOL-idx_8_Error_1!!!")
			return
		end
		local nYuanBao = YuanBao(sceneId,selfId,-1,3,0)
		if nYuanBao + nPar1 >= 2100000000 then
			x999998_tips(sceneId,selfId,"自身元宝与领取元宝相加已达上限，请减少领取数量。")
			return
		end
		YuanBao(sceneId,selfId,-1,1,nPar1)
		Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，成功使用管理员权限领取了%d点元宝。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,nPar1)
		x999998_GameLog(sceneId,selfId,1,Logstr)
		x999998_tips(sceneId,selfId,format("已获得%s点元宝。",nPar1))
	end
	if nIndex == 9 then --扣元宝
		if nPar1 < 0 or nPar1 > 2100000000 then
			x999998_tips(sceneId,selfId,"GM_TOOL-idx_9_Error_1!!!")
			return
		end
		local nYuanBao = YuanBao(sceneId,selfId,-1,3,0)
		if nPar1 > nYuanBao then
			YuanBao(sceneId,selfId,-1,2,nYuanBao)
			Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，成功使用管理员权限扣除了%d点元宝。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,nYuanBao)
			x999998_GameLog(sceneId,selfId,1,Logstr)
			x999998_tips(sceneId,selfId,format("已扣除%s点元宝。",nYuanBao))
			return
		end
		YuanBao(sceneId,selfId,-1,2,nPar1)
		Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，成功使用管理员权限扣除了%d点元宝。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,nPar1)
		x999998_GameLog(sceneId,selfId,1,Logstr)
		x999998_tips(sceneId,selfId,format("已扣除%s点元宝。",nPar1))
	end
	if nIndex == 10 then   --领绑定元宝
		if nPar1 < 0 or nPar1 > 2100000000 then
			x999998_tips(sceneId,selfId,"GM_TOOL-idx_10_Error_1!!!")
			return
		end
		local ZengDian = BindYuanBao(sceneId,selfId,-1,3,0)
		if ZengDian + nPar1 >= 2100000000 then
			x999998_tips(sceneId,selfId,"自身绑定元宝与领取绑定元宝相加已达上限，请减少领取数量。")
			return
		end
		BindYuanBao(sceneId,selfId,-1,1,nPar1)
		Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，成功使用管理员权限领取了%d点绑定元宝。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,nPar1)
		x999998_GameLog(sceneId,selfId,1,Logstr)
		x999998_tips(sceneId,selfId,format("已获得%s点绑定元宝。",nPar1))
	end
	if nIndex == 11 then --扣绑定元宝
		if nPar1 < 0 or nPar1 > 2100000000 then
			x999998_tips(sceneId,selfId,"GM_TOOL-idx_11_Error_1!!!")
			return
		end
		local ZengDian = BindYuanBao(sceneId,selfId,-1,3,0)
		if nPar1 > ZengDian then
			BindYuanBao(sceneId,selfId,-1,2,BindYuanBao)
			x999998_tips(sceneId,selfId,format("已扣除%s点绑定元宝。",ZengDian))
			Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，成功使用管理员权限扣除了%d点绑定元宝。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,BindYuanBao)
			x999998_GameLog(sceneId,selfId,1,Logstr)
			return
		end
		BindYuanBao(sceneId,selfId,-1,2,nPar1)
		Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，成功使用管理员权限扣除了%d点绑定元宝。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,nPar1)
		x999998_GameLog(sceneId,selfId,1,Logstr)
		x999998_tips(sceneId,selfId,format("已扣除%s点绑定元宝。",nPar1))
	end
	if nIndex == 12 then --加经验
		if nPar1 <= 0 then
			x999998_tips(sceneId,selfId,"填写经验数不得小于等于0。")
			return
		end
		local Exp = 0
		if nPar1 <= 700000 then
			Exp = AddExp(sceneId,selfId,nPar1)
			else
			Exp = floor(nPar1/700000)
			for i = 1,Exp do
				AddExp(sceneId,selfId,nPar1)
			end
		end
	end
	if nIndex == 13 then --扣经验
		if nPar1 <= 0 then
			x999998_tips(sceneId,selfId,"填写经验数不得小于等于0。")
			return
		end
		local nExp = GetExp(sceneId,selfId)
		if nExp <= 0 then
			x999998_tips(sceneId,selfId,"经验为0无需扣除。")
			return
		end
		if nPar1 > nExp then
			AddExp(sceneId,selfId,-nExp)
			x999998_tips(sceneId,selfId,"已将经验全部扣除。")
			return
		end
		AddExp(sceneId,selfId,-nPar1)
		x999998_tips(sceneId,selfId,format("已扣除%s点经验。",nPar1))
	end
	if nIndex == 14 then --设置个人等级
		local Level = GetLevel(sceneId,selfId)
		if nPar1 < 1 or nPar1 > 119 then
			x999998_tips(sceneId,selfId,"GM_TOOL-idx_14_Error_1!!!")
			return
		end
		if nPar1 <  Level then
			x999998_tips(sceneId,selfId,"你的等级大于你要设置的等级，无法变更。")
			return
		end
		LuaFnHumanLevelUpTo(sceneId,selfId,nPar1) --直接设置等级
		x999998_tips(sceneId,selfId,format("已将等级设置为%s级。",nPar1))
	end
	if nIndex == 15 then --加入门派
		if nPar1 < 0 or nPar1 > 11 then
			x999998_tips(sceneId,selfId,"暂未开放十大门派以外的门派，请重新输入。")
			return
		end
		local nMenPai = GetMenPai(sceneId,selfId)
		local nLevel = GetLevel(sceneId,selfId) 
		if nLevel < 10 then
			x999998_tips(sceneId,selfId,"等级不足10级。")
			return
		end
		if nMenPai == nPar1 then
			x999998_tips(sceneId,selfId,"已经加入本门派了。")
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, selfId, nPar1)
		for i =1,7 do
			LuaFnSetXinFaLevel(sceneId,selfId,x999998_g_XinFaInfo[nPar1+1][i],119)
		end
		--CallScriptFunction(900030, "CleanMenPaiBuff", sceneId, selfId);
		x999998_tips(sceneId,selfId,"成功加入门派。")
	end
	if nIndex == 16 then --学心法
		local nMenPai = GetMenPai(sceneId,selfId)
		if nMenPai == 9 then
			x999998_tips(sceneId,selfId,"请先加入门派。")
			return
		end
		local nXinFaData = 0;
		for i =1,7 do
			if LuaFnGetXinFaLevel(sceneId,selfId,x999998_g_XinFaInfo[nMenPai+1][i]) < 1 then
				nXinFaData = i;
				break
			end
		end
		if nXinFaData ~= 0 then
			x999998_tips(sceneId,selfId,"已成功学习本门派未学习心法。")
			else
			x999998_tips(sceneId,selfId,"本门派心法已经全部习得，无可学心法。")
		end
	end
	if nIndex == 17 then --设置心法等级
		if nPar1 < 0 or nPar1 > 119 then
			x999998_tips(sceneId,selfId,"GM_TOOL-idx_17_Error_1!!!")
			return
		end
		local nMenPai = GetMenPai(sceneId,selfId)
		if nMenPai == 9 then
			x999998_tips(sceneId,selfId,"请先加入门派。")
			return
		end
		for i =1,7 do
			LuaFnSetXinFaLevel(sceneId,selfId,x999998_g_XinFaInfo[nMenPai+1][i],nPar1)
		end
		x999998_tips(sceneId,selfId,format("已将全部心法设置为%s级。",nPar1))
	end
	if nIndex == 18 then --查看buff
		x999998_CCBUFF(sceneId,selfId,-1)
	end
	if nIndex == 19 then --查询MD
		if nPar1 < 0 or nPar1 > 991 then
			x999998_tips(sceneId,selfId,"超出MissionData定义最大值，请重新输入。")
			return
		end
		local MissionData = GetMissionData(sceneId,selfId,nPar1)
		x999998_Box(sceneId,selfId,format("当前查询MD编号为：%s#r当前MD编号数据为：%s",nPar1,MissionData))
	end
	if nIndex == 20 then --查询MDEX
		if nPar1 < 0 or nPar1 > 1024 then
			x999998_tips(sceneId,selfId,"超出MissionDataEx定义最大值，请重新输入。")
			return
		end
		local MissionDataEx = GetMissionDataEx(sceneId,selfId,nPar1)
		x999998_Box(sceneId,selfId,format("当前查询MDEX编号为：%s#r当前MDEX编号数据为：%s",nPar1,MissionDataEx))
	end
	if nIndex == 21 then --查询FLAG
		if nPar1 < 0 or nPar1 > 1279 then
			x999998_tips(sceneId,selfId,"超出MissionFlag定义最大值，请重新输入。")
			return
		end
		local MissionFlag = GetMissionFlag(sceneId,selfId,nPar1)
		x999998_Box(sceneId,selfId,format("当前查询Flag编号为：%s#r当前Flag编号数据为：%s",nPar1,MissionFlag))
	end
	if nIndex == 22 then --查询World
		if nPar1 < 0 or nPar1 > 76 then
			x999998_tips(sceneId,selfId,"超出GlobalWorld定义最大值，请重新输入。")
			return
		end
		local GlobalWorld = LuaFnGetWorldGlobalData(nPar1)
		x999998_Box(sceneId,selfId,format("当前查询World编号为：%s#r当前World编号数据为：%s",nPar1,GlobalWorld))
	end
	if nIndex == 23 then --学习技能
		x999998_tips(sceneId,selfId,"此功能需要使用时开放。")
	end
	if nIndex == 24 then --删除技能
		x999998_tips(sceneId,selfId,"此功能需要使用时开放。")
	end
	if nIndex == 25 then --获取BUFF
		if nPar1 < 0 or nPar1 > 50000 then
			x999998_tips(sceneId,selfId,"超出BUFF上限，请重新输入。")
			return
		end
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,nPar1,0)
		x999998_tips(sceneId,selfId,format("已获取%s号BUFF。",nPar1))
	end
	if nIndex == 26 then --删BUFF
		if nPar1 < 0 or nPar1 > 50000 then
			x999998_tips(sceneId,selfId,"超出BUFF上限，请重新输入。")
			return
		end
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId,selfId,nPar1) == 1 then
			LuaFnCancelSpecificImpact(sceneId,selfId,nPar1)
			x999998_tips(sceneId,selfId,format("已清除%s号BUFF。",nPar1))
			else
			x999998_tips(sceneId,selfId,"不存在此BUFF，无需清除。")
		end
	end
	if nIndex == 27 then --查场景数据
		local nSceneName = GetSceneName(sceneId) --场景名称
		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		x999998_Box(sceneId,selfId,format("当前场景为：%s。#r场景内存在人数为：%s人。",nSceneName,nHumanNum))
	end
	if nIndex == 28 then --换场景
		if nPar1 < 0 or nPar1 > 1500 then
			x999998_tips(sceneId,selfId,"GM_TOOL-idx_28_Error_1!!!")
			return
		end
		if nPar2 < 10 or nPar2 > 500 then
			x999998_tips(sceneId,selfId,"GM_TOOL-idx_28_Error_2!!!")
			return
		end
		if nPar3 < 10 or nPar3 > 500 then
			x999998_tips(sceneId,selfId,"GM_TOOL-idx_28_Error_3!!!")
			return
		end
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId,nPar1,nPar2,nPar3)
	end
	if nIndex == 29 then --设置MD
		if nPar1 < 0 or nPar1 > 991 then
			x999998_tips(sceneId,selfId,"超出MissionData定义最大值，请重新输入。")
			return
		end
		if nPar2 < 0 or nPar2 > 2100000000 then
			x999998_tips(sceneId,selfId,"超出MissionData设置最大上限，请重新输入。")
			return
		end
		--这个设置MD就别继承了，反正是随意输入。
		SetMissionData(sceneId,selfId,nPar1,nPar2)
		x999998_Box(sceneId,selfId,format("成功将MD编号：%s设置为：%s。",nPar1,nPar2))
	end
	if nIndex == 30 then --设置Ex
		if nPar1 < 0 or nPar1 > 1024 then
			x999998_tips(sceneId,selfId,"超出MissionDataEx定义最大值，请重新输入。")
			return
		end
		if nPar2 < 0 or nPar2 > 2100000000 then
			x999998_tips(sceneId,selfId,"超出MissionDataEx设置最大上限，请重新输入。")
			return
		end
		--这个设置MD就别继承了，反正是随意输入。
		SetMissionDataEx(sceneId,selfId,nPar1,nPar2)
		x999998_Box(sceneId,selfId,format("成功将MDEX编号：%s设置为：%s。",nPar1,nPar2))
	end
	if nIndex == 31 then --设置Flag
		if nPar1 < 0 or nPar1 > 1279 then
			x999998_tips(sceneId,selfId,"超出MissionFlag定义最大值，请重新输入。")
			return
		end
		if nPar2 < 0 or nPar2 > 1 then
			x999998_tips(sceneId,selfId,"超出MissionFlag设置最大上限，请重新输入。")
			return
		end
		--这个设置MD就别继承了，反正是随意输入。
		SetMissionFlag(sceneId,selfId,nPar1,nPar2)
		x999998_Box(sceneId,selfId,format("成功将Flag编号：%s设置为：%s。",nPar1,nPar2))
	end
	if nIndex == 32 then --设置World
		if nPar1 < 0 or nPar1 > 76 then
			x999998_tips(sceneId,selfId,"超出GlobalWorld定义最大值，请重新输入。")
			return
		end
		if nPar2 < 0 or nPar2 > 2100000000 then
			x999998_tips(sceneId,selfId,"超出GlobalWorld设置最大上限，请重新输入。")
			return
		end
		--这个设置MD就别继承了，反正是随意输入。
		LuaFnSetWorldGlobalData(nPar1,nPar2)
		x999998_Box(sceneId,selfId,format("成功将World编号：%s设置为：%s。",nPar1,nPar2))
	end
	if nIndex == 33 then --属性生效
		--默认属性测试看看
		--给GM号一个属性标记，然后直接生成属性就行。
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,2691,0)
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,2692,0)

		x999998_tips(sceneId,selfId,"成功添加测试buff。")
	end
	if nIndex == 34 then
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,2690,0)
		x999998_tips(sceneId,selfId,"已获取GM状态。")
	end
	if nIndex == 35 then
		if LuaFnGetWorldGlobalData(68) == 0 then
			LuaFnSetWorldGlobalData(68,1)
			x999998_Box( sceneId, selfId, "泡点已开启。")
			return
		end
		if LuaFnGetWorldGlobalData(68) == 1 then
			LuaFnSetWorldGlobalData(68,0)
			x999998_Box( sceneId, selfId, "泡点已关闭。")
			return
		end
	end
	if nIndex == 36 then
		local nNowTime = GetTime2Day()
		if nPar1 < nNowTime or nPar1 > 20241231 then
			x999998_Box(sceneId,selfId,"设置时间有误，禁止设置小于当天的时间，以及超过年底最大时间。")
			return
		end
		--先清除榜单，清除标识
		remove("./PlayerLog/JiangHuList/acme_list_2.txt")
		remove("./PlayerLog/JiangHuList/Acme_TopListOpenDate.txt")
		local nHandle = openfile("./PlayerLog/JiangHuList/acme_list_2.txt", "w")
		local nFinData = ""
		for i = 1,20 do
			nFinData = nFinData.."0\t虚位以待\t9\t0\n"
		end
		if nFinData ~= "" then
			write(nHandle,nFinData)
			closefile(nHandle)
		end
		--设置榜单结束时间
		CallScriptFunction(900037,"SetAcmeListTime",sceneId,nPar1)
		x999998_Box(sceneId,selfId,format("名动江湖榜已开启，结束时间为%s年%s月%s日，23时。",floor(nPar1/10000),mod(floor(nPar1/100),100),mod(nPar1,100)))
	end
	if nIndex == 37 then
		local nNowTime = GetTime2Day()
		if nPar1 < nNowTime or nPar1 > 20251231 then
			x999998_Box(sceneId,selfId,"设置时间有误，禁止设置小于当天的时间，以及超过年底最大时间。")
			return
		end
		--先清除花榜数据文本
		remove("./PlayerLog/FestivalTopList/HuaBang1.txt")
		remove("./PlayerLog/FestivalTopList/HuaBang2.txt")
		remove("./PlayerLog/FestivalTopList/HuaBangOpenDate.txt")
		--设置榜单结束时间
		CallScriptFunction(800660,"SetHuaBangListOpenDate",sceneId,selfId,nPar1)
		x999998_Box(sceneId,selfId,format("花榜已开启，结束时间为%s年%s月%s日。",floor(nPar1/10000),mod(floor(nPar1/100),100),mod(nPar1,100)))
	end
--	if nIndex == 38 then
--		LuaFnSetWorldGlobalData(ERHAI_WORLDGLOBALOPEN_CLICK,1)
--		x999998_Box(sceneId,selfId,"鸾战夜西湖活动，已开启！")
--	end
	if nIndex == 39 then
	if nPar1 > 999999 then 
	x999998_Box(sceneId,selfId,"脚本ID超出范围")
	return 
	end 
	LuaFnLUAOverload(sceneId,selfId,nPar1);
	x999998_Box(sceneId,selfId,"脚本ID移除错误并重载。") 
	end 
--	if nIndex == 40 then
--		if LuaFnGetWorldGlobalData(87) == 0 then
--			LuaFnSetWorldGlobalData(87,1)
--			x999998_Box(sceneId,selfId,"转区功能已开启。")
--			return
--		end
--		if LuaFnGetWorldGlobalData(87) == 1 then
--			LuaFnSetWorldGlobalData(87,0)
--			x999998_Box(sceneId,selfId,"转区功能已关闭。")
--		end
--	end 
	if nIndex == 41 then
	LuaFnTXTOverload(sceneId,selfId,1)  
	return 
	end 
	if nIndex == 42 then
	LuaFnTXTOverload(sceneId,selfId,2)  
	return 
	end 
	if nIndex == 43 then
	LuaFnTXTOverload(sceneId,selfId,3)  
	return 
	end 
	if nIndex == 44 then
		for i = 1,200 do 
		LuaFnSetCooldown(sceneId,selfId,i,0);
		end 
	return 
	end 
end
--**************************************
-- 目标操作
--**************************************
function x999998_FjqhGmTool_TarUse(sceneId,selfId,nIndex,nPar1,nPar2,nPar3)

	if x999998_IsGM(sceneId,selfId) ~= 1 then
		x999998_tips(sceneId,selfId,"你不是管理员，无任何操作权限。")
		return
	end
	if nIndex < 1 or nIndex > 16 then
		x999998_tips( sceneId,selfId,"GM_TOOL-TarUse-Error_1!!!")
		return
	end
	local nTarGUID = GetMissionData(sceneId,selfId,MD_TARGUID_DATA)
	if nTarGUID == 0 then
		x999998_tips(sceneId,selfId,"请选择要操作的目标。")
		return
	end
	local ParID = LuaFnGuid2ObjId(sceneId,nTarGUID) 

	--存入事件时，一定要限制好，否则会出现大问题。
	if nIndex == 1 then  --查看对方元宝、绑元、金币、交子。
		if LuaFnIsObjValid(sceneId, ParID) < 1 then
				x999998_tips(sceneId,selfId,"目标和管理员未在同一场景。"  )
			return
		end
		local YuanBaoNum = YuanBao(sceneId,ParID,-1,3,0)
		local BindYuanBaoNum = BindYuanBao(sceneId,ParID,-1,3,0)
		local Money = GetMoney(sceneId,ParID)
		local MoneyJZ = GetMoneyJZ(sceneId,ParID)
		x999998_Box(sceneId,selfId,format("角色名：#P%s#r#W持有元宝数量：#P%s#r#W持有绑定元宝数量：#P%s#r#W持有金币数量：#P#{_EXCHG%s}#r#W持有交子数量：#P#{_EXCHG%s}",
		GetName(sceneId,ParID),
		YuanBaoNum,
		BindYuanBaoNum,
		Money,
		MoneyJZ))
	end
	if nIndex == 2 then --发放物品。
		if LuaFnIsObjValid(sceneId, ParID) < 1 then
				x999998_tips(sceneId,selfId,"目标和管理员未在同一场景。"  )
			return
		end
		if nPar1 < 10000000 or nPar1 > 59999999 then
			x999998_tips( sceneId,selfId,"输入的物品代码有误，建议使用GM工具物品搜索功能获取物品代码。")
			return
		end
		if nPar2 < 1 or nPar2 > 9999 then
			x999998_tips( sceneId,selfId,"物品数量不得小于1或者大于9999，防止出现BUG。")
			return
		end
		--目标玩家身份证存入组内。
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,nTarGUID)
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,nIndex) --存入事件
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,nPar1) --存入数据
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA_2,nPar2)
		x999998_tips(sceneId,selfId,"发放成功。"..nTarGUID)
		x999998_tips(sceneId,selfId,"发放成功。"..nIndex)
		x999998_tips(sceneId,selfId,"发放成功。"..nPar1)
		x999998_tips(sceneId,selfId,"发放成功。"..nPar2)
		CallScriptFunction(999907,"OnImpactFadeOut",sceneId,ParID,0);
	end
	if nIndex == 3 then --领金币
		if LuaFnIsObjValid(sceneId, ParID) < 1 then
				x999998_tips(sceneId,selfId,"目标和管理员未在同一场景。"  )
			return
		end
		if nPar1 < 0 or nPar1 > 2000000000 then
			x999998_tips(sceneId,selfId,"发放数量不得小于0，或大于20万金。")
			return
		end
		--目标玩家身份证存入组内。
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,nTarGUID)
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,nIndex) --存入事件
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,nPar1) --存入数据
		x999998_tips(sceneId,selfId,"发放成功。")
		CallScriptFunction(999907,"OnImpactFadeOut",sceneId,ParID,0);
	end
	if nIndex == 4 then --领交子
		if LuaFnIsObjValid(sceneId, ParID) < 1 then
				x999998_tips(sceneId,selfId,"目标和管理员未在同一场景。"  )
			return
		end
		if nPar1 < 0 or nPar1 > 144000000 then
			x999998_tips(sceneId,selfId,"发放数量不得小于0，或大于14400交子。")
			return
		end
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,nTarGUID)
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,nIndex) --存入事件
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,nPar1) --存入数据
		x999998_tips(sceneId,selfId,"发放成功。")
		CallScriptFunction(999907,"OnImpactFadeOut",sceneId,ParID,0);
	end
	if nIndex == 5 then   --领元宝
		if LuaFnIsObjValid(sceneId, ParID) < 1 then
				x999998_tips(sceneId,selfId,"目标和管理员未在同一场景。"  )
			return
		end
		if nPar1 < 0 or nPar1 > 2100000000 then
			x999998_tips(sceneId,selfId,"GM_TOOL-idx_8_Error_1!!!")
			return
		end
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,nTarGUID)
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,nIndex) --存入事件
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,nPar1) --存入数据
		x999998_tips(sceneId,selfId,"发放成功您发放的元宝数量为："..nPar1)
		CallScriptFunction(999907,"OnImpactFadeOut",sceneId,ParID,0);
	end
	if nIndex == 6 then   --领绑定元宝
		if LuaFnIsObjValid(sceneId, ParID) < 1 then
				x999998_tips(sceneId,selfId,"目标和管理员未在同一场景。"  )
			return
		end
		if nPar1 < 0 or nPar1 > 2100000000 then
			x999998_tips(sceneId,selfId,"GM_TOOL-idx_10_Error_1!!!")
			return
		end
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,nTarGUID)
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,nIndex) --存入事件
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,nPar1) --存入数据
		x999998_tips(sceneId,selfId,"发放成功您发放的绑定元宝数量为："..nPar1)
		CallScriptFunction(999907,"OnImpactFadeOut",sceneId,ParID,0);
	end
	if nIndex == 7 then --查询MD
		if LuaFnIsObjValid(sceneId, ParID) < 1 then
			x999998_tips(sceneId,selfId,"查看目标玩家MD数据，必须是对方和管理员再同一场景方可查看。")
			return
		end
		if nPar1 < 0 or nPar1 > 991 then
			x999998_tips(sceneId,selfId,"超出MissionData定义最大值，请重新输入。")
			return
		end
		local MissionData = GetMissionData(sceneId,ParID,nPar1)
		x999998_Box(sceneId,selfId,format("目标玩家角色名：%s#r查询目标MD编号为：%s#r当前目标MD编号数据为：%s",GetName(sceneId,ParID),nPar1,MissionData))
	end
	if nIndex == 8 then --查询MDEX
		if LuaFnIsObjValid(sceneId, ParID) < 1 then
			x999998_tips(sceneId,selfId,"查看目标玩家MDEX数据，必须是对方和管理员再同一场景方可查看。")
			return
		end
		if nPar1 < 0 or nPar1 > 1024 then
			x999998_tips(sceneId,selfId,"超出MissionDataEx定义最大值，请重新输入。")
			return
		end
		local MissionDataEx = GetMissionDataEx(sceneId,ParID,nPar1)
		x999998_Box(sceneId,selfId,format("目标玩家角色名：%s#r查询目标MDEX编号为：%s#r当前目标MDEX编号数据为：%s",GetName(sceneId,ParID),nPar1,MissionDataEx))
	end
	if nIndex == 9 then --查询FLAG
		if LuaFnIsObjValid(sceneId, ParID) < 1 then
			x999998_tips(sceneId,selfId,"查看目标玩家Flag数据，必须是对方和管理员再同一场景方可查看。")
			return
		end
		if nPar1 < 0 or nPar1 > 319 then
			x999998_tips(sceneId,selfId,"超出MissionFlag定义最大值，请重新输入。")
			return
		end
		local MissionFlag = GetMissionFlag(sceneId,ParID,nPar1)
		x999998_Box(sceneId,selfId,format("目标玩家角色名：%s#r查询目标Flag编号为：%s#r当前目标Flag编号数据为：%s",GetName(sceneId,ParID),nPar1,MissionFlag))
	end
	if nIndex == 10 then --设置MD
		if LuaFnIsObjValid(sceneId, ParID) < 1 then
				x999998_tips(sceneId,selfId,"目标和管理员未在同一场景。"  )
			return
		end
		if nPar1 < 0 or nPar1 > 991 then
			x999998_tips(sceneId,selfId,"超出MissionData定义最大值，请重新输入。")
			return
		end
		if nPar2 < 0 or nPar2 > 2100000000 then
			x999998_tips(sceneId,selfId,"超出MissionData设置最大上限，请重新输入。")
			return
		end
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,nTarGUID)
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,nIndex) --存入事件
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,nPar1) --存入数据
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA_2,nPar2)
		x999998_Box(sceneId,selfId,format("成功将目标玩家MD编号：%s#r设置为：%s。",nPar1,nPar2))
		CallScriptFunction(999907,"OnImpactFadeOut",sceneId,ParID,0);
	end
	if nIndex == 11 then --设置Ex
		if LuaFnIsObjValid(sceneId, ParID) < 1 then
				x999998_tips(sceneId,selfId,"目标和管理员未在同一场景。"  )
			return
		end
		if nPar1 < 0 or nPar1 > 1024 then
			x999998_tips(sceneId,selfId,"超出MissionDataEx定义最大值，请重新输入。")
			return
		end
		if nPar2 < 0 or nPar2 > 2100000000 then
			x999998_tips(sceneId,selfId,"超出MissionDataEx设置最大上限，请重新输入。")
			return
		end
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,nTarGUID)
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,nIndex) --存入事件
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,nPar1) --存入数据
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA_2,nPar2)
		x999998_Box(sceneId,selfId,format("成功将目标玩家MDEX编号：%s设置为：%s。",nPar1,nPar2))
		CallScriptFunction(999907,"OnImpactFadeOut",sceneId,ParID,0);
	end
	if nIndex == 12 then --设置Flag
		if LuaFnIsObjValid(sceneId, ParID) < 1 then
				x999998_tips(sceneId,selfId,"目标和管理员未在同一场景。"  )
			return
		end
		if nPar1 < 0 or nPar1 > 318 then
			x999998_tips(sceneId,selfId,"超出MissionFlag定义最大值，请重新输入。")
			return
		end
		if nPar2 < 0 or nPar2 > 1 then
			x999998_tips(sceneId,selfId,"超出MissionFlag设置最大上限，请重新输入。")
			return
		end
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,nTarGUID)
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,nIndex) --存入事件
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,nPar1) --存入数据
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA_2,nPar2)
		x999998_Box(sceneId,selfId,format("成功将目标玩家Flag编号：%s设置为：%s。",nPar1,nPar2))
		CallScriptFunction(999907,"OnImpactFadeOut",sceneId,ParID,0);
	end
	if nIndex == 13 then --属性生效
		if LuaFnIsObjValid(sceneId, ParID) < 1 then
				x999998_tips(sceneId,selfId,"目标和管理员未在同一场景。"  )
			return
		end
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,nTarGUID)
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,nIndex) --存入事件
		x999998_tips(sceneId,selfId,"已将目标玩家属性设置为MAX。")
		CallScriptFunction(999907,"OnImpactFadeOut",sceneId,ParID,0);
	end
	if nIndex == 14 then --发放登记
		if LuaFnIsObjValid(sceneId, ParID) < 1 then
				x999998_tips(sceneId,selfId,"目标和管理员未在同一场景。"  )
			return
		end
		if nPar1 < 0 or nPar1 > 119 then
			x999998_tips(sceneId,selfId,"发放等级不得小于0，或大于119级。")
			return
		end
		if GetLevel(sceneId,ParID) >= nPar1 then
			x999998_tips(sceneId,selfId,"您当前要发放等级的目标大于等于你要发放的等级，对方目前等级为："..GetLevel(sceneId,ParID))
			return
		end
		--目标玩家身份证存入组内。
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,nTarGUID)
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,nIndex) --存入事件
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,nPar1) --存入数据
		x999998_tips(sceneId,selfId,"修改等级成功，您修改对方的等级后为："..nPar1)
		CallScriptFunction(999907,"OnImpactFadeOut",sceneId,ParID,0);
	end
	if nIndex == 15 then --发心法
		if LuaFnIsObjValid(sceneId, ParID) < 1 then
				x999998_tips(sceneId,selfId,"目标和管理员未在同一场景。"  )
			return
		end
		-- if nPar1 < 0 or nPar1 > 119 then
			-- x999998_tips(sceneId,selfId,"发放失败，请确认好输入正确的心法等级")
			-- return
		-- end
		-- --目标玩家身份证存入组内。
		-- LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,nTarGUID)
		-- LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,nIndex) --存入事件
		-- LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,nPar1) --存入数据
		-- x999998_tips(sceneId,selfId,"发放称号成功，您发放的称号ID为："..nPar1)
		-- CallScriptFunction(999907,"OnImpactFadeOut",sceneId,ParID,0);
			if nPar1 < 0 or nPar1 > 119 then
				x999998_tips(sceneId,ParID,"GM_TOOL-idx_17_Error_1!!!")
				return
			end
			local nMenPai = GetMenPai(sceneId,ParID)
			if nMenPai == 9 then
				x999998_tips(sceneId,ParID,"请先加入门派。")
				return
			end
			for i =1,7 do
				LuaFnSetXinFaLevel(sceneId,ParID,x999998_g_XinFaInfo[nMenPai+1][i],nPar1)
			end
			x999998_tips(sceneId,ParID,format("已将全部心法设置为%s级。",nPar1))
	end
	if nIndex == 16 then --发放称号
		if LuaFnIsObjValid(sceneId, ParID) < 1 then
				x999998_tips(sceneId,selfId,"目标和管理员未在同一场景。"  )
			return
		end
		if nPar1 < 1000 or nPar1 > 1240 then
			x999998_tips(sceneId,selfId,"发放失败，请确认好称号的准确ID")
			return
		end
		--目标玩家身份证存入组内。
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,nTarGUID)
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,nIndex) --存入事件
		LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,nPar1) --存入数据
		x999998_tips(sceneId,selfId,"发放称号成功，您发放的称号ID为："..nPar1)
		CallScriptFunction(999907,"OnImpactFadeOut",sceneId,ParID,0);
	end
end
--**************************************
-- 添加GM身份权限
--**************************************
function x999998_IsGM(sceneId,selfId)
	local Account = GetName(sceneId,selfId)
	for i = 1,getn(x999998_g_GMList) do
		if Account == x999998_g_GMList[i] then 
	RestoreHp( sceneId, selfId ) ------满血
	RestoreMp( sceneId, selfId ) ------满气
	RestoreRage( sceneId, selfId ) ------满怒   
			return 1
		end
	end
	return 0
end
--**********************************
--查询身上存在多少BUFF
--**********************************
function x999998_CCBUFF(sceneId,selfId,targetId)
	local p = {}
	local u = 0 
	for i =1 ,50000 do 
		if  LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, i) == 1 then 
			u = u + 1
			p[u]=i
		end
	end
	local	str = ""
	for j = 1, getn(p) do 
		str =str ..p[j]..","
	end
	BeginEvent( sceneId )
		AddText( sceneId, "BUFF NUM:"..u.."\n"..str )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
--**********************************
-- GM-TOOL-Log
--**********************************
function x999998_GameLog(sceneId,selfId,nIndex,Logstr)
	local LogTxt = {"Self_Log","Tar_Log"}
	local LogFile = openfile("./PlayerLog/GameLog/"..LogTxt[nIndex]..".txt", "a+")
	if nil ~= LogFile then
	    if Logstr == nil then
			Logstr = "" 
		end
		write(LogFile,Logstr)
		write(LogFile,tostring("\n"))
		closefile(LogFile)
	end

end
--**********************************
-- 对话框提示
--**********************************
function x999998_Box(sceneId,selfId,Tip)
	BeginEvent( sceneId )
		AddText( sceneId,Tip)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId,-1 )
end
--**********************************
--屏幕中间提示
--**********************************
function x999998_tips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
	AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
