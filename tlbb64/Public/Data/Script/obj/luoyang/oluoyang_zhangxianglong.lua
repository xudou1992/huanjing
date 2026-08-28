--脚本号
x000158_g_scriptId = 000158
--**********************************
--事件交互入口
--**********************************
function x000158_OnDefaultEvent( sceneId, selfId, targetId)
	BeginEvent(sceneId)  
		AddText(sceneId, "#{ZBDW_091105_1}")
        AddNumText(sceneId, x000158_g_scriptId,"雕纹合成", 6, 1)
		AddNumText(sceneId, x000158_g_scriptId,"雕纹蚀刻", 6, 2)
--		AddNumText(sceneId, x000158_g_scriptId,"#G雕纹融合", 6, 3)
		AddNumText(sceneId, x000158_g_scriptId,"雕纹强化", 6, 4)
		AddNumText(sceneId, x000158_g_scriptId,"#{DWZY_141216_02}", 6, 5)
		AddNumText(sceneId, x000158_g_scriptId,"雕纹拆除", 6, 6)
		AddNumText(sceneId, x000158_g_scriptId,"#G雕纹拆解", 6, 7)
		AddNumText(sceneId, x000158_g_scriptId,"关于装备雕纹", 11, 8)
--		AddNumText(sceneId, x000158_g_scriptId,"关于双极雕纹", 11, 9)
		
--		AddNumText(sceneId, x000158_g_scriptId,"#G测试", 11, 100)
		EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x000158_OnEventRequest( sceneId, selfId, targetId, eventId )
	local key=GetNumText()
	if key == 100 then
--		AddMoney(sceneId,selfId,1000000)
--		TryRecieveItem( sceneId, selfId, 10210020, 1)
--		TryRecieveItem( sceneId, selfId, 10211020, 1)
--		TryRecieveItem( sceneId, selfId, 10212020, 1)
--		
--		TryRecieveItem( sceneId, selfId, 30110431, 1)
--		
--		TryRecieveItem( sceneId, selfId, 38001002, 1)
--		
--		BeginAddItem(sceneId)
--			AddItem( sceneId, 50314001, 1 )
--			AddBindItem( sceneId, 50314001, 1 )
----			AddItem( sceneId, 20502013, 20 )
--		EndAddItem(sceneId,selfId)
--		AddItemListToHuman(sceneId,selfId)
--		LuaFnCanAddTitle(sceneId,selfId,1032)
--		LuaFnAwardCharTitle(sceneId,selfId,1032)
--		LuaFnSetCurTitleById( sceneId, selfId, 1032 )
--		LuaFnDispatchAllTitle(sceneId, selfId)
--		LuaFnTryRecieveMultiItem(sceneId,selfId,50314001,1,2,1)
		--周活跃数据埋点
--		LuaFnFinishZhouHuoYueMission(sceneId,selfId,12)
	end
	if key==9999 then
		x000158_CloseMe(sceneId, selfId)
	elseif key==1 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000156)
	elseif key==2 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 2000156)
--	elseif key==3 then
--		BeginUICommand(sceneId)
--			UICommand_AddInt(sceneId,targetId)
--		EndUICommand(sceneId)
--		DispatchUICommand(sceneId,selfId, 20140820)
	elseif key==4 then --雕纹强化
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 3000156)
	elseif key==5 then --雕纹转移
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,1)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 20141216)--3770156
	elseif key==6 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 4000156)
	elseif key==7 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 20140612)
	elseif key==8 then
		BeginEvent(sceneId)     
			AddText(sceneId, "#{ZBDW_091105_21}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
--	elseif key==9 then
--		BeginEvent(sceneId)     
--			AddText(sceneId, "#{SSXDW_140819_32}")
--		EndEvent(sceneId)
--		DispatchEventList(sceneId,selfId,targetId)
	end
end
--**********************************
--对话窗口信息提示
--**********************************
function x000158_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end


--**********************************
--醒目提示
--**********************************
function x000158_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
--关闭对话框
--**********************************
function x000158_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end