package 
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;	
	
	import flash.xml.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
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
		private var numberTrueQuestion:int = 0;
		
		public var externalXML:XML;    
        public var loader:URLLoader = new URLLoader();
		public var content:Vector.<QuestionsAndAnswer> = new Vector.<QuestionsAndAnswer>;
		public var numbers:Array = new Array();
		public var score:int = 0;
		
		public function QuizState() 
		{
			super();			
			createLoader();
			init();
			initButtons();
			//tf.text = content.length+"";
			initQuestion();
		}
		
		private function createLoader():void {
			var request:URLRequest = new URLRequest("quest.xml");
			try {
                loader.load(request);
            }
            catch (error:SecurityError) {
                trace("A SecurityError has occurred.");
            }
            //loader.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
            //loader.addEventListener(Event.COMPLETE, loaderCompleteHandler);
			loaderCompleteHandler();
		}
		
		public function loaderCompleteHandler():void{//(event:Event):void {
			try {
				externalXML = new XML(loader.data);		
				generateTenRandomQuestion(externalXML.elements().length());
			} catch (e:TypeError) {
				trace("Could not parse the XML file.");
			}
        }
		
		public function generateTenRandomQuestion(length:int):void {
			for (var i:int = 0; i < length; i++) numbers[i] = i;
			numbers.sort(randomSort);
			numbers.splice(10);
			for (var j:int = 0; j < numbers.length; j++) {}
			readQuestionOutFile();
		}
		
		public function readQuestionOutFile():void {
			readNodes(externalXML);
			/*content.push(new QuestionsAndAnswer("1", "q.1", "q2.1", "q3.1", "q4.1", 2));
			content.push(new QuestionsAndAnswer("2", "q1.2", "q2.2", "q3.2", "q4.2", 2));
			content.push(new QuestionsAndAnswer("3", "q1.3", "q2.3", "q3.3", "q4.3", 2));
			content.push(new QuestionsAndAnswer("4", "q1.4", "q2.4", "q3.4", "q4.4", 2));
			content.push(new QuestionsAndAnswer("5", "q1.5", "q2.5", "q3.5", "q4.5", 2));
			content.push(new QuestionsAndAnswer("6", "q1.6", "q2.6", "q3.6", "q4.6", 2));
			content.push(new QuestionsAndAnswer("7", "q1.7", "q2.7", "q3.7", "q4.7", 2));
			content.push(new QuestionsAndAnswer("8", "q1.8", "q2.8", "q3.8", "q4.8", 2));
			content.push(new QuestionsAndAnswer("9", "q1.9", "q2.9", "q3.9", "q4.9", 2));
			content.push(new QuestionsAndAnswer("10", "q1.10", "q2.10", "q3.10", "q4.10", 2));
			content.push(new QuestionsAndAnswer("11", "q1.11", "q2.11", "q3.11", "q4.11", 2));*/
		}
		
		public function readNodes(node:XML):void {
			/*for each (var element:XML in node.elements()) {
				if (element.attributes()[0] == numbers[score]) {
					/*content[score] = new QuestionsAndAnswer(element.attributes()[1],
					element.attributes()[2], element.attributes()[3], element.attributes()[4],
					element.attributes()[5], int(element.attributes()[6]));*
					content.push(new QuestionsAndAnswer(element.attributes()[1],
					element.attributes()[2], element.attributes()[3], element.attributes()[4],
					element.attributes()[5], int(element.attributes()[6])));
					score++;
				}
				readNodes(element);
			}*/
			content.push(new QuestionsAndAnswer("1", "q.1", "q2.1", "q3.1", "q4.1", 2));
			/*content.push(new QuestionsAndAnswer("2", "q1.2", "q2.2", "q3.2", "q4.2", 2));
			content.push(new QuestionsAndAnswer("3", "q1.3", "q2.3", "q3.3", "q4.3", 2));
			content.push(new QuestionsAndAnswer("4", "q1.4", "q2.4", "q3.4", "q4.4", 2));
			content.push(new QuestionsAndAnswer("5", "q1.5", "q2.5", "q3.5", "q4.5", 2));
			content.push(new QuestionsAndAnswer("6", "q1.6", "q2.6", "q3.6", "q4.6", 2));
			content.push(new QuestionsAndAnswer("7", "q1.7", "q2.7", "q3.7", "q4.7", 2));
			content.push(new QuestionsAndAnswer("8", "q1.8", "q2.8", "q3.8", "q4.8", 2));
			content.push(new QuestionsAndAnswer("9", "q1.9", "q2.9", "q3.9", "q4.9", 2));
			content.push(new QuestionsAndAnswer("10", "q1.10", "q2.10", "q3.10", "q4.10", 2));
			content.push(new QuestionsAndAnswer("11", "q1.11", "q2.11", "q3.11", "q4.11", 2));*/
			/*for each (var element:XML in node.elements()) {
				content.push(new QuestionsAndAnswer(
				String(element.attributes()[1]),
				String(element.attributes()[2]),
				String(element.attributes()[3]),
				String(element.attributes()[4]),
				String(element.attributes()[5]),
				int(element.attributes()[6])));
			}*/
        }
		
		public function randomSort(elementA:Object, elementB:Object):Number {
			return Math.random() - .5;
		}

        public function errorHandler(e:IOErrorEvent):void {
            //xmlTextField.text = "Had problem loading the XML File.";
        }
		
		
		
		
		
