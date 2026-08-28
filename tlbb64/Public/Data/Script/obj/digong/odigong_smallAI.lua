--地宫陶俑AI

--脚本号
x891158_g_ScriptId	= 891158
--**********************************
--入口函数
--**********************************
function x891158_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{MJXZ_210510_39}" )
		AddNumText( sceneId, x891158_g_ScriptId, "#{MJXZ_210510_102}", 10, 1 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )	
end
--**********************************
--事件列表选中一项
--**********************************
function x891158_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		--创建新的Monster
		local nCurDataId = GetMonsterDataID(sceneId,targetId)
		local nCurPosX,nCurPosZ = GetWorldPos(sceneId,targetId)
		local nCurDir = GetObjDir(sceneId,targetId)
		local nMonId = CreateMonsterWithDir(sceneId, nCurDataId + 1, nCurPosX, nCurPosZ, 21, -1, x891158_g_ScriptId,nCurDir)
		if nMonId == -1 then
			x891158_NotifyTip( sceneId, selfId, "#{MJXZ_210510_103}" )
			return
		end
		--删除旧的
		LuaFnDeleteMonster(sceneId,targetId)
	end
end

--**********************************
--重置AI....
--**********************************
function x891158_ResetMyAI( sceneId, selfId )
end

--**********************************
--初始化....
--**********************************
function x891158_OnInit(sceneId, selfId)
	--重置AI....
	x891158_ResetMyAI( sceneId, selfId )
end

--**********************************
--心跳....
--**********************************
function x891158_OnHeartBeat(sceneId, selfId, nTick)

	--检测是不是死了....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end	
end

--**********************************
--技能释放成功
--**********************************
function x891158_OnUseSkillSuccess(sceneId, selfId,nSkillId,targetId)
	
end
--**********************************
--进入战斗....
--**********************************
function x891158_OnEnterCombat(sceneId, selfId, enmeyId)
	--发表讲话
	PaoPaoExEx(sceneId,selfId, 429)
end


--**********************************
--离开战斗....
--**********************************
function x891158_OnLeaveCombat(sceneId, selfId)

end


--**********************************
--杀死敌人....
--**********************************
function x891158_OnKillCharacter(sceneId, selfId, targetId)

end

--**********************************
--死亡....
--**********************************
function x891158_OnDie( sceneId, selfId, killerId )
	
end

--**********************************
--对话框提示
--**********************************
function x891158_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

