package 
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.events.TimerEvent; 
    import flash.utils.Timer;
	import flash.system.Capabilities;
	
	/**
	 * ...
	 * @author sq
	 */
	public class Splash extends Sprite
	{
		private var q:int;
		
		public function Splash(i:int) 
		{
			q = i;
			var request:URLRequest;
			//addChild(new background());
			if (i == 1) {
				request = new URLRequest("Splash.swf");
			} else if (i == 2) {
				request = new URLRequest("SplashOlimpiade.swf");
			}
			var loader:Loader = new Loader();
			loader.load(request);
			
			addChild(loader);
			var minuteTimer:Timer = new Timer(6000, 1);
			
			// designates listeners for the interval and completion events
			//minuteTimer.addEventListener(TimerEvent.TIMER, onTick); 
            minuteTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
			
			// starts the timer ticking 
            minuteTimer.start(); 
		}
 
        public function onTimerComplete(event:TimerEvent):void 
        { 
			removeChildren();
			switch(q) {
				case 1:
					addChild(new QuizState());
					break;
				case 2:
					addChild(new FormLogin());
					break;
				default:
					break;
			}
			removeEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
        } 
		
	}

}