////////////////////////////////////////////////////////////////////		
		
		private function initQuestion():void {
			tf.text = content[numberQuestion].getQuestion();			
			answerButtonA.label = content[numberQuestion].getAnswerA();
			answerButtonB.label = content[numberQuestion].getAnswerB();
			answerButtonC.label = content[numberQuestion].getAnswerC();
			answerButtonD.label = content[numberQuestion].getAnswerD();
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
			answerButtonA.addEventListener(MouseEvent.CLICK, handlerButtonA);
			answerButtonB.addEventListener(MouseEvent.CLICK, handlerButtonB);
			answerButtonC.addEventListener(MouseEvent.CLICK, handlerButtonC);
			answerButtonD.addEventListener(MouseEvent.CLICK, handlerButtonD);
		}
		
		private function handlerButtonA(Event:MouseEvent):void {	
			
			if (content[numberQuestion].getTrueAnswer() == 1) {
				numberTrueQuestion++;
			}
			
			numberQuestion++;
			initQuestion();
			if (numberQuestion == 10) {
				tf.text = numberTrueQuestion+"/10"
				//removeChildren();
				//addChild(new MainMenu());
			}
		}
		private function handlerButtonB(Event:MouseEvent):void {	
			if (content[numberQuestion].getTrueAnswer() == 2) {
				numberTrueQuestion++;
			}
			
			numberQuestion++;
			initQuestion();
			if (numberQuestion == 10) {
				tf.text = numberTrueQuestion+"/10"
				//removeChildren();
				//addChild(new MainMenu());
			}
		}
		private function handlerButtonC(Event:MouseEvent):void {	
			if (content[numberQuestion].getTrueAnswer() == 3) {
				numberTrueQuestion++;
			}
			
			numberQuestion++;
			initQuestion();
			if (numberQuestion == 10) {
				tf.text = numberTrueQuestion+"/10"
				//removeChildren();
				//addChild(new MainMenu());
			}
			
		}
		private function handlerButtonD(Event:MouseEvent):void {	
			if (content[numberQuestion].getTrueAnswer() == 4) {
				numberTrueQuestion++;
			}
			
			numberQuestion++;
			initQuestion();
			if (numberQuestion == 10) {
				tf.text = numberTrueQuestion+"/10"
				//removeChildren();
				//addChild(new MainMenu());
			}
		}
	}

}