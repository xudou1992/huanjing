--GM发放列表
x999907_g_scriptId = 999907

--**********************************
--回调本接口
--**********************************
function x999907_OnImpactFadeOut(sceneId,selfId,impactId)
--	if impactId == 31809 then
		local nEvent = LuaFnGetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT) --存入事件
		local nPar1 = LuaFnGetWorldGlobalData(W_GIDX_LUAUSE_DATA) --存入数据
		local nPar2 = LuaFnGetWorldGlobalData(W_GIDX_LUAUSE_DATA_2)
		local GMGUID = LuaFnGetWorldGlobalData(W_GIDX_LUAUSE_GUID)
		local GUID = LuaFnGetGUID(sceneId,selfId)
		local Logstr = ""
		local nowYear = GetTodayYear();
		local nowMonth = GetTodayMonth();
		nowMonth=nowMonth+1;
		local nowDate = GetTodayDate();
		local nHour	 = GetHour()
		local nMinute = GetMinute()
		local nName = GetName(sceneId,selfId)
		if nEvent == 2 then
			if GUID == GMGUID then
				if nPar1 >= 10000000 and nPar1 < 59999999 and nPar2 > 0 and nPar2 < 10000 then
					BeginAddItem(sceneId)
						AddItem(sceneId,nPar1,nPar2)
						if EndAddItem(sceneId,selfId) <= 0 then
							return
						end
					AddItemListToHuman(sceneId,selfId)
					x999907_Box(sceneId,selfId,format("#Y我去，你被一包裹砸到头，打开一看里面有#G#{_ITEM%d}#Y * #G%d",nPar1,nPar2))
					Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，被管理员成功发放%d个%s。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,nPar2,GetItemName(sceneId,nPar1))
					CallScriptFunction(999998,"GameLog",sceneId,selfId,2,Logstr)
					--执行完就清空
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,0)
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,0)
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA_2,0)
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,0)
					else
					--执行完就清空
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,0)
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,0)
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA_2,0)
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,0)
					x999907_Box(sceneId,selfId,"请联系管理员重新发放，发放失败，数量发的太多了，或者代码错误。")
				end
			end
		end
		if nEvent == 3 then  --发放金币
			if GUID == GMGUID then
				if GetMoney(sceneId,selfId) + nPar1 >= 2000000000 then
					--上限通知
					x999907_Box(sceneId,selfId,"请联系管理员重新发放，发放失败，发的太多了。")
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,0)
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,0)
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,0)
					return
				end
				AddMoney(sceneId,selfId,nPar1)
				Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，被管理员成功发放%d金。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,nPar1)
				CallScriptFunction(999998,"GameLog",sceneId,selfId,2,Logstr)
				--执行完就清空
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,0)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,0)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,0)
			end
		end
		if nEvent == 4 then  --发放交子
			if GUID == GMGUID then
				if GetMoneyJZ(sceneId,selfId) + nPar1 >= 144000000 then
					--上限通知
					x999907_Box(sceneId,selfId,"请联系管理员重新发放，发放失败，发的太多了。")
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,0)
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,0)
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,0)
					return
				end
				AddMoneyJZ(sceneId,selfId,nPar1)
				x999907_NotifyTip(sceneId,selfId,format("你获得了#{_EXCHG%s}。",nPar1))
				Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，被管理员成功发放%d交子。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,nPar1)
				CallScriptFunction(999998,"GameLog",sceneId,selfId,2,Logstr)
				--执行完就清空
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,0)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,0)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,0)
			end
		end
		if nEvent == 5 then  --发放元宝
			if GUID == GMGUID then
				if YuanBao(sceneId,selfId,-1,3,0) + nPar1 >= 200000000 then
					--上限通知
					x999907_Box(sceneId,selfId,"请联系管理员重新发放，发放失败，发的太多了您当前元宝数量为：#P"..YuanBao(sceneId,selfId,-1,3,0))
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,0)
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,0)
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,0)
					return
				end
				YuanBao(sceneId,selfId,-1,1,nPar1)
				x999907_Box(sceneId,selfId,format("#Y我去，你被一包裹砸到头，打开一看里面有#G%d点元宝。",nPar1))
				Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，被管理员成功发放%d元宝。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,nPar1)
				CallScriptFunction(999998,"GameLog",sceneId,selfId,2,Logstr)
				--执行完就清空
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,0)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,0)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,0)
			end
		end
		if nEvent == 6 then  --发放绑定元宝
			if GUID == GMGUID then
				if BindYuanBao(sceneId,selfId,-1,3,0) + nPar1 >= 200000000 then
					--上限通知
					x999907_Box(sceneId,selfId,"请联系管理员重新发放，发放失败，发的太多了您当前绑定元宝数量为："..BindYuanBao(sceneId,selfId,-1,3,0))
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,0)
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,0)
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,0)
					return
				end
				BindYuanBao(sceneId,selfId,-1,1,nPar1)
				x999907_Box(sceneId,selfId,format("#Y我去，你被一包裹砸到头，打开一看里面有#G%d点绑定元宝。",nPar1))
				Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，被管理员成功发放%d绑定元宝。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,nPar1)
				CallScriptFunction(999998,"GameLog",sceneId,selfId,2,Logstr)
				--执行完就清空
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,0)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,0)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,0)
			end
		end
		if nEvent == 10 then  --设置MD
			if GUID == GMGUID then
				SetMissionData(sceneId,selfId,nPar1,nPar2)
				Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，被管理员将MD编号：%d，数据设置为：%d。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,nPar1,nPar2)
				CallScriptFunction(999998,"GameLog",sceneId,selfId,2,Logstr)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,0)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,0)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA_2,0)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,0)
			end
		end
		-- if nEvent == 11 then  --设置MDEX
			-- if GUID == GMGUID then
				-- SetMissionDataEx(sceneId,selfId,nPar1,nPar2)
				-- Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，被管理员将MDEX编号：%d，数据设置为：%d。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,nPar1,nPar2)
				-- CallScriptFunction(999998,"GameLog",sceneId,selfId,2,Logstr)
				-- LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,0)
				-- LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,0)
				-- LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA_2,0)
				-- LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,0)
			-- end
		-- end
		if nEvent == 12 then  --设置Flag
			if GUID == GMGUID then
				SetMissionFlag(sceneId,selfId,nPar1,nPar2)
				Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，被管理员将FLAG编号：%d，数据设置为：%d。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,nPar1,nPar2)
				CallScriptFunction(999998,"GameLog",sceneId,selfId,2,Logstr)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,0)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,0)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA_2,0)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,0)
			end
		end
		if nEvent == 13 then  --设置属性
			if GUID == GMGUID then
				if GetMissionFlag(sceneId,selfId,319) == 1 then
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,0)
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,0)
					return
				end
				SetMissionFlag(sceneId,selfId,319,1)
				Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，被管理员将设置为超级属性。",nowYear,nowMonth,nowDate,nHour,nMinute,nName)
				CallScriptFunction(999998,"GameLog",sceneId,selfId,2,Logstr)
				LuaFnRefreshHumanData(sceneId,selfId)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,0)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,0)
			end
		end
		if nEvent == 14 then  --发放金币
			if GUID == GMGUID then
				if nPar1 > 119 then
					--上限通知
					x999907_Box(sceneId,selfId,"请联系管理员重新发放，要修改的等级错误。")
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,0)
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,0)
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,0)
					return
				end
				LuaFnHumanLevelUpTo(sceneId,selfId,nPar1) --直接设置等级
				Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，被管理员成功发放%d级。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,nPar1)
				CallScriptFunction(999998,"GameLog",sceneId,selfId,2,Logstr)
				--执行完就清空
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,0)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,0)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,0)
			end
		end
		if nEvent == 16 then  --发放称号
			if GUID == GMGUID then
				if nPar1 < 1000 or nPar1 > 1240 then
					--上限通知
					x999907_Box(sceneId,selfId,"请联系管理员重新发放，要发放的称号失败。")
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,0)
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,0)
					LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,0)
					return
				end
				local retCanAddTitle = LuaFnCanAddTitle( sceneId, selfId,nPar1)
				if retCanAddTitle~= 0  then
					LuaFnAwardCharTitle(sceneId,selfId,nPar1)
					LuaFnSetCurTitleById(sceneId,selfId,nPar1)
					LuaFnDispatchAllTitle(sceneId,selfId,nPar1)
				end
				Logstr = format("[发放时间：%d-%d-%d-%d-%d]，角色名：%s，被管理员成功发放了ID为%d称号。",nowYear,nowMonth,nowDate,nHour,nMinute,nName,nPar1)
				CallScriptFunction(999998,"GameLog",sceneId,selfId,2,Logstr)
				--执行完就清空
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_PUSHEVENT,0)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_DATA,0)
				LuaFnSetWorldGlobalData(W_GIDX_LUAUSE_GUID,0)
			end
		end
--	end
end

--**********************************
--醒目提示
--**********************************
function x999907_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
-- 对话框提示
--**********************************
function x999907_Box(sceneId,selfId,Tip)
	BeginEvent( sceneId )
		AddText( sceneId,Tip)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId,-1 )
end
