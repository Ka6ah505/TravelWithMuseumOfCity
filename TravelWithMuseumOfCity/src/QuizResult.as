package 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author sq
	 */
	public class QuizResult extends Sprite
	{
		
		private var tf:TextField = new TextField();
		private var backButton:Button;
		
		public function QuizResult(i:int) 
		{
			super();
			init(i);
		}
		
		private function init(i:int):void {
			var bg:backgroundGame = new backgroundGame();
			tf.x = this.width/2;
			tf.y = this.height/2;
			tf.height = 30;
			tf.width = 300;
			tf.text = "Вот и всё!!! Верных ответов: " + i;
			
			backButton = new Button();
			backButton.x = 50;
			backButton.y = 300;
			backButton.width = 300;
			backButton.height = 100;
			backButton.label = "НАЗАД";
			backButton.addEventListener(MouseEvent.CLICK, handlerButton);
			
			addChild(bg);
			addChild(tf);
			addChild(backButton);
		}
		
		private function handlerButton(Event:MouseEvent):void {	
			removeChildren();
			addChild(new MainMenu());
		}
	}

}