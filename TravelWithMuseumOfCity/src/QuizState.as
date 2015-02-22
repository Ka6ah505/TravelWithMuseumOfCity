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
		
		public var externalXML:XML;    
        public var loader:URLLoader = new URLLoader();
		public var content:Vector.<QuestionsAndAnswer> = new Vector.<QuestionsAndAnswer>;
		public var numbers:Array = new Array();
		public var score:int = 0;
		
		public function QuizState() 
		{
			super();
			createLoader();
			//content.push(new QuestionsAndAnswer("", "", "", "", "", 4));
			init();
			initButtons();
			//initQuestion();
		}
		
		private function createLoader():void {
			var request:URLRequest = new URLRequest("quest.xml");
			try {
                loader.load(request);
            }
            catch (error:SecurityError) {
                trace("A SecurityError has occurred.");
            }
            loader.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
            loader.addEventListener(Event.COMPLETE, loaderCompleteHandler);
		}
		
		public function loaderCompleteHandler(event:Event):void {
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
			for (var j:int = 0; j < numbers.length; j++) 
			readQuestionOutFile();
		}
		
		public function readQuestionOutFile():void {
			readNodes(externalXML);
		}
		
		public function readNodes(node:XML):void {
			for each (var element:XML in node.elements()) {
				if (element.attributes()[0] == numbers[score]) {
					content.push(new QuestionsAndAnswer(element.attributes()[1],
					element.attributes()[2], element.attributes()[3], element.attributes()[4],
					element.attributes()[5], int(element.attributes()[6])));
					score++;
				}
				readNodes(element);
			}			
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