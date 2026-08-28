-- 领奖NPC
--2024-3-24 23:20:21 重构

x002084_g_scriptId = 002084
--开启内测预充权限物品领取
x002084_g_TEST_CTUID = 1001000014
x002084_g_TestNeedPoint = 200

x002084_g_NewCard1_666 = 43
x002084_g_NewCard2_666 = 44
x002084_g_NewCard3_666 = 45
x002084_g_NewCard4_666 = 46
x002084_g_NewCard5_666 = 47
x002084_g_NewCard6_666 = 48
x002084_g_NewCard7_666 = 49
x002084_g_NewCard8_666 = 50
x002084_g_NewCard9_666 = 51
x002084_g_NewCard10_666 = 52
x002084_g_NewCard11_666 = 53
x002084_g_NewCard12_666 = 54

--天工开物
x002084_g_eventList={210244}

--财富卡666
x002084_g_NewCardListEx = {}
x002084_g_NewCardListEx[x002084_g_NewCard1_666] = {
	needLevel = -1,
	itemAward = { hashTable = {}, itemList = {10402081,10422153,10423062}},
	taozhuang = 0,
	petdata = 0,
	moneyReward = 0,
	PropBagSpaceNeed = 3,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard0_666,
	redundantMsg = "#{TLWS_20200908_30}",
	recvMsg = "#{TLWS_20200908_32}",
}
x002084_g_NewCardListEx[x002084_g_NewCard2_666] = {
	needLevel = 10,
	itemAward = { hashTable = {}, itemList = {10141025,10141035,10141208} },
	taozhuang = 0,
	petdata = 0,
	moneyReward = 0,
	PropBagSpaceNeed = 3,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard1_666,
	redundantMsg = "#{TLWS_20200908_34}",
	recvMsg = "#{TLWS_20200908_35}",
}
x002084_g_NewCardListEx[x002084_g_NewCard3_666] = {
	needLevel = 15,
	itemAward = { hashTable = {}, itemList = {10111056,10112056,10113056,10121016} },
	taozhuang = 0,
	petdata = 0,
	moneyReward = 0,
	PropBagSpaceNeed = 4,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard2_666,
	redundantMsg = "#{TLWS_20200908_37}",
	recvMsg = "#{TLWS_20200908_38}",
}
x002084_g_NewCardListEx[x002084_g_NewCard4_666] = {
	needLevel = 25,
	itemAward = { hashTable = {}, itemList = {30008103,30505076}},
	taozhuang = 0,
	petdata = 0,
	moneyReward = 0,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard3_666,
	redundantMsg = "#{TLWS_20200908_40}",
	recvMsg = "#{TLWS_20200908_41}",
}
x002084_g_NewCardListEx[x002084_g_NewCard5_666] = {
	needLevel = 30,
	itemAward = { hashTable = {}, itemList = {10155004,30900059} },
	taozhuang = 
	{
		{10411002,10412002,10413002,10421002},
		{10411002,10412002,10413002,10421002},
		{10411002,10412002,10413002,10421002},
		{10411008,10412008,10413008,10421008},
		{10411008,10412008,10413008,10421008},
		{10411008,10412008,10413008,10421008},
		{10411002,10412002,10413002,10421002},
		{10411002,10412002,10413002,10421002},
		{10411008,10412008,10413008,10421008},
		--无门派
		{},
		--曼陀山庄
		{10411008,10412008,10413008,10421008},
	},
	petdata = 23472,
	moneyReward = 0,
	PropBagSpaceNeed = 6,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard4_666,
	redundantMsg = "#{TLWS_20200908_43}",
	recvMsg = "#{TLWS_20200908_45}",
}
x002084_g_NewCardListEx[x002084_g_NewCard6_666] = {
	needLevel = 40,
	itemAward = { hashTable = {}, itemList = {30008102,30008027,30503133,30503133,30505800,30505800,30505800,30900006,30900006} },
	taozhuang = 
	{
		{10512003},
		{10520013},
		{10512023},
		{10512033},
		{10520043},
		{10521050},
		{10512083},
		{10512063},
		{10520073},
		--无门派
		{},
		--曼陀山庄
		{10520120}
	},
	petdata = 0,
	moneyReward = 0,
	PropBagSpaceNeed = 6,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard5_666,
	redundantMsg = "#{TLWS_20200908_47}",
	recvMsg = "#{TLWS_20200908_48}",
}
x002084_g_NewCardListEx[x002084_g_NewCard7_666] = {
	needLevel = 50,
	itemAward = { hashTable = {}, itemList = {30505801,30505801,30505801,
	20310173,20310173,20310173,20310173,20310173,20310173,20310173,20310173,
	20310173,20310173,20310173,20310173,20310173,20310173,20310173,20310173,
	20310173,20310173,20310173,20310173,30120010,30503149} },
	taozhuang = 
	{
		{10513004,10515004},
		{10521014,10515014},
		{10513024,10520024},
		{10511034,10513034},
		{10513044,10515044},
		{10513054,10520054},
		{10523084,10552084},
		{10511064,10513064},
		{10511074,10513074},
		--无门派
		{},
		--曼陀山庄
		{10511120,10513119,10515120}
	},
	petdata = 0,
	moneyReward = 0,
	PropBagSpaceNeed = 5,
	MatBagSpaceNeed = 1,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard6_666,
	redundantMsg = "#{TLWS_20200908_50}",
	recvMsg = "#{TLWS_20200908_52}",
}
x002084_g_NewCardListEx[x002084_g_NewCard8_666] = {
	needLevel = 60,
	itemAward = { hashTable = {}, itemList = {10156003,10156004,20501003} },
	taozhuang = 0,
	petdata = 0,
	moneyReward = 0,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 1,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard7_666,
	redundantMsg = "#{TLWS_20200908_54}",
	recvMsg = "#{TLWS_20200908_55}",
}
x002084_g_NewCardListEx[x002084_g_NewCard9_666] = {
	needLevel = 70,
	itemAward = { hashTable = {}, itemList = {30501361,30501361,30501361,20502003,30700241,30700241} },
	taozhuang = 0,
	petdata = 0,
	moneyReward = 0,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 1,
	TaskBagSpaceNeed = 0,
	flagBit = MFEX_GetNewUserCard8_666,
	redundantMsg = "#{TLWS_20200908_57}",
	recvMsg = "#{TLWS_20200908_58}",
}
x002084_g_NewCardListEx[x002084_g_NewCard10_666] = {
	needLevel = 80,
	itemAward = { hashTable = {}, itemList = {20310168,20310168,20310168,20310168,20310168,30505804,30505804} },
	taozhuang = 0,
	petdata = 0,
	moneyReward = 0,
	PropBagSpaceNeed = 1,
	MatBagSpaceNeed = 1,
	TaskBagSpaceNeed = 0,
	flagBit = MFEX_GetNewUserCard9_666,
	redundantMsg = "#{TLWS_20200908_60}",
	recvMsg = "#{TLWS_20200908_61}",
}
x002084_g_NewCardListEx[x002084_g_NewCard11_666] = {
	needLevel = 90,
	itemAward = { hashTable = {}, itemList = {20310168,20310168,20310168,20310168,20310168,20310168,20310168,20310168,20310168,20310168,
	50313004} },
	taozhuang = 0,
	petdata = 0,
	moneyReward = 0,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 2,
	TaskBagSpaceNeed = 0,
	flagBit = MFEX_GetNewUserCard10_666,
	redundantMsg = "#{TLWS_20200908_63}",
	recvMsg = "#{TLWS_20200908_64}",
}
x002084_g_NewCardListEx[x002084_g_NewCard12_666] = {
	needLevel = 100,
	itemAward = { hashTable = {}, itemList = {50413004,20501003,20502003} },
	taozhuang = 0,
	petdata = 0,
	moneyReward = 0,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 3,
	TaskBagSpaceNeed = 0,
	flagBit = MFEX_GetNewUserCard11_666,
	redundantMsg = "#{TLWS_20200908_66}",
	recvMsg = "#{TLWS_20200908_67}",
}


