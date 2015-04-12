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
	
	/**
	 * ...
	 * @author sega
	 */	
	public class MainMenu extends Sprite 
	{
		private var b:background;
		public function MainMenu() 
		{
			super();
			b = new background();
			b.width = Capabilities.screenResolutionY;
			b.height = Capabilities.screenResolutionY;
			b.x = b.width / 3;
			this.addChild(b);//new background());
			
			addChild(initQuizButton());						
			addChild(initQuestionsButton());									
		}
		
		private function startQuiz(event:MouseEvent):void {
			this.removeChildren();
			//this.removeChild(b);
			//addChild(new Splash(1));
			//var q:QuizState = new QuizState();
			this.addChild(new QuizState());
			trace("in startQuize");
		}
		
		private function startQuestions(event:MouseEvent):void {
			//this.removeChildren();
			
			this.addChild(new FormLogin());
			//addChild(new Splash(2));
			trace("Hello!!!")
		}

		private function initQuizButton():SimpleButton {
			var upQuiz:upButtonQuiz = new upButtonQuiz();			
			var downQuiz:downButtonQuiz = new downButtonQuiz();			
			var overQuiz:overButtonQuiz = new overButtonQuiz();			
			var quizButton:SimpleButton = new SimpleButton(upQuiz, overQuiz, downQuiz, upQuiz);
			quizButton.width = this.width/6;
			quizButton.height = this.height / 11;
			quizButton.x = this.width / 2 - quizButton.width / 2 + b.width / 3;
			quizButton.y = this.height / 1.8;
			quizButton.addEventListener(MouseEvent.CLICK, startQuiz);			
			return quizButton;
		}
		
		private function initQuestionsButton():SimpleButton {
			var upQuestions:upButtonQuestions = new upButtonQuestions();
			var overQuestions:overButtonQuestions = new overButtonQuestions();
			var downQuestions:downButtonQuestions = new downButtonQuestions();
			var questionsButton:SimpleButton = new SimpleButton(upQuestions, overQuestions, downQuestions, upQuestions);
			questionsButton.width = this.width / 6;
			questionsButton.height = this.height / 11;
			questionsButton.x = this.width / 2 - questionsButton.width / 2 + b.width / 3;
			questionsButton.y = this.height / 1.4;
			questionsButton.addEventListener(MouseEvent.CLICK, startQuestions);
			return questionsButton;
		}		
	}
}