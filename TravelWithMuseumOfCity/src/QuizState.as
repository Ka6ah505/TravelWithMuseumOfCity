package 
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;	
	/**
	 * ...
	 * @author sega
	 */
	public class QuizState extends Sprite 
	{
		private var tf:TextField = new TextField();
		private var answerButtonA:Button;
		private var answerButtonB:Button;
		private var answerButtonC:Button;
		private var answerButtonD:Button;
		private var numberQuestion:int = 0;
		public var dbconn:DbConnect;
		
		//public var content:Array = [];
		public var content:Vector.<QuestionsAndAnswer>; //= new Vector.<QuestionsAndAnswer>;
		
		public function QuizState(c:Vector.<QuestionsAndAnswer>) 
		{
			super();
			init();
			initButtons();
		}
		
		private function initQuestion():void {
			tf.text = content[numberQuestion].getQuestion();			
			answerButtonA.label = content[numberQuestion].getAnswerA();
			answerButtonB.label = content[numberQuestion].getAnswerB();
			answerButtonC.label = content[numberQuestion].getAnswerC();
			answerButtonD.label = content[numberQuestion].getAnswerD();
			numberQuestion++;
		}
		
		public function init():void {
			var bg:backgroundGame = new backgroundGame();
			tf.x = 20;
			tf.y = 30;
			tf.height = 30;
			tf.width = 300;
			addChild(bg);
			addChild(tf);
		}
		
		private function initButtons():void {
			answerButtonA = new Button();
			answerButtonB = new Button();
			answerButtonC = new Button();
			answerButtonD = new Button();
			addChild(answerButtonA);
			addChild(answerButtonB);
			addChild(answerButtonC);
			addChild(answerButtonD);
			answerButtonA.x = 50;
			answerButtonA.y = 300;
			answerButtonA.height = 30;
			answerButtonA.width = 200;
			answerButtonB.x = 300;
			answerButtonB.y = 300;
			answerButtonB.height = 30;
			answerButtonB.width = 200;
			answerButtonC.x = 50;
			answerButtonC.y = 340;
			answerButtonC.height = 30;
			answerButtonC.width = 200;
			answerButtonD.x = 300;
			answerButtonD.y = 340;
			answerButtonD.height = 30;
			answerButtonD.width = 200;
			answerButtonA.addEventListener(MouseEvent.CLICK, handlerButton);
			answerButtonB.addEventListener(MouseEvent.CLICK, handlerButton);
			answerButtonC.addEventListener(MouseEvent.CLICK, handlerButton);
			answerButtonD.addEventListener(MouseEvent.CLICK, handlerButton);
		}
		
		private function handlerButton(Event:MouseEvent):void {	
			initQuestion();
		}
		
	}

}