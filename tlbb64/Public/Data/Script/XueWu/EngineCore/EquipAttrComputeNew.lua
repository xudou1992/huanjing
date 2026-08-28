--===================================================
-- 人物装备属性计算 EQUIP_COMPUTE
-- @雪舞制作 2025-12-20 V1.2
--===================================================

--**********************************
--刷新人物属性函数
--**********************************
function x866010_StartComputeHumanData(sceneId,selfId,Update)
	if sceneId < 0 or selfId < 14999 or selfId > 29999 then
		return
	end
	
	if LuaFnIsObjValid(sceneId,selfId) ~= 1 or LuaFnIsCanDoScriptLogic(sceneId,selfId) ~= 1 then 
		return
	end
	
	local nLevel = GetLevel(sceneId,selfId)		

	--**********************************
	--基础属性
	--**********************************
	local STR,SPR,CON,INT,DEX,HP,MP,HP_PERSENT = 0,0,0,0,0,0,0,0
	
	--百分比血上限
	HP_PERSENT = 0
	--血量：
	HP  = 0
	--蓝量：
	MP  = 0
	--力量：
	STR = 0
	--灵气：
	SPR = 0
	--体力：
	CON = 0
	--定力：
	INT = 0
	--身法：
	DEX = 0
	
	--**********************************
	--二级属性
	--**********************************
	local AttackPhysics,AttackMagic,DefencePhysics,DefenceMagic,Hit,Miss,CriticalAttack,CriticalDefence = 0,0,0,0,0,0,0,0
	--外功攻击：
	AttackPhysics 	= 0
	--内功攻击：
	AttackMagic 	= 0
	--外功防御：
	DefencePhysics 	= 0
	--内功防御：
	DefenceMagic 	= 0
	--命中：
	Hit 			= 0
	--闪避：
	Miss 			= 0
	--会心攻击：
	CriticalAttack 	= 0
	--会心防御：
	CriticalDefence = 0
	
	--**********************************
	--冰火玄毒属性：属性攻击
	--**********************************
	local IceAttack,FireAttack,LightAttack,PosionAttack = 0,0,0,0
	IceAttack 		= 0
	FireAttack 		= 0
	LightAttack 	= 0
	PosionAttack 	= 0
	
	--**********************************
	--冰火玄毒属性：属性抗
	--**********************************
	local IceDefence,FireDefence,LightDefence,PosionDefence = 0,0,0,0
	IceDefence 		= 0
	FireDefence 	= 0
	LightDefence 	= 0
	PosionDefence 	= 0

	--**********************************
	--属性减抗
	--**********************************
	local IceSubDefence,FireSubDefence,LightSubDefence,PosionSubDefence = 0,0,0,0
	IceSubDefence 		= 0 	
	FireSubDefence 		= 0 	
	LightSubDefence 	= 0 		
	PosionSubDefence 	= 0 	
	
	--**********************************
	--属性减抗下限
	--**********************************
	local IceSubDefenceLimit,FireSubDefenceLimit,LightSubDefenceLimit,PosionSubDefenceLimit = 0,0,0,0
	IceSubDefenceLimit = 0
	FireSubDefenceLimit = 0
	LightSubDefenceLimit = 0
	PosionSubDefenceLimit = 0

	--**********************************
	--引擎计算部分
	--**********************************
	--百分比增加血上限
	SetMissionDataEx(sceneId,selfId,SYS_MAX_HP_PERSENT,HP_PERSENT)
	--血上限
	SetMissionDataEx(sceneId,selfId,SYS_MAX_HP,HP)	
	--气上限
	SetMissionDataEx(sceneId,selfId,SYS_MAX_MP,MP)	
	
	--一级属性
	SetMissionDataEx(sceneId,selfId,SYS_STR,STR)
	SetMissionDataEx(sceneId,selfId,SYS_SPR,SPR)
	SetMissionDataEx(sceneId,selfId,SYS_CON,CON)
	SetMissionDataEx(sceneId,selfId,SYS_INT,INT)
	SetMissionDataEx(sceneId,selfId,SYS_DEX,DEX)
	
	--二级属性
	SetMissionDataEx(sceneId,selfId,SYS_WG,AttackPhysics)
	SetMissionDataEx(sceneId,selfId,SYS_WF,DefencePhysics)
	SetMissionDataEx(sceneId,selfId,SYS_NG,AttackMagic)
	SetMissionDataEx(sceneId,selfId,SYS_NF,DefenceMagic)
	SetMissionDataEx(sceneId,selfId,SYS_MISS,Miss)
	SetMissionDataEx(sceneId,selfId,SYS_HIT,Hit)
	SetMissionDataEx(sceneId,selfId,SYS_HUIXINGONG,CriticalAttack)
	SetMissionDataEx(sceneId,selfId,SYS_HUIXINFANG,CriticalDefence)
	
	--属性攻击
	SetMissionDataEx(sceneId,selfId,SYS_ICE_ATTR,IceAttack)
	SetMissionDataEx(sceneId,selfId,SYS_FIRE_ATTR,FireAttack)
	SetMissionDataEx(sceneId,selfId,SYS_LIGHT_ATTR,LightAttack)
	SetMissionDataEx(sceneId,selfId,SYS_POSION_ATTR,PosionAttack)
	
	--属性减免 抗性
	SetMissionDataEx(sceneId,selfId,SYS_ICE_DEC,IceDefence)
	SetMissionDataEx(sceneId,selfId,SYS_FIRE_DEC,FireDefence)
	SetMissionDataEx(sceneId,selfId,SYS_LIGHT_DEC,LightDefence)
	SetMissionDataEx(sceneId,selfId,SYS_POSION_DEC,PosionDefence)
	
	--减抗
	SetMissionDataEx(sceneId,selfId,SYS_ICE_SUB_DEC,IceSubDefence)
	SetMissionDataEx(sceneId,selfId,SYS_FIRE_SUB_DEC,FireSubDefence)
	SetMissionDataEx(sceneId,selfId,SYS_LIGHT_SUB_DEC,LightSubDefence)
	SetMissionDataEx(sceneId,selfId,SYS_POSION_SUB_DEC,PosionSubDefence)
	
	--减抗下限
	SetMissionDataEx(sceneId,selfId,SYS_ICE_SUB_LIMIT,IceSubDefenceLimit)
	SetMissionDataEx(sceneId,selfId,SYS_FIRE_SUB_LIMIT,FireSubDefenceLimit)
	SetMissionDataEx(sceneId,selfId,SYS_LIGHT_SUB_LIMIT,LightSubDefenceLimit)
	SetMissionDataEx(sceneId,selfId,SYS_POSION_SUB_LIMIT,PosionSubDefenceLimit)

	--GM超级属性
	-- if GetMissionFlag(sceneId,selfId,MF_GM_ATTRMAX) == 1 then
		-- x866010_GM_ATTRMAX(sceneId,selfId)
	-- end
	
	--刷新引擎人物结算属性
	if Update ~= nil then
		LuaFnRefreshEngine( sceneId, selfId )
	end
	
	--刷新角色评分
	-- x866010_LuaFnGetEquipGride(sceneId,selfId)	
