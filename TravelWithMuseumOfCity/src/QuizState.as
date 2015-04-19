package 
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.system.Capabilities;
	import flash.xml.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoaderDataFormat;
	import flash.display.Shape;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Transform;
	import flash.filters.BlurFilter;
	
	/**
	 * ...
	 * @author sega
	 */
	public class QuizState extends Sprite 
	{
		private var bg:backgroundGame;
		private var tf:TextField = new TextField();
		private var tfCount:TextField = new TextField();
		private var answerButtonA:Button;
		private var answerButtonB:Button;
		private var answerButtonC:Button;
		private var answerButtonD:Button;
		private var exitQuizState:Button;
		private var numberQuestion:int = 0;
		public var loader:URLLoader = new URLLoader();
		public var numbers:Array = new Array();
		public var xml:XML;
		public var content:Array = [];
		public var score:int = 0;
		public var massImage:Array = [];
		public var massBool:Array = new Array(true, true, true, true, true, true, true, true, true, true);
		public var l:Loader = new Loader();
		public var f:GlowFilter = new GlowFilter();
		
		public function QuizState() 
		{
			super();
			init();
			initSelectQuestion();
			initButtons();
			
			loader.addEventListener(Event.COMPLETE, loadXML);
			loader.dataFormat = URLLoaderDataFormat.TEXT;			
			loader.load(new URLRequest("quest.xml"));	
			
		}
		
		private function initSelectQuestion():void {
			
			for (var i:int = 0; i <= 9; i++ ) {
				var l:Loader = new Loader();
				l.load(new URLRequest("def1.png"));
				//l.width = 300;
				//l.height = 300;
				l.x = 50 * i + bg.width / 2;
				l.y = bg.width - bg.width / 3;
				//l.addEventListener(MouseEvent.CLICK, onSelectQuestion);
				massImage[i] = l;
				massImage[i].addEventListener(MouseEvent.CLICK, onSelectQuestion);
			}
			
			for (var ii:int = 0; ii <= 9; ii++ ) {
				addChild(massImage[ii]);
			}	
			massImage[numberQuestion].filters = [f];
		}
		
		private function resetViewButtonquestion():void {
			for (var i:int = 0; i < massImage.length; i++) {
				massImage[i].filters = null;
			}
		}
		
		private function onSelectQuestion(e:MouseEvent):void {		
			resetViewButtonquestion();
			switch(e.target) {
				case massImage[0]:
					numberQuestion = 0;
					break;
				case massImage[1]:
					numberQuestion = 1;
					break;
				case massImage[2]:
					numberQuestion = 2;
					break;
				case massImage[3]:
					numberQuestion = 3;
					break;
				case massImage[4]:
					numberQuestion = 4;
					break;
				case massImage[5]:
					numberQuestion = 5;
					break;
				case massImage[6]:
					numberQuestion = 6;
					break;
				case massImage[7]:
					numberQuestion = 7;
					break;
				case massImage[8]:
					numberQuestion = 8;
					break;
				case massImage[9]:
					numberQuestion = 9;
					break;
				default:
					break;
			}
			massImage[numberQuestion].filters = [f];
			initQuestion();
			
		}
		
		// загрузка xml файла
		private function loadXML(e:Event):void {
			try {
				xml = new XML(loader.data);
				//xml = new XML(e.target.data);
				parserXML();
			} catch(e:TypeError) {
				trace(e.message);
			}
		}
		
		// парсинг и заполнение массива с вопросами
		private function parserXML():void {
			var data:XMLList = xml.children();
			generateTenRandomQuestion(data.length());			
			/////////////////// взять numbers и пробежать по всем значениям, в свою очередь значения подставлять в child("quest")[?]
			for (var i:int = 0; i < 10; i++) {
				var j:int = numbers[i];
				content.push(new QuestionsAndAnswer(xml.child("quest")[j].attributes()[1], 
													xml.child("quest")[j].attributes()[2], 
													xml.child("quest")[j].attributes()[3], 
													xml.child("quest")[j].attributes()[4], 
													xml.child("quest")[j].attributes()[5],
													xml.child("quest")[j].attributes()[6]
													)
							);
			}
			trace(content.length);
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
			var format:TextFormat = new TextFormat();
            format.font = "Verdana";
            format.color = 0xFF0000;
            format.size = 20;
            format.underline = true;
			tf.defaultTextFormat = format;
			tfCount.width = 200;
			tfCount.x = bg.width;
			tfCount.defaultTextFormat = format;
			var tmp:int = numberQuestion + 1;
			tfCount.text = "Вопрос №" + tmp// +"" + "/10";
			
			trace("quest #"+numberQuestion);
			tf.text = content[numberQuestion].getQuestion();		
			answerButtonA.label = content[numberQuestion].getAnswerA();
			answerButtonB.label = content[numberQuestion].getAnswerB();
			answerButtonC.label = content[numberQuestion].getAnswerC();
			answerButtonD.label = content[numberQuestion].getAnswerD();
		}
		
		public function init():void {
			bg = new backgroundGame();
			bg.width = Capabilities.screenResolutionY;
			bg.height = Capabilities.screenResolutionY;
			bg.x = bg.width / 3;
			tf.x = 70 + bg.width / 3;
			tf.y = 70;
			tf.height = 30;
			tf.width = 300;
			f.color = 0x33CCF;
			addChild(bg);
			addChild(tf);
			addChild(tfCount);
		}
		
		private function initButtons():void {
			answerButtonA = new Button();
			answerButtonB = new Button();
			answerButtonC = new Button();
			answerButtonD = new Button();
			exitQuizState = new Button();
			addChild(answerButtonA);
			addChild(answerButtonB);
			addChild(answerButtonC);
			addChild(answerButtonD);
			addChild(exitQuizState);
			answerButtonA.x = 50 + bg.width / 3;
			answerButtonA.y = bg.width / 2;
			answerButtonA.height = 30;
			//answerButtonA.width = 200;
			answerButtonA.width = bg.width / 3;
			answerButtonB.x = bg.width - 50;//300 + bg.width / 3;
			answerButtonB.y = bg.width / 2;
			answerButtonB.height = 30;
			answerButtonB.width = bg.width / 3;
			answerButtonC.x = 50 + bg.width / 3;
			answerButtonC.y = bg.width / 2 + 40;
			answerButtonC.height = 30;
			answerButtonC.width = bg.width / 3;
			answerButtonD.x = bg.width - 50;;
			answerButtonD.y = bg.width / 2 + 40;
			answerButtonD.height = 30;
			answerButtonD.width = bg.width / 3;
			exitQuizState.width = bg.width / 3.5;
			exitQuizState.height = 30;
			exitQuizState.label = "Завершить тест";
			exitQuizState.x = bg.width / 2 + exitQuizState.width / 2;
			exitQuizState.y  = bg.height - 150;
			answerButtonA.addEventListener(MouseEvent.CLICK, handlerButton);
			answerButtonB.addEventListener(MouseEvent.CLICK, handlerButton);
			answerButtonC.addEventListener(MouseEvent.CLICK, handlerButton);
			answerButtonD.addEventListener(MouseEvent.CLICK, handlerButton);
			exitQuizState.addEventListener(MouseEvent.CLICK, handlerButton);
		}
		
		private function handlerButton(e:MouseEvent):void {
		// начисление баллов
			if (e.target == answerButtonA && content[numberQuestion].getTrueAnswer() == 1) {
				score = score + 1;
			} else if (e.target == answerButtonB && content[numberQuestion].getTrueAnswer() == 2) {
				score = score + 1;
			} else if (e.target == answerButtonC && content[numberQuestion].getTrueAnswer() == 3) {
				score = score + 1;
			} else if (e.target == answerButtonD && content[numberQuestion].getTrueAnswer() == 4) {
				score = score + 1;
			}
		// изменение картинки
			massImage[numberQuestion].removeEventListener(MouseEvent.CLICK, onSelectQuestion);
			massImage[numberQuestion].alpha = 0.1;
			massImage[numberQuestion].filters = null;
			massBool[numberQuestion] = false;
		/// НУЖНА проверка
			
			var flag:Boolean = checkNext();
			checkFull(flag);
		
		
			//numberQuestion = numberQuestion + 1;
			
			//if (numberQuestion >= 10 || e.target == exitQuizState) {
			if (e.target == exitQuizState) {
				this.removeChildren();
				var rq:QuizResult = new QuizResult(score);
				this.addChild(rq);
			} else {
				initQuestion();
			}			
		}
		
		private function checkFull(flag:Boolean):void {
			if(!flag) {
				for (var i:int = 0; i <= 9; i++ ) {
					if (massBool[i]) {
						numberQuestion = i;
						massImage[numberQuestion].filters = [f];
						initQuestion();
						break;
					}
				}
			}
		}
		
		private function checkNext():Boolean {
			for (var i:int = numberQuestion; i <= 9; i++ ) {
				if (massBool[i]) {
					numberQuestion = i;
					massImage[numberQuestion].filters = [f];
					initQuestion();
					return true;
				}
			}
			return false;
		}
		
	}

}