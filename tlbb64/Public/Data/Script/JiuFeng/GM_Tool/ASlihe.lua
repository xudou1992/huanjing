--脚本号
x100010_g_scriptId = 100010 --临时写这个,真正用的时候一定要改.

function x100010_Tips( sceneId, selfId,msg )
BeginEvent( sceneId )
		AddText( sceneId, msg)
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


--**********************************
--事件交互入口
--**********************************
function x100010_OnDefaultEvent( sceneId, selfId )
	
end
--**********************************
--只会执行一次入口：
--返回1：处理成功；返回0：处理失败。
--**********************************
function x100010_OnActivateOnce( sceneId, selfId )
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )	
	
	if itemTblIndex== 39910110 then 
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 20200413 )
		return
	end
	

end
function x100010_ClientCall( sceneId, selfId)  
	if CallScriptFunction(999998,"IsGM",sceneId,selfId) ~= 1 then			  
		return
	end		 
	--这里作为GM工具跳转接口
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 316022021)
end
--**********************************
-- 返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x100010_CancelImpacts( sceneId, selfId )
	return 0
end

--**********************************
--消耗检测及处理入口，负责消耗的检测和执行：
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--**********************************
function x100010_OnDeplete( sceneId, selfId )
	
	return 1
end


--**********************************
-- 条件检测入口：返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x100010_OnConditionCheck( sceneId, selfId )
	return 1
end
--**********************************
-- 
--**********************************
function x100010_IsSkillLikeScript( sceneId, selfId)
	return 1
end
function x100010_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end
function x100010_IsOkSpace( sceneId, selfId, PSpace,MSpace )-------检测空间
	if LuaFnGetPropertyBagSpace(sceneId,selfId) <PSpace then
		x100010_Tips( sceneId, selfId, "道具栏空间不足，至少需要"..PSpace.."格" )
		return 0
	end
	if LuaFnGetMaterialBagSpace(sceneId,selfId) <MSpace then
		x100010_Tips( sceneId, selfId, "材料栏空间不足，至少需要"..MSpace.."格" )
		return 0
	end
	return 1
end