end

--**********************************
--GM超级属性
--**********************************
function x866010_GM_ATTRMAX(sceneId,selfId)	
	SetMissionData(sceneId,selfId,SYS_MAX_HP,55800000)
	SetMissionData(sceneId,selfId,SYS_MAX_MP,5000000)
	--一级属性
	SetMissionDataEx(sceneId,selfId,SYS_STR,19500)
	SetMissionDataEx(sceneId,selfId,SYS_SPR,19500)
	SetMissionDataEx(sceneId,selfId,SYS_CON,19500)
	SetMissionDataEx(sceneId,selfId,SYS_INT,19500)
	SetMissionDataEx(sceneId,selfId,SYS_DEX,19500)
	
	--属性攻击
	SetMissionDataEx(sceneId,selfId,SYS_ICE_ATTR,198808)
	SetMissionDataEx(sceneId,selfId,SYS_FIRE_ATTR,198808)
	SetMissionDataEx(sceneId,selfId,SYS_LIGHT_ATTR,198808)
	SetMissionDataEx(sceneId,selfId,SYS_POSION_ATTR,198088)	
	--属性减免
	SetMissionDataEx(sceneId,selfId,SYS_ICE_DEC,1024)
	SetMissionDataEx(sceneId,selfId,SYS_FIRE_DEC,1024)
	SetMissionDataEx(sceneId,selfId,SYS_LIGHT_DEC,1024)
	SetMissionDataEx(sceneId,selfId,SYS_POSION_DEC,1024)
	--减抗
	SetMissionDataEx(sceneId,selfId,SYS_ICE_SUB_DEC,1024)
	SetMissionDataEx(sceneId,selfId,SYS_FIRE_SUB_DEC,1024)
	SetMissionDataEx(sceneId,selfId,SYS_LIGHT_SUB_DEC,1024)
	SetMissionDataEx(sceneId,selfId,SYS_POSION_SUB_DEC,1024)
	--减抗下限
	SetMissionDataEx(sceneId,selfId,SYS_ICE_SUB_LIMIT,100)
	SetMissionDataEx(sceneId,selfId,SYS_FIRE_SUB_LIMIT,100)
	SetMissionDataEx(sceneId,selfId,SYS_LIGHT_SUB_LIMIT,100)
	SetMissionDataEx(sceneId,selfId,SYS_POSION_SUB_LIMIT,100)
end


--**********************************
-- 屏幕中间提示
--**********************************
function x866010_Tips(sceneId,selfId,msg)
	BeginEvent(sceneId)
		AddText(sceneId,msg);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end