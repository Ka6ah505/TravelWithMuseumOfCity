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
	import flash.net.URLLoaderDataFormat;
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
		public var loader:URLLoader = new URLLoader();
		public var numbers:Array = new Array();
		public var xml:XML;
		public var content:Array = [];
		
		public function QuizState() 
		{
			super();
			init();
			initButtons();
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			//loader.load(new URLRequest("https://drive.google.com/file/d/0B930L_kJddOIRk1sVHlHVGF3SFE/view?usp=sharing"));
			
			loader.load(new URLRequest("quest.xml"));	
			loader.addEventListener(Event.COMPLETE, loadXML);
		}
		
		// загрузка xml файла
		private function loadXML(e:Event):void {
			try {
				xml = new XML(loader.data);
				parserXML();
			} catch(e:TypeError) {}
		}
		
		// парсинг и заполнение массива с вопросами
		private function parserXML():void {
			var data:XMLList = xml.children();
			generateTenRandomQuestion(data.length());			
			/////////////////// взять numbers и пробежать по всем значениям, в свою очередь значения подставлять в child("quest")[?]
			for (var i:int = 0; i < 10; i++) {
				var j:int = numbers[i];
				content.push(new QuestionsAndAnswer(xml.child("quest")[j].attributes()[1]+" №"+content.length, 
													xml.child("quest")[j].attributes()[2], 
													xml.child("quest")[j].attributes()[3], 
													xml.child("quest")[j].attributes()[4], 
													xml.child("quest")[j].attributes()[5],
													xml.child("quest")[j].attributes()[6]
													)
							);
			}
			initQuestion();
		}
		
		// генерирование номеров вопросов для викторины
		public function generateTenRandomQuestion(length:int):void {
			for (var i:int = 0; i < length; i++) numbers[i] = i;
			numbers.sort(randomSort);
			numbers.splice(10);
		}
		// перемешиванте
		public function randomSort(elementA:Object, elementB:Object):Number {
			return Math.random() - .5;
		}
		
		public function initQuestion():void {
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
			answerButtonA.addEventListener(MouseEvent.CLICK, handlerButton);
			answerButtonB.addEventListener(MouseEvent.CLICK, handlerButton);
			answerButtonC.addEventListener(MouseEvent.CLICK, handlerButton);
			answerButtonD.addEventListener(MouseEvent.CLICK, handlerButton);
		}
		
		private function handlerButton(Event:MouseEvent):void {	
			numberQuestion++;
			if (numberQuestion == 10) {
				this.removeChildren();
				var rq:QuizResult = new QuizResult(4);
				this.addChild(rq);
			}
			initQuestion();
		}
		
	}

}