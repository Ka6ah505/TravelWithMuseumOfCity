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
	public class QuizResult extends Sprite
	{
		
		private var tfResult:TextField = new TextField();
		private var tfCorrectAnswer:TextField = new TextField();
		private var tfInviation:TextField = new TextField();
		private var backButton:Button;
		private var inviateButton:Button;
		
		public function QuizResult(i:int) {
			super();
			init(i);
		}
		
		private function init(i:int):void {
			var bg:backgroundGame = new backgroundGame();
			bg.width = Capabilities.screenResolutionY;
			bg.height = Capabilities.screenResolutionY;
			addChild(bg);
			// настройка текста
			tfResult.x = bg.width / 3 - 70;
			tfResult.y = bg.width / 24;
			tfResult.height = 1000;
			tfResult.width = 600;
			tfResult.multiline = true;
			tfResult.wordWrap = true;
			tfResult.mouseEnabled = false;
			
			tfCorrectAnswer.x = bg.width / 3 - 70;
			tfCorrectAnswer.y = bg.width / 8;
			tfCorrectAnswer.height = 100;
			tfCorrectAnswer.width = 600;
			tfCorrectAnswer.multiline = true;
			tfCorrectAnswer.wordWrap = true;
			tfCorrectAnswer.mouseEnabled = false;
			
			tfInviation.x = bg.width / 3 - 70;
			tfInviation.y = bg.width / 1.4;
			tfInviation.height = 100;
			tfInviation.width = 600;
			tfInviation.multiline = true;
			tfInviation.wordWrap = true;
			tfInviation.mouseEnabled = false;
			
			//настройка формата текста
			var format:TextFormat = new TextFormat();
            format.font = "Verdana";
            format.color = 0x0000FF;
            format.size = 20;
			format.bold = true;
            //format.underline = true;
			tfResult.defaultTextFormat = format;
			tfCorrectAnswer.defaultTextFormat = format;
			tfInviation.defaultTextFormat = format;
			
			//настройка кнопки
			var _colors:Array = [0xFfffff, 0xEC748B, 0xC13A59, 0xA81230];
			backButton = new Button(_colors);
			backButton.width = 180;
			backButton.height = 50;
			
			backButton.label = Language.getText(Language.BACK_STATE);
			backButton.addEventListener(MouseEvent.CLICK, handlerButton);
			
			//var _colors:Array = [0xFfffff, 0xEC748B, 0xC13A59, 0xA81230];
			inviateButton = new Button(_colors);
			inviateButton.width = 180;
			inviateButton.height = 50;
			inviateButton.x = bg.width / 3 + bg.width/4;
			inviateButton.y = bg.width / 1.23;
			inviateButton.label = Language.getText(Language.INVITATIONB);
			
			if (i < 5) {
				tfResult.text = Language.getText(Language.QUESTIONS_ANSWER_Bad);
				backButton.x = backButton.width/5+ bg.width / 3;
				backButton.y = bg.width / 1.23;
				//tfInviation.text = Language.getText(Language.INVITATION);
			} else if (i >= 5 && i <= 9) {
				tfResult.text = Language.getText(Language.QUESTIONS_ANSWER_Good);
				tfInviation.text = Language.getText(Language.INVITATION);
				backButton.x = bg.width / 3 - bg.width/7;
				backButton.y = bg.width / 1.23;
				addChild(inviateButton);
			} else { 
				tfResult.text = Language.getText(Language.QUESTIONS_ANSWER_Perfect);
				tfInviation.text = Language.getText(Language.INVITATION);
				backButton.x = bg.width / 3 - bg.width/7;
				backButton.y = bg.width / 1.23;
				addChild(inviateButton);
			}
			tfCorrectAnswer.text = Language.getText(Language.RESULT_TEXT) + i + Language.getText(Language.RESULT_TEXT_SECOND);
			tfResult.mouseEnabled = false;
			
			// добавление элементов на экран
			
			addChild(tfResult);
			addChild(tfCorrectAnswer);
			addChild(tfInviation);
			addChild(backButton);
			
			var puzzle:PuzzleApp = new PuzzleApp(bg.width / 3, bg.width / 3.6, i, "normal");
			
			addChild(puzzle);
		}
		
		private function handlerButton(Event:MouseEvent):void {	
			this.removeChildren();
			if (Event.target == backButton) {
				addChild(new MainMenu());
			} else {
				addChild(new HightQuizState());
			}
			
		}
	}

}