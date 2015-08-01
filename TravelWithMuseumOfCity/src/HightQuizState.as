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
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import puzzle.PuzzleApp;
	
	/**
	 * ...
	 * @author sq
	 */
	public class HightQuizState extends Sprite
	{
		private var bg:backgroundGame;
		private var tfQuestion:TextField = new TextField();
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
		public var massBool:Array = new Array(true, true, true, true);
		public var l:Loader = new Loader();
		public var f:GlowFilter = new GlowFilter();
		public var pic:Loader = new Loader();
		public var puzzle:PuzzleApp
		
		public function HightQuizState() {
			super();
			addChild(pic);
			init();
			initSelectQuestion();
			initButtons();
			//puzzle = new PuzzleApp(bg.width / 3, bg.width / 2.6, 10, 4);
			//addChild(puzzle);
			
			loader.dataFormat = URLLoaderDataFormat.TEXT;	
			try {
				loader.load(new URLRequest(Language.getText(Language.QUEST2_FILE)));
			}catch (error:SecurityError) {
                trace("A SecurityError has occurred.");
			}
			
			loader.addEventListener(Event.COMPLETE, loadXML);
			loader.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
		}
		
		private function errorHandler(e:IOErrorEvent):void {
            trace("Had problem loading the XML File.");
        }
		
		private function initSelectQuestion():void {
			
			for (var i:int = 0; i <= 3; i++ ) {
				var l:Loader = new Loader();
				l.load(new URLRequest("def1.png"));
				l.x = 100 * i + bg.width / 4;
				l.y = bg.width - bg.width / 3;
				
				var tempNumber:TextField = new TextField();
				tempNumber.text = (i + 1)+".";
				tempNumber.x = 100 * i + bg.width / 4 - 15;
				tempNumber.y = bg.width - bg.width / 3 + 10;
				tempNumber.mouseEnabled = false;
				addChild(tempNumber);
				
				massImage[i] = l;
				massImage[i].addEventListener(MouseEvent.CLICK, onSelectQuestion);
			}
			
			for (var ii:int = 0; ii <= 3; ii++ ) {
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
				default:
					break;
			}
			var s:clickNext = new clickNext();
			s.play();
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
			for (var i:int = 0; i <= 3; i++) {
				var j:int = numbers[i];
				content.push(new QuestionsAndAnswer(xml.child("quest")[j].attributes()[1], 
													xml.child("quest")[j].attributes()[2], 
													xml.child("quest")[j].attributes()[3], 
													xml.child("quest")[j].attributes()[4], 
													xml.child("quest")[j].attributes()[5],
													xml.child("quest")[j].attributes()[6],
													xml.child("quest")[j].attributes()[7]
													)
							);
			}
			initQuestion();
		}
		// генерирование номеров вопросов для викторины
		public function generateTenRandomQuestion(length:int):void {
			for (var i:int = 0; i < length; i++) numbers[i] = i;
			numbers.sort(randomSort);
			numbers.splice(4);
		}
		// перемешиванте
		public function randomSort(elementA:Object, elementB:Object):Number {
			return Math.random() - .5;
		}
		
		public function initQuestion():void {
			removeChild(pic);
			// настройка формата текста
			var format:TextFormat = new TextFormat();
            format.font = "Verdana";
            format.color = 0x0000FF;
            format.size = 18;
            format.underline = true;
			format.bold = true;
			tfQuestion.defaultTextFormat = format;
			
			// натройка свойств текста
			//tfQuestion.width = 400;
			tfQuestion.multiline = true;
			tfQuestion.wordWrap = true;
			tfQuestion.height = 170;
			tfQuestion.width = this.height / 1.3;
			
			// добавление текста вопроса и ответов на экранные объекты
			tfQuestion.text = content[numberQuestion].getQuestion();		
			answerButtonA.label = content[numberQuestion].getAnswerA();
			answerButtonB.label = content[numberQuestion].getAnswerB();
			answerButtonC.label = content[numberQuestion].getAnswerC();
			answerButtonD.label = content[numberQuestion].getAnswerD();
			
			pic.load(new URLRequest(content[numberQuestion].getPic()));
			pic.x = bg.width/3;
			pic.y = bg.height / 2.5 - 100;
			addChild(pic)
		}
		
		public function init():void {
			bg = new backgroundGame();
			bg.width = Capabilities.screenResolutionY;
			bg.height = Capabilities.screenResolutionY;
			//bg.x = bg.width / 3;
			tfQuestion.x = 70; //+ bg.width / 3;
			tfQuestion.y = 20;
			tfQuestion.height = 30;
			tfQuestion.width = 300;
			tfQuestion.mouseEnabled = false;
			f.color = 0x33CCF;
			addChild(bg);
			addChild(tfQuestion);
		}
		
		private function initButtons():void {
			var _colors:Array = [0xFfffff, 0xEC748B, 0xC13A59, 0xA81230];
			answerButtonA = new Button(_colors);
			answerButtonB = new Button(_colors);
			answerButtonC = new Button(_colors);
			answerButtonD = new Button(_colors);
			exitQuizState = new Button(_colors);
			addChild(answerButtonA);
			addChild(answerButtonB);
			addChild(answerButtonC);
			addChild(answerButtonD);
			addChild(exitQuizState);
			answerButtonA.x = 50 ;
			answerButtonA.y = bg.width / 1.9;
			answerButtonA.height = 35;
			//answerButtonA.width = 200;
			answerButtonA.width = bg.width / 3;
			answerButtonB.x = bg.width/3  - 50 + bg.width / 3;
			answerButtonB.y = bg.width / 1.9;
			answerButtonB.height = 35;
			answerButtonB.width = bg.width / 3;
			answerButtonC.x = 50 ;
			answerButtonC.y = bg.width / 1.9 + 40;
			answerButtonC.height = 35;
			answerButtonC.width = bg.width / 3;
			answerButtonD.x = 2*bg.width/3 - 50;;
			answerButtonD.y = bg.width / 1.9 + 40;
			answerButtonD.height = 35;
			answerButtonD.width = bg.width / 3;
			exitQuizState.width = bg.width / 3.5;
			exitQuizState.height = 35;
			//exitQuizState.label = "Завершить тест";
			exitQuizState.label = Language.getText(Language.EXIT_TEST);
			exitQuizState.x = bg.width/3;// / 2 + exitQuizState.width / 2;
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
		// изменение навигациооной кнопки
			massImage[numberQuestion].removeEventListener(MouseEvent.CLICK, onSelectQuestion);
			massImage[numberQuestion].alpha = 0.1;
			massImage[numberQuestion].filters = null;
			massBool[numberQuestion] = false;
		// активирование следующей навигационной кнопки
			var flag:Boolean = checkNext();
			checkFull(flag);
		// проверка нажатия кнопки завершения теста
			if (e.target == exitQuizState) {
				this.removeChildren();
				var rq:HightQuizResult = new HightQuizResult(score);
				this.addChild(rq);
			} else {
				initQuestion();
			}
			checkMass();
		}
		
		private function checkMass():void {
			var count:int = 0;
			for (var i:int = 0; i <= 3; i++) {
				if (!massBool[i]) {
					count++;
				}
			}
			if (count == 4) {
				this.removeChildren();
				var rq:HightQuizResult = new HightQuizResult(score);
				this.addChild(rq);
			}
		}
		
		private function checkFull(flag:Boolean):void {
			if(!flag) {
				for (var i:int = 0; i <= 3; i++ ) {
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
			for (var i:int = numberQuestion; i <= 3; i++ ) {
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