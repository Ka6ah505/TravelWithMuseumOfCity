package 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	import flash.display.Stage;
	import puzzle.PuzzleApp;
	import flash.system.Capabilities;
	
	/**
	 * ...
	 * @author sq
	 */
	public class HightQuizResult extends Sprite 
	{
		private var tfResult:TextField = new TextField();
		private var backButton:Button;
		
		public function HightQuizResult(i:int) 
		{
			super();
			init(i);
		}
		
		private function init(answer:int):void {
			var bg:backgroundGame = new backgroundGame();
			bg.width = Capabilities.screenResolutionY;
			bg.height = Capabilities.screenResolutionY;
			// настройка текста
			tfResult.x = bg.width / 3 - 70;
			tfResult.y = bg.width / 7.5;
			tfResult.height = 100;
			tfResult.width = 600;
			tfResult.multiline = true;
			tfResult.wordWrap = true;
			tfResult.mouseEnabled = false;
			
			//настройка формата текста
			var format:TextFormat = new TextFormat();
            format.font = "Verdana";
            format.color = 0x0000FF;
            format.size = 20;
			format.bold = true;
            format.underline = true;
			tfResult.defaultTextFormat = format;
			tfResult.text = ""+answer;
			/*if (i < 5) {
				tfResult.text = Language.getText(Language.QUESTIONSANSWER_Bad) +"\n"+ Language.getText(Language.RESULT_TEXT) + i;
			} else if (i >= 5 && i <= 9) {
				tfResult.text = Language.getText(Language.QUESTIONS_ANSWER_Good) +"\n"+ Language.getText(Language.RESULT_TEXT) + i;
			} else {
				tfResult.text = Language.getText(Language.QUESTIONS_ANSWER_Perfect) +"\n"+ Language.getText(Language.RESULT_TEXT) + i;
			}*/
			
			tfResult.mouseEnabled = false;
			
			//настройка кнопки
			var _colors:Array = [0xFfffff, 0xEC748B, 0xC13A59, 0xA81230];
			backButton = new Button(_colors);
			backButton.width = 180;
			backButton.height = 50;
			backButton.x = backButton.width/5 + bg.width / 3;
			backButton.y = bg.width / 1.23;
			backButton.label = Language.getText(Language.BACK_STATE);
			backButton.addEventListener(MouseEvent.CLICK, handlerButton);
			
			// добавление элементов на экран
			addChild(bg);
			addChild(tfResult);
			addChild(backButton);
			var puzzle:PuzzleApp = new PuzzleApp(bg.width / 3, bg.width / 2.6, answer, "hight");
			
			addChild(puzzle);
		}
		
		private function handlerButton(Event:MouseEvent):void {	
			this.removeChildren();
			addChild(new MainMenu());
		}
	}

}