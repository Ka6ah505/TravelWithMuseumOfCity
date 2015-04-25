package 
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
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
	
	/**
	 * ...
	 * @author sega
	 */	
	public class MainMenu extends Sprite 
	{
		private var _colors:Array = [0xFAD4DB, 0xEC748B, 0xC13A59, 0xA81230];
		private var b:background;
		private var s:Stage;
		public function MainMenu() 
		{
			super();
			
			//if (stage) init();
			//else addEventListener(Event.ADDED_TO_STAGE, init);
			
			b = new background();
			b.width = Capabilities.screenResolutionY;
			b.height = Capabilities.screenResolutionY;
			//b.x = b.width / 3;
			this.addChild(b);//new background());
			
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
			trace("in startQuize");
		}
		
		private function startQuestions(event:MouseEvent):void {			
			this.addChild(new FormLogin());
			trace("Hello!!!")
		}

		private function initQuizButton():Button {
			
			//var upQuiz:upButtonQuiz = new upButtonQuiz();			
			//var downQuiz:downButtonQuiz = new downButtonQuiz();			
			//var overQuiz:overButtonQuiz = new overButtonQuiz();			
			//var quizButton:SimpleButton = new SimpleButton(upQuiz, overQuiz, downQuiz, upQuiz);
			var quizButton:Button = new Button(_colors);
			quizButton.label = Language.getText(Language.START_QUIZ);
			quizButton.width = this.width/6;
			quizButton.height = this.height / 11;
			quizButton.x = this.width / 2 - quizButton.width / 2;
			quizButton.y = this.height / 1.8;
			quizButton.addEventListener(MouseEvent.CLICK, startQuiz);			
			return quizButton;
		}
		
		private function initQuestionsButton():Button {
			//var upQuestions:upButtonQuestions = new upButtonQuestions();
			//var overQuestions:overButtonQuestions = new overButtonQuestions();
			//var downQuestions:downButtonQuestions = new downButtonQuestions();
			//var questionsButton:SimpleButton = new SimpleButton(upQuestions, overQuestions, downQuestions, upQuestions);
			var questionsButton:Button = new Button(_colors);
			questionsButton.label = Language.getText(Language.START_QUESTIONS);
			questionsButton.width = this.width / 6;
			questionsButton.height = this.height / 11;
			questionsButton.x = this.width / 2 - questionsButton.width / 2;
			questionsButton.y = this.height / 1.4;
			questionsButton.addEventListener(MouseEvent.CLICK, startQuestions);
			return questionsButton;
		}		
	}
}