--**********************************
--事件交互入口
--**********************************
function x002084_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{TLWS_20200908_01}" )

		for i, eventId in x002084_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		-- if LuaFnCTUCheckIsShutDown(sceneId,selfId,x002084_g_TEST_CTUID) == 0 then
			-- local nExchPoint = floor(BuyYuanBaoCount(sceneId,selfId,-1,3,0)/PRIZE_EXCHANGE_PARAM)
			-- if nExchPoint >= x002084_g_TestNeedPoint then
				-- AddNumText( sceneId, x002084_g_scriptId, "神秘档口", 6,11001)
			-- end
		-- end
		
		-- if GetGuildPos( sceneId, selfId ) == GUILD_POSITION_CHIEFTAIN then
			-- AddNumText(sceneId,selfId,"#H购买20点帮派扩张值【价值2000元宝】",6,10008)
		-- end
		AddNumText( sceneId, x002084_g_scriptId, "#{TLWS_20200908_02}", 2, 101 )
		AddNumText( sceneId, x002084_g_scriptId, "#{TLWS_20200908_03}", 2, 102 )
		AddNumText( sceneId, x002084_g_scriptId, "#{TLWS_20200908_04}", 6, 520 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
--财富卡666
function x002084_AddNewUserCardNumText666(sceneId, selfId, targetId)
	local eventNum = 0
	BeginEvent( sceneId )
	
		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardListEx[x002084_g_NewCard1_666].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "领取1级的奖励", 2, x002084_g_NewCard1_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardListEx[x002084_g_NewCard2_666].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "领取" .. x002084_g_NewCardListEx[x002084_g_NewCard2_666].needLevel .. "级的奖励", 2, x002084_g_NewCard2_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardListEx[x002084_g_NewCard3_666].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "领取" .. x002084_g_NewCardListEx[x002084_g_NewCard3_666].needLevel .. "级的奖励", 2, x002084_g_NewCard3_666 )
			 eventNum = eventNum + 1
		end
		
		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardListEx[x002084_g_NewCard4_666].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "领取" .. x002084_g_NewCardListEx[x002084_g_NewCard4_666].needLevel .. "级的奖励", 2, x002084_g_NewCard4_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardListEx[x002084_g_NewCard5_666].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "领取" .. x002084_g_NewCardListEx[x002084_g_NewCard5_666].needLevel .. "级的奖励", 2, x002084_g_NewCard5_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardListEx[x002084_g_NewCard6_666].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "领取" .. x002084_g_NewCardListEx[x002084_g_NewCard6_666].needLevel .. "级的奖励", 2, x002084_g_NewCard6_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardListEx[x002084_g_NewCard7_666].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "领取" .. x002084_g_NewCardListEx[x002084_g_NewCard7_666].needLevel .. "级的奖励", 2, x002084_g_NewCard7_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardListEx[x002084_g_NewCard8_666].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "领取" .. x002084_g_NewCardListEx[x002084_g_NewCard8_666].needLevel .. "级的奖励", 2, x002084_g_NewCard8_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlagEx( sceneId, selfId, x002084_g_NewCardListEx[x002084_g_NewCard9_666].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "领取" .. x002084_g_NewCardListEx[x002084_g_NewCard9_666].needLevel .. "级的奖励", 2, x002084_g_NewCard9_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlagEx( sceneId, selfId, x002084_g_NewCardListEx[x002084_g_NewCard10_666].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "领取" .. x002084_g_NewCardListEx[x002084_g_NewCard10_666].needLevel .. "级的奖励", 2, x002084_g_NewCard10_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlagEx( sceneId, selfId, x002084_g_NewCardListEx[x002084_g_NewCard11_666].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "领取" .. x002084_g_NewCardListEx[x002084_g_NewCard11_666].needLevel .. "级的奖励", 2, x002084_g_NewCard11_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlagEx( sceneId, selfId, x002084_g_NewCardListEx[x002084_g_NewCard12_666].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "领取" .. x002084_g_NewCardListEx[x002084_g_NewCard12_666].needLevel .. "级的奖励", 2, x002084_g_NewCard12_666 )
			 eventNum = eventNum + 1
		end

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
	if eventNum == 0 then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    你已领取所有的超级大力卡奖励。" )
	end
end

--**********************************
--事件列表选中一项
--**********************************
function x002084_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	-- if LuaFnCTUCheckIsShutDown(sceneId,selfId,x002084_g_TEST_CTUID) == 0 then
		-- local nExchPoint = floor(BuyYuanBaoCount(sceneId,selfId,-1,3,0)/PRIZE_EXCHANGE_PARAM)
		-- if nExchPoint >= x002084_g_TestNeedPoint then

		 

	if GetNumText() == 520 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{TLWS_20200908_05}" )
			AddNumText( sceneId, x002084_g_scriptId, "#{TLWS_20200908_06}", 11, 521 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )		
	elseif GetNumText() == 521 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{TLWS_20200908_11}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )		
	end

	if x002084_g_NewCardListEx[GetNumText()] then
		x002084_GetNewCardPrize666( sceneId, selfId, targetId, GetNumText())
	elseif GetNumText() == 101 then
--		x002084_AddNewUserCardNumText(sceneId,selfId,targetId)
		--打开输入财富卡卡号界面
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 20100118 )
	elseif GetNumText() == 102 then
		if GetMissionFlag(sceneId,selfId,MF_ActiveNewUserCard666) ~= 1 then
			x002084_NotifyFailBox( sceneId, selfId, targetId, "#{TLWS_20200908_26}" )
			return
		end
		BeginEvent( sceneId )
			AddNumText( sceneId, x002084_g_scriptId, "#{TLWS_20200908_74}", 2, 103 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )		
	elseif GetNumText() == 103 then
		x002084_AddNewUserCardNumText666(sceneId,selfId,targetId)
	end
		
	for i, eventId in x002084_g_eventList do		
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		--return --警告：在没有条件处理的情况下，循环中慎用return
	end	
	
end

--**********************************
-- 领财富卡奖品666
--**********************************
function x002084_GetNewCardPrize666( sceneId, selfId, targetId, grade )
	local awardInfo = x002084_g_NewCardListEx[grade]
	if not awardInfo then
		return
	end
	if GetMissionFlag( sceneId, selfId, awardInfo.flagBit ) == 1 then
		x002084_NotifyFailBox( sceneId, selfId, targetId, awardInfo.redundantMsg )
		return													-- 领过了
	end

	if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard666 ) ~= 1 then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    你暂时无法领取到奖励。" )
		return
	end

	if GetLevel( sceneId, selfId ) < awardInfo.needLevel then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    嗯，你的等级不够，待等级达到" .. awardInfo.needLevel .. "级再来找我吧。" )
		return
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < awardInfo.PropBagSpaceNeed then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    你的背包道具栏至少需要留出" .. awardInfo.PropBagSpaceNeed .. "格。" )
		return
	end

	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < awardInfo.MatBagSpaceNeed then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    你的背包材料栏至少需要留出" .. awardInfo.MatBagSpaceNeed .. "格。" )
		return
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < awardInfo.TaskBagSpaceNeed then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    你的背包任务栏至少需要留出" .. awardInfo.TaskBagSpaceNeed .. "格。" )
		return
	end
	
	--if grade == x002084_g_NewCard3_666 then
		--if TryCreatePet(sceneId,selfId,1) <= 0 then
			--x002084_NotifyFailBox( sceneId, selfId, targetId, "    您携带的珍兽已满，您可以放生一个珍兽留出空位。" )
			--return
		--end
	--end
	--珍兽操作
	if awardInfo.petdata ~= 0 then
		--判断珍兽背包是否有空格。
		local checkCreatePet = TryCreatePet(sceneId, selfId, 1);
		if not checkCreatePet or checkCreatePet ~= 1 then
			x002084_NotifyFailBox(sceneId, selfId,targetId, "#{TLWS_20200908_44}。");
			return
		end
		LuaFnCreatePetToHuman(sceneId, selfId, awardInfo.petdata, 1, 0)
	end
	local itemSN, itemName, itemDesc, bBroadCast
	for i, row in awardInfo.itemAward.hashTable do
		local itemSN, itemName, itemDesc, bBroadCast = GetOneMissionBonusItem( row )
		if itemSN > -1 then							-- 放不下就没有了
			LuaFnTryRecieveSingleItem( sceneId, selfId, itemSN, QUALITY_MUST_BE_CHANGE,1)
		end
	end

	for i, itemSN in awardInfo.itemAward.itemList do
		LuaFnTryRecieveSingleItem( sceneId, selfId, itemSN, QUALITY_MUST_BE_CHANGE,1)
	end

	if awardInfo.moneyReward > 0 then
		if grade == x002084_g_NewCard4_666 or grade == x002084_g_NewCard5_666 or grade == x002084_g_NewCard6_666 or grade == x002084_g_NewCard7_666 or grade == x002084_g_NewCard8_666 then
			ZengDian(sceneId,selfId,targetId,1,awardInfo.moneyReward)
		else
			AddMoney( sceneId, selfId, awardInfo.moneyReward )
		end
	end
	--给套装得操作
	local nMenPai = GetMenPai(sceneId,selfId)
	if awardInfo.taozhuang ~= 0 then
		for i = 1,getn(awardInfo.taozhuang[nMenPai + 1]) do
			LuaFnTryRecieveSingleItem( sceneId, selfId, awardInfo.taozhuang[nMenPai + 1][i], QUALITY_MUST_BE_CHANGE,1)
		end
	end

	if grade >= 51 then
		SetMissionFlagEx( sceneId, selfId, awardInfo.flagBit, 1 )
	else
		SetMissionFlag( sceneId, selfId, awardInfo.flagBit, 1 )
	end
	x002084_NotifyFailBox( sceneId, selfId, targetId, awardInfo.recvMsg )
end
--**********************************
-- 屏幕中间信息提示
--**********************************
function x002084_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
-- 对话窗口信息提示
--**********************************
function x002084_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
