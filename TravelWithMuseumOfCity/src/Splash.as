package 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.events.TimerEvent; 
    import flash.utils.Timer;
	
	/**
	 * ...
	 * @author sq
	 */
	public class Splash extends Sprite
	{
		
		public function Splash() 
		{
			addChild(new background());
			var tf:TextField = new TextField();
			tf.text = "Готов помучаться?";
			tf.x = 100;
			tf.y = 300;
			tf.textHeight = 20;
			tf.textWidth = 20;
			tf.width = 400;
			tf.height 400;
			addChild(tf);
			// creates a new five-second Timer 
			var minuteTimer:Timer = new Timer(1000, 1);
			
			// designates listeners for the interval and completion events
			//minuteTimer.addEventListener(TimerEvent.TIMER, onTick); 
            minuteTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
			
			// starts the timer ticking 
            minuteTimer.start(); 
		}
		
		public function onTick(event:TimerEvent):void  
        { 
            // displays the tick count so far 
            // The target of this event is the Timer instance itself. 
            trace("tick " + event.target.currentCount); 
        } 
 
        public function onTimerComplete(event:TimerEvent):void 
        { 
			removeChildren();
			addChild(new QuizState());
            trace("Time's Up!"); 
        } 
		
	}

}