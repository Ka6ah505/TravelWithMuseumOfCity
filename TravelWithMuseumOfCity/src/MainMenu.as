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
	
	/**
	 * ...
	 * @author sega
	 */
	public class MainMenu extends Sprite 
	{
		
		public function MainMenu() 
		{
			super();
			this.addChild(new background());
			
			addChild(initQuizButton());						
			addChild(initQuestionsButton());						
			addChild(initExitButton());
			
		}
		
		private function startQuiz(event:MouseEvent):void {
			//this.removeChildren();
			var q:QuizState = new QuizState();
			this.addChild(q);
		}
		
		private function startQuestions(event:MouseEvent):void {
			trace("Hello!!!")
		}
		
		private function exitGame(event:MouseEvent):void {
			fscommand("quit");
		}
		
		private function initQuizButton():SimpleButton {
			var upQuiz:upButtonQuiz = new upButtonQuiz();			
			var downQuiz:downButtonQuiz = new downButtonQuiz();			
			var overQuiz:overButtonQuiz = new overButtonQuiz();			
			var quizButton:SimpleButton = new SimpleButton(upQuiz, overQuiz, downQuiz, upQuiz);
			quizButton.width = this.width/6;
			quizButton.height = this.height / 11;
			quizButton.x = this.width / 2 - quizButton.width / 2;
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
			questionsButton.x = this.width / 2 - questionsButton.width / 2;
			questionsButton.y = this.height / 1.4;
			questionsButton.addEventListener(MouseEvent.CLICK, startQuestions);
			return questionsButton;
		}
		
		private function initExitButton():SimpleButton {
			var upExit:upButtonExit = new upButtonExit();
			var overExit:overButtonExit = new overButtonExit();
			var downExit:downButtonExit = new downButtonExit();
			var exitButton:SimpleButton = new SimpleButton(upExit, overExit, downExit, upExit);
			exitButton.width = this.width / 18;
			exitButton.height = this.width / 18;
			exitButton.x = this.width - exitButton.width;
			exitButton.y = 0;
			exitButton.addEventListener(MouseEvent.CLICK, exitGame);
			return exitButton;
		}
	}

}