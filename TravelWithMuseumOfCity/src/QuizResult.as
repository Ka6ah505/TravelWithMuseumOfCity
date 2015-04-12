package 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	import flash.display.Stage;
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
			tf.x = 70;
			tf.y = 100;
			tf.height = 30;
			tf.width = 400;
			
			tf.multiline = true;
			
			var format:TextFormat = new TextFormat();
            format.font = "Verdana";
            format.color = 0xFF0000;
            format.size = 20;
            format.underline = true;
			tf.defaultTextFormat = format;
			tf.text = "Вот и всё!!! Верных ответов: " + i;
			
			backButton = new Button();
			backButton.x = 200;
			backButton.y = 200;
			backButton.width = 200;
			backButton.height = 50;
			backButton.label = "НАЗАД";
			backButton.addEventListener(MouseEvent.CLICK, handlerButton);
			
			addChild(bg);
			addChild(tf);
			addChild(backButton);
		}
		
		private function handlerButton(Event:MouseEvent):void {	
			this.removeChildren();
			addChild(new MainMenu());
		}
	}

}