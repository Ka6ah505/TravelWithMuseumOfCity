package 
{
	import flash.display.Sprite;
	import flash.display.SimpleButton;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.events.MouseEvent;
	import flash.system.fscommand;
	import flash.display.StageDisplayState;
	import flash.utils.getDefinitionByName;
	import flash.system.Capabilities;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import flash.net.URLVariables;
	
	/**
	 * ...
	 * @author sega
	 */	
	public class MainMenu extends Sprite 
	{
		private var _colors:Array = [0xFAD4DB, 0xEC748B, 0xC13A59, 0xA81230];
		private var b:backgroundGame;
		private var s:Stage;
		public function MainMenu() 
		{
			super();
			
			b = new backgroundGame();
			b.width = Capabilities.screenResolutionY;
			b.height = Capabilities.screenResolutionY;
			this.addChild(b);
			
			addChild(initQuizButton());						
			addChild(initQuestionsButton());
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP;
		}
		
		private function startQuiz(event:MouseEvent):void {
			this.removeChildren();
			this.addChild(new QuizState());
		}
		
		private function startQuestions(event:MouseEvent):void {	
			this.removeChildren();
			this.addChild(new HightQuizState())
		}

		private function initQuizButton():Button {
			var quizButton:Button = new Button(_colors);
			quizButton.label = Language.getText(Language.START_QUIZ);
			quizButton.width = this.width / 1.9;
			quizButton.height = this.height / 11;
			quizButton.x = this.width / 2 - quizButton.width / 2;
			quizButton.y = this.height / 1.8;
			quizButton.addEventListener(MouseEvent.CLICK, startQuiz);			
			return quizButton;
		}
		
		private function initQuestionsButton():Button {
			var questionsButton:Button = new Button(_colors);
			questionsButton.label = Language.getText(Language.START_QUESTIONS);
			questionsButton.width = this.width / 1.9;
			questionsButton.height = this.height / 11;
			questionsButton.x = this.width / 2 - questionsButton.width / 2;
			questionsButton.y = this.height / 1.4;
			questionsButton.addEventListener(MouseEvent.CLICK, startQuestions);
			return questionsButton;
		}		
	}
}