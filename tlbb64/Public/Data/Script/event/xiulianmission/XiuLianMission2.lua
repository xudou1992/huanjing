--MisDescBegin
x891275_g_ScriptId = 891275
x891275_g_MainScriptId = 891272--主脚本号
x891275_g_NpcScriptId = 891273--npc脚本号
x891275_g_KDZZID = 1006000536
x891275_g_KDZZSubID = 2

--任务号
x891275_g_MissionId = 2031
x891275_g_MissionKind = 7
x891275_g_MissionLevel = 60
x891275_g_IfMissionElite = 0

--任务名
x891275_g_MissionName="#{XLRW_210725_473}"
x891275_g_MissionTarget=""
x891275_g_Custom = {}

--任务参数
x891275_g_IsMissionOkFail = 0--是否完成
x891275_g_MissionLiuPai = 1-- 流派
x891275_g_MissionMenPai = 2-- 门派
x891275_g_Param_ItemIndex = 3--目标采集物品索引
x891275_g_Param_Custom = 4--完成情况

--完成任务NPC
x891275_g_AccomplishNPC = {}

--采集列表
x891275_g_ItemList = 
{
	[0] = { 	sceneid = 9, --少林
		list = { 	{npcid=49325,num=3,posx=149,posz=51,name="#{XLRW_210725_291}",posname="#{XLRW_210725_612}",},
							{npcid=49326,num=3,posx=36,posz=155,name="#{XLRW_210725_292}",posname="#{XLRW_210725_613}",},
							{npcid=49327,num=1,posx=47,posz=40,name="#{XLRW_210725_293}",posname="#{XLRW_210725_614}",}, },  },
	[1] = { 	sceneid = 11, --明教
		list = { 	{npcid=49331,num=3,posx=38,posz=33,name="#{XLRW_210725_297}",posname="#{XLRW_210725_618}",},
							{npcid=49332,num=3,posx=32,posz=142,name="#{XLRW_210725_298}",posname="#{XLRW_210725_619}",},
							{npcid=49333,num=1,posx=27,posz=102,name="#{XLRW_210725_299}",posname="#{XLRW_210725_620}",}, },  },
	[2] = { 	sceneid = 10, --丐帮
		list = { 	{npcid=49328,num=3,posx=156,posz=156,name="#{XLRW_210725_294}",posname="#{XLRW_210725_615}",},
							{npcid=49329,num=3,posx=34,posz=123,name="#{XLRW_210725_295}",posname="#{XLRW_210725_616}",},
							{npcid=49330,num=1,posx=157,posz=54,name="#{XLRW_210725_296}",posname="#{XLRW_210725_617}",}, },  },
	[3] = { 	sceneid = 12, --武当
		list = { 	{npcid=49334,num=3,posx=112,posz=162,name="#{XLRW_210725_300}",posname="#{XLRW_210725_621}",},
							{npcid=49335,num=3,posx=114,posz=124,name="#{XLRW_210725_301}",posname="#{XLRW_210725_622}",},
							{npcid=49336,num=1,posx=39,posz=138,name="#{XLRW_210725_302}",posname="#{XLRW_210725_623}",}, },  },
	[4] = { 	sceneid = 15, --峨嵋
		list = { 	{npcid=49343,num=3,posx=149,posz=96,name="#{XLRW_210725_309}",posname="#{XLRW_210725_630}",},
							{npcid=49344,num=3,posx=48,posz=92,name="#{XLRW_210725_310}",posname="#{XLRW_210725_631}",},
							{npcid=49345,num=1,posx=155,posz=35,name="#{XLRW_210725_311}",posname="#{XLRW_210725_632}",}, },  },
	[5] = { 	sceneid = 16, --星宿
		list = { 	{npcid=49346,num=3,posx=82,posz=44,name="#{XLRW_210725_312}",posname="#{XLRW_210725_633}",},
							{npcid=49347,num=3,posx=153,posz=142,name="#{XLRW_210725_313}",posname="#{XLRW_210725_634}",},
							{npcid=49348,num=1,posx=49,posz=129,name="#{XLRW_210725_314}",posname="#{XLRW_210725_635}",}, },  },
	[6] = { 	sceneid = 13, --天龙
		list = { 	{npcid=49337,num=3,posx=163,posz=84,name="#{XLRW_210725_303}",posname="#{XLRW_210725_624}",},
							{npcid=49338,num=3,posx=32,posz=83,name="#{XLRW_210725_304}",posname="#{XLRW_210725_625}",},
							{npcid=49339,num=1,posx=49,posz=138,name="#{XLRW_210725_305}",posname="#{XLRW_210725_626}",}, },  },
	[7] = { 	sceneid = 17, --天山
		list = { 	{npcid=49349,num=3,posx=157,posz=149,name="#{XLRW_210725_315}",posname="#{XLRW_210725_636}",},
							{npcid=49350,num=3,posx=31,posz=155,name="#{XLRW_210725_316}",posname="#{XLRW_210725_637}",},
							{npcid=49351,num=1,posx=78,posz=126,name="#{XLRW_210725_317}",posname="#{XLRW_210725_638}",}, },  },
	[8] = { 	sceneid = 14, --逍遥
		list = { 	{npcid=49340,num=3,posx=155,posz=63,name="#{XLRW_210725_306}",posname="#{XLRW_210725_627}",},
							{npcid=49341,num=3,posx=50,posz=150,name="#{XLRW_210725_307}",posname="#{XLRW_210725_628}",},
							{npcid=49342,num=1,posx=69,posz=141,name="#{XLRW_210725_308}",posname="#{XLRW_210725_629}",}, },  },
	[10] = { 	sceneid = 1283, --曼陀
		list = { 	{npcid=50379,num=3,posx=69,posz=79,name="#{XLRW_210725_745}",posname="#{XLRW_210725_742}",},
							{npcid=50380,num=3,posx=194,posz=84,name="#{XLRW_210725_746}",posname="#{XLRW_210725_743}",},
							{npcid=50381,num=1,posx=127,posz=173,name="#{XLRW_210725_747}",posname="#{XLRW_210725_744}",}, },  },
}

--npc距离
x891275_g_NpcDist = 5
--背包空位
x891275_g_BagSpace = 1

x891275_g_NPCStr = {
	"#{XLRW_210725_675}", "#{XLRW_210725_720}", "#{XLRW_210725_721}"
}

--奖励
--x891275_g_MoneyJZBonus					=	30000
--x891275_g_ExpBonus						= 250000

--MisDescEnd

--目标NPC：接任务、交任务，都是这个
x891275_g_AcceptNpcInfo	= {
	[MP_SHAOLIN] = {sceneId=9, name={[1]="玄阅", [2]="玄篱"}},
	[MP_MINGJIAO] = {sceneId=11, name={[1]="莫思归", [2]="林焱"}},
	[MP_GAIBANG] = {sceneId=10, name={[1]="杜少康", [2]="路老大"}},
	[MP_WUDANG] = {sceneId=12, name={[1]="碧落散人", [2]="逐浪散人"}},
	[MP_EMEI] = {sceneId=15, name={[1]="聚落花", [2]="苏戈"}},
	[MP_XINGSU] = {sceneId=16, name={[1]="蒿莱子", [2]="莲舟子"}},
	[MP_DALI] = {sceneId=13, name={[1]="本喜", [2]="本然"}},
	[MP_TIANSHAN] = {sceneId=17, name={[1]="吴森森", [2]="吴淼淼"}},
	[MP_XIAOYAO] = {sceneId=14, name={[1]="艾凉河", [2]="秦烟萝"}},
	[MP_MANTUO] = {sceneId=1283, name={[1]="嵇聆风", [2]="嵇扶光"}}, --替代2022
}
--**********************************
--接取任务
--**********************************
function x891275_OnAccept(sceneId,selfId,targetId)
	local nCurMenPai = GetMenPai(sceneId,selfId)
	--在门派武道长老处
	local nTalentType = 0
	if x891275_g_AcceptNpcInfo[nCurMenPai] ~= nil then
		for i = 1,2 do
			if GetName(sceneId,targetId) == x891275_g_AcceptNpcInfo[nCurMenPai].name[i] then
				nTalentType = i
				break
			end
		end
	end
	if nTalentType == 0 then
		return
	end
	--距离检测
	if IsInDist(sceneId,selfId,targetId,x891275_g_NpcDist) ~= 1 then
		x891275_NotifyTip( sceneId, selfId, ScriptGlobal_Format("#{XLRW_210725_07}",GetName(sceneId,targetId)) )
		x891275_NotifyBox( sceneId, selfId, targetId, "#{XLRW_210725_08}" )
		return
	end
	-- 等级检测
	if GetLevel(sceneId, selfId) < x891275_g_MissionLevel then
		x891275_NotifyTip( sceneId, selfId, "#{XLRW_210725_05}" )
		x891275_NotifyBox( sceneId, selfId, targetId, "#{XLRW_210725_06}" )
		return
	end
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < x891275_g_BagSpace then
		x891275_NotifyTip( sceneId, selfId, "#{XLRW_210725_16}" )
		x891275_NotifyBox( sceneId, selfId, targetId, "#{XLRW_210725_17}" )
		return
	end
	--已经接了任务了
	if CallScriptFunction(x891275_g_MainScriptId, "CheckAccept",sceneId, selfId) ~= 1 then
		x891275_NotifyTip( sceneId, selfId, "#{XLRW_210725_12}" )
		x891275_NotifyBox( sceneId, selfId, targetId, "#{XLRW_210725_13}" )
		return
	end
	--加入任务到玩家列表
	--LuaFnAddMission参数说明：
	--sceneId, selfId, misId(任务编号), scriptId, k(是否回调x600041_OnKillObject), e(是否回调OnEnterArea), i(是否回调OnItemChange)
	--功能说明：在玩家身上添加misId编号的任务，成功返回1
	local ret = AddMission( sceneId,selfId, x891275_g_MissionId, x891275_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		x891275_NotifyTip( sceneId, selfId, "#{XLRW_210725_14}" )
		x891275_NotifyBox( sceneId, selfId, targetId, "#{XLRW_210725_15}" )
		return
	end
	--随机任务的数据
	local misIndex = GetMissionIndexByID(sceneId,selfId,x891275_g_MissionId)
	local nRandItemIndex = random(1,getn(x891275_g_ItemList[nCurMenPai].list));

	SetMissionByIndex(sceneId,selfId,misIndex,x891275_g_IsMissionOkFail,0)		
	SetMissionByIndex(sceneId,selfId,misIndex,x891275_g_MissionLiuPai,LuaFnGetSectType(sceneId,selfId))
	SetMissionByIndex(sceneId,selfId,misIndex,x891275_g_MissionMenPai,GetMenPai(sceneId,selfId))	
	SetMissionByIndex(sceneId,selfId,misIndex,x891275_g_Param_ItemIndex,nRandItemIndex)	
	SetMissionByIndex(sceneId,selfId,misIndex,x891275_g_Param_Custom,0)		
--	成功接取任务
	BeginEvent(sceneId)
		AddText(sceneId, ScriptGlobal_Format("#{XLRW_210725_18}",x891275_g_MissionName))
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	--显示任务的介绍信息
	--XLRW_210725_20	    #Y%s0#W有助于你修行。你快前往#G%s1#W，采集后交给我。#r    当前任务环数：#G%s2	
	x891275_NotifyBox( sceneId, selfId, targetId, ScriptGlobal_Format("#{XLRW_210725_20}",
		x891275_g_ItemList[nCurMenPai].list[nRandItemIndex].name,
		x891275_g_ItemList[nCurMenPai].list[nRandItemIndex].posname,
		tostring(x891275_GetXiuLianMissionNum(sceneId, selfId))
	))
end
--**********************************
--提交
--**********************************
function x891275_OnSubmit( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
--  if IsMissionHaveDone(sceneId,selfId,x891275_g_MissionId) > 0 then
--    	return 
--	end
	--不存在任务
	if IsHaveMission(sceneId,selfId,x891275_g_MissionId) <= 0 then
		return
	end
	local misIndex = GetMissionIndexByID(sceneId,selfId,x891275_g_MissionId)
	local misCustom = GetMissionParam(sceneId,selfId,misIndex,x891275_g_Param_Custom)
	local misItemIndex = GetMissionParam(sceneId,selfId,misIndex,x891275_g_Param_ItemIndex)
	local nMenPai = GetMissionParam(sceneId,selfId,misIndex,x891275_g_MissionMenPai)
	local misOk = GetMissionParam(sceneId,selfId,misIndex,x891275_g_IsMissionOkFail)
	
	if misCustom < x891275_g_ItemList[nMenPai].list[misItemIndex].num or misOk ~= 1 then
		--赶走		
		x891275_NotifyTip( sceneId, selfId, ScriptGlobal_Format("#{XLRW_210725_138}",tostring(x891275_g_ItemList[nMenPai].list[misItemIndex].num),x891275_g_ItemList[nMenPai].list[misItemIndex].name) )
		
		x891275_NotifyBox( sceneId, selfId, targetId,  "#{XLRW_210725_139}" )
		return
	end

	BeginEvent(sceneId)
		AddText(sceneId, ScriptGlobal_Format("#{XLRW_210725_121}",x891275_g_MissionName))
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
		
	CallScriptFunction(x891275_g_MainScriptId, "OnFinishMission",sceneId, selfId, targetId,x891275_g_MissionId)
end
--**********************************
--任务当前环数
--**********************************
function x891275_GetXiuLianMissionNum(sceneId, selfId)
	local nData = GetMissionData(sceneId, selfId,MD_XIULIAN_MISSION_NUM)
	return mod(nData,1000) + 1
end

--**********************************
--放弃
--**********************************
function x891275_OnAbandon( sceneId, selfId )
	CallScriptFunction(x891275_g_MainScriptId, "OnAbandonMission",sceneId, selfId, x891275_g_MissionId)
end
--**********************************
--目标采集完成
--**********************************
function x891275_PickItemFinish(sceneId, selfId,targetId)
	if IsHaveMission(sceneId,selfId,x891275_g_MissionId) <= 0 then
		x891275_NotifyTip( sceneId, selfId, "#{XLRW_210725_674}" )
		return 0
	end
	local misIndex = GetMissionIndexByID(sceneId,selfId,x891275_g_MissionId)
	local misCustom = GetMissionParam(sceneId,selfId,misIndex,x891275_g_Param_Custom)
	local misItemIndex = GetMissionParam(sceneId,selfId,misIndex,x891275_g_Param_ItemIndex)
	local nMenPai = GetMissionParam(sceneId,selfId,misIndex,x891275_g_MissionMenPai)
	local nLiuPai = GetMissionParam(sceneId,selfId,misIndex,x891275_g_MissionLiuPai)
	
	x891275_NotifyTip( sceneId, selfId, ScriptGlobal_Format("#{XLRW_210725_133}",x891275_g_ItemList[nMenPai].list[misItemIndex].name,tostring(misCustom + 1),x891275_g_ItemList[nMenPai].list[misItemIndex].num) )
	SetMissionByIndex(sceneId,selfId,misIndex,x891275_g_Param_Custom,misCustom + 1)		
	--采集满的提示
	if misCustom + 1 >= x891275_g_ItemList[nMenPai].list[misItemIndex].num then
		local lpname,mpname,mpnpcname,mpnpcnamelink = x891275_GetXiuLianMission_NameStr(nMenPai, nLiuPai)
		x891275_NotifyTip( sceneId, selfId, ScriptGlobal_Format("#{XLRW_210725_135}",lpname) )
		--标记采集任务完成
		SetMissionByIndex(sceneId,selfId,misIndex,x891275_g_IsMissionOkFail,1)		
	end
	--特效
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
end
--**********************************
--是否可采集目标物检测
--**********************************
function x891275_CanPickCheck(sceneId, selfId,targetId)
	-- 等级检测
	if GetLevel(sceneId, selfId) < x891275_g_MissionLevel then
		x891275_NotifyTip( sceneId, selfId, "#{XLRW_210725_126}" )
		return 0
	end
	if IsHaveMission(sceneId,selfId,x891275_g_MissionId) <= 0 then
		x891275_NotifyTip( sceneId, selfId, "#{XLRW_210725_674}" )
		return 0
	end
	local misIndex = GetMissionIndexByID(sceneId,selfId,x891275_g_MissionId)
	local misCustom = GetMissionParam(sceneId,selfId,misIndex,x891275_g_Param_Custom)
	local misItemIndex = GetMissionParam(sceneId,selfId,misIndex,x891275_g_Param_ItemIndex)
	local nMenPai = GetMissionParam(sceneId,selfId,misIndex,x891275_g_MissionMenPai)
	if misCustom >= x891275_g_ItemList[nMenPai].list[misItemIndex].num then
		x891275_NotifyTip( sceneId, selfId, ScriptGlobal_Format("#{XLRW_210725_128}",x891275_g_ItemList[nMenPai].list[misItemIndex].name) )
		return 0
	end
	--检测目标距离
	if IsInDist(sceneId,selfId,targetId,x891275_g_NpcDist) ~= 1 then
		x891275_NotifyTip( sceneId, selfId, "#{XLRW_210725_129}" )
		return 0
	end
	--不是这个对象？
	if GetMonsterDataID(sceneId,targetId) ~= x891275_g_ItemList[nMenPai].list[misItemIndex].npcid then
		x891275_NotifyTip( sceneId, selfId, "#{XLRW_210725_674}" )
		return 0
	end
	
	if LuaFnIsRiding( sceneId, selfId ) == 1 then 
		x891275_NotifyTip( sceneId, selfId, "#{XLRW_210725_130}" )
		return 0
	elseif LuaFnIsModelOrMount( sceneId, selfId ) == 1 then
		x891275_NotifyTip( sceneId, selfId, "#{XLRW_210725_132}" )
		return 0
	end
	
	if IsTeamFollow( sceneId, selfId ) == 1 then
		x891275_NotifyTip( sceneId, selfId, "#{XLRW_210725_131}" )
		return 0
	end
	
	return 1;
end

--**********************************
--获取门派流派长老名称
--**********************************
function x891275_GetXiuLianMission_NameStr( menpaiid, liupaiid )--流派名 门派名 流派npc名
	local g_MenPaiNpcA = {
		[0] = {str = "#{XLRW_210725_246}", strlink = "#{XLRW_210725_523}", liupainame = "#{XLRW_210725_481}", mpname = "#{XLRW_210725_43}"},--少林
		[1] = {str = "#{XLRW_210725_250}", strlink = "#{XLRW_210725_527}", liupainame = "#{XLRW_210725_485}", mpname = "#{XLRW_210725_38}"},--明教
		[2] = {str = "#{XLRW_210725_248}", strlink = "#{XLRW_210725_525}", liupainame = "#{XLRW_210725_483}", mpname = "#{XLRW_210725_39}"},--丐帮
		[3] = {str = "#{XLRW_210725_251}", strlink = "#{XLRW_210725_528}", liupainame = "#{XLRW_210725_486}", mpname = "#{XLRW_210725_40}"},--武当
		[4] = {str = "#{XLRW_210725_257}", strlink = "#{XLRW_210725_534}", liupainame = "#{XLRW_210725_492}", mpname = "#{XLRW_210725_35}"},--峨嵋
		[5] = {str = "#{XLRW_210725_259}", strlink = "#{XLRW_210725_536}", liupainame = "#{XLRW_210725_494}", mpname = "#{XLRW_210725_41}"},--星宿
		[6] = {str = "#{XLRW_210725_253}", strlink = "#{XLRW_210725_530}", liupainame = "#{XLRW_210725_488}", mpname = "#{XLRW_210725_42}"},--天龙
		[7] = {str = "#{XLRW_210725_261}", strlink = "#{XLRW_210725_538}", liupainame = "#{XLRW_210725_496}", mpname = "#{XLRW_210725_36}"},--天山
		[8] = {str = "#{XLRW_210725_255}", strlink = "#{XLRW_210725_532}", liupainame = "#{XLRW_210725_490}", mpname = "#{XLRW_210725_37}"},--逍遥
		[10] = {str = "#{XLRW_210725_770}", strlink = "#{XLRW_210725_735}", liupainame = "#{XLRW_210725_737}", mpname = "#{XLRW_210725_741}"},--曼陀山庄
	}

	local g_MenPaiNpcB = {
		[0] = {str = "#{XLRW_210725_245}", strlink = "#{XLRW_210725_522}", liupainame = "#{XLRW_210725_480}", mpname = "#{XLRW_210725_43}"},--少林
		[1] = {str = "#{XLRW_210725_249}", strlink = "#{XLRW_210725_526}", liupainame = "#{XLRW_210725_484}", mpname = "#{XLRW_210725_38}"},--明教
		[2] = {str = "#{XLRW_210725_247}", strlink = "#{XLRW_210725_524}", liupainame = "#{XLRW_210725_482}", mpname = "#{XLRW_210725_39}"},--丐帮
		[3] = {str = "#{XLRW_210725_252}", strlink = "#{XLRW_210725_529}", liupainame = "#{XLRW_210725_487}", mpname = "#{XLRW_210725_40}"},--武当
		[4] = {str = "#{XLRW_210725_258}", strlink = "#{XLRW_210725_535}", liupainame = "#{XLRW_210725_493}", mpname = "#{XLRW_210725_35}"},--峨嵋
		[5] = {str = "#{XLRW_210725_260}", strlink = "#{XLRW_210725_537}", liupainame = "#{XLRW_210725_495}", mpname = "#{XLRW_210725_41}"},--星宿
		[6] = {str = "#{XLRW_210725_254}", strlink = "#{XLRW_210725_531}", liupainame = "#{XLRW_210725_489}", mpname = "#{XLRW_210725_42}"},--天龙
		[7] = {str = "#{XLRW_210725_262}", strlink = "#{XLRW_210725_539}", liupainame = "#{XLRW_210725_497}", mpname = "#{XLRW_210725_36}"},--天山
		[8] = {str = "#{XLRW_210725_256}", strlink = "#{XLRW_210725_533}", liupainame = "#{XLRW_210725_491}", mpname = "#{XLRW_210725_37}"},--逍遥
		[10] = {str = "#{XLRW_210725_771}", strlink = "#{XLRW_210725_736}", liupainame = "#{XLRW_210725_738}", mpname = "#{XLRW_210725_741}"},--曼陀山庄
	}
	local g_LiuPaiA = 0
	local g_LiuPaiB = 1
	if liupaiid == g_LiuPaiA and g_MenPaiNpcA[menpaiid] ~= nil then
		return g_MenPaiNpcA[menpaiid].liupainame, g_MenPaiNpcA[menpaiid].mpname, g_MenPaiNpcA[menpaiid].str, g_MenPaiNpcA[menpaiid].strlink
	end
	if liupaiid == g_LiuPaiB and g_MenPaiNpcB[menpaiid] ~= nil then
		return g_MenPaiNpcB[menpaiid].liupainame, g_MenPaiNpcB[menpaiid].mpname, g_MenPaiNpcB[menpaiid].str , g_MenPaiNpcB[menpaiid].strlink
	end
	return "","",""
end

--**********************************
--对话窗口信息提示
--**********************************
function x891275_NotifyBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x891275_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
