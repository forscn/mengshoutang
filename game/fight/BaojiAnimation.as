/**
 * Created by Administrator on 2014/6/22.
 */
package game.fight
{
	import game.manager.AssetMgr;

	import starling.animation.Transitions;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;

	public class BaojiAnimation extends Sprite
	{
		public function BaojiAnimation()
		{
			_number = new Image(AssetMgr.instance.getTexture("baoji"));
			addChild(_number);
			Starling.juggler.tween(_number, 0.3, {y: -80, scaleX: 1, scaleY: 1, onComplete: onTweenComplete, transition: Transitions.EASE_IN});
		}
		private var _number : Image;

		private function onTweenComplete() : void
		{
			Starling.juggler.delayCall(delay, 0.5);

			function delay() : void
			{
				Starling.juggler.tween(_number, 0.3, {y: -120, alpha: 0, onComplete: remove, transition: Transitions.EASE_OUT});
			}
		}

		private function remove() : void
		{
			this.removeFromParent(true);
		}

		override public function dispose() : void
		{
			_number && Starling.juggler.removeTweens(_number);
			_number && _number.removeFromParent(true);
			super.dispose();
		}
	}
}
