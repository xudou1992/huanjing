--测试脚本 程序
x777778_g_scriptId=777778

--白狐
x777778_g_WFox = {
	49745
}

function get8PointsAround(centerX, centerZ, a)
    local inv_s2 = 1 / sqrt(2)    -- ≈0.70710678118655
	local d = a * inv_s2

	local dirs = {
		{  a,  0},  -- 东
		{  d,  d},  -- 东北
		{  0,  a},  -- 北
		{-d,  d},   -- 西北
		{-a,  0},   -- 西
		{-d, -d},   -- 西南
		{  0, -a},  -- 南
		{ d, -d},   -- 东南
	}

	local pts = {}
	for i, off in dirs do
		-- 四舍五入到整数
		local x = floor(centerX + off[1] + 0.5)
		local z = floor(centerZ + off[2] + 0.5)
		pts[i] = { x = x, z = z }
	end
	return pts
end
--**********************************
--事件交互入口
--**********************************
function x777778_DebugBegin(sceneId,selfId)
	 
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x777778_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end