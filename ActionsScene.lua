--
-- Author: ly
-- Date: 2015-11-02 14:28:50
--
local  ActionsScene = class("ActionsScene", function ()
	return display.newScene("ActionsScene")
end)
--构造函数，当使用ActionsScene.new()会自动调用该函数
function ActionsScene:ctor()
	--添加精灵
	self._birdSprite=display.newSprite("bird.png")
	self._birdSprite:pos(50, 160)
	self:addChild(self._birdSprite)
	--添加按钮
	local btn = cc.ui.UIPushButton.new({normal="newgameA.png",pressed="newgameB.png"})
	btn:onButtonClicked(function (event)
		--切换场景
		local  scene = require("app.scenes.MainScene")
		-- display.replaceScene(scene:new())
		--包装过度效果
		local transition = display.wrapSceneWithTransition(scene:new(),"turnOffTiles", 1)
		display.replaceScene(transition)
		-- -- 创建动作
		-- local _moveto =cc.MoveTo:create(3,cc.p(400,160))
		-- self._birdSprite:runAction(_moveto)
		--使用quick封装的transition来执行一个动作
		-- transition.moveTo(self._birdSprite,{time=3,x=400,y=160})
		transition.execute(self._birdSprite,
							cc.MoveTo:create(3,cc.p(400,160)) ,
							{
							delay=2.0,
							easing="bounceIn",
							onComplete=function ()
							--一般执行一个序列动作
								transition.moveTo(self._birdSprite,{time=3,x=50,y=160})
							end

							})
	end)
	btn:pos(240,50)
	self:add(btn)


end
function ActionsScene:onEnter()
	

end
function ActionsScene:onExit()
	-- body
end
return ActionsScene