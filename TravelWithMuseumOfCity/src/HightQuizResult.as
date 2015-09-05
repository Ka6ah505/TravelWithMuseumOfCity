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
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	/**
	 * ...
	 * @author sq
	 */
	public class HightQuizResult extends Sprite 
	{
		private var tfResult:TextField = new TextField();
		private var tfInviation:TextField = new TextField();
		private var backButton:Button;
		private var feedbackButton:Button;
		
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
			
			tfResult.text = Language.getText(Language.RESULT_TEXT) + answer + Language.getText(Language.RESULT_TEXT_SECOND);;
			
			tfResult.mouseEnabled = false;
			
			//настройка кнопки
			var _colors:Array = [0xFfffff, 0xEC748B, 0xC13A59, 0xA81230];
			backButton = new Button(_colors);
			backButton.width = 180;
			backButton.height = 50;
			backButton.x = bg.width / 3 - bg.width/7;
			backButton.y = bg.width / 1.23;
			backButton.label = Language.getText(Language.BACK_STATE);
			backButton.addEventListener(MouseEvent.CLICK, handlerButton);
			
			feedbackButton = new Button(_colors);
			feedbackButton.width = 180;
			feedbackButton.height = 50;
			feedbackButton.x = bg.width / 3 + bg.width/4;
			feedbackButton.y = bg.width / 1.23;
			feedbackButton.label = Language.getText(Language.FEEDBACKB);
			feedbackButton.addEventListener(MouseEvent.CLICK, handlerButton);
			
			tfInviation.x = bg.width / 3 - 70;
			tfInviation.y = bg.width / 1.4;
			tfInviation.height = 100;
			tfInviation.width = 600;
			tfInviation.multiline = true;
			tfInviation.wordWrap = true;
			tfInviation.mouseEnabled = false;
			tfInviation.defaultTextFormat = format;
			tfInviation.text = Language.getText(Language.FEEDBACK);
			
			// добавление элементов на экран
			addChild(bg);
			addChild(tfResult);
			addChild(backButton);
			addChild(feedbackButton);
			addChild(tfInviation);
			var puzzle:PuzzleApp = new PuzzleApp(bg.width / 3, bg.width / 2.6, answer, "hight");
			
			addChild(puzzle);
		}
		
		private function handlerButton(Event:MouseEvent):void {	
			
			if (Event.target == feedbackButton) {
				var url:String = 'http://www.mukmig.yaroslavl.ru/?menu0705';
				var request:URLRequest = new URLRequest(url);
				navigateToURL(request);
			} else {
				this.removeChildren();
				addChild(new MainMenu());
			}
			
		}
	}

}