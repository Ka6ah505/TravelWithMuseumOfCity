package 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.system.Capabilities;
	import flash.filters.GlowFilter;
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.text.TextFieldType;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLLoader;
	import flash.xml.*;
	import flash.text.TextFormat;
	
	
	/**
	 * ...
	 * @author sq
	 */
	public class OlimpicState extends Sprite 
	{
		private var bg:backgroundGame;
		private var tfQuestion:TextField = new TextField();
		public var f:GlowFilter = new GlowFilter();
		private var numberQuestion:int = 0;
		public var massImage:Array = [];
		private var exitQuizState:Button;
		private var answer1:TextField;
		private var answer2:TextField;
		private var answer3:TextField;
		private var answer4:TextField;
		private var answer5:TextField;
		public var content:Array = [];
		public var numbers:Array = new Array();
		public var loader:URLLoader = new URLLoader();
		public var xml:XML;
		
		public function OlimpicState() 
		{
			super();
			init();
			initTextField();
			initSelectQuestion();
			initButton();
			
			loader.dataFormat = URLLoaderDataFormat.TEXT;	
			try {
				loader.load(new URLRequest(Language.getText(Language.QUEST_FILE)));
			}catch (error:SecurityError) {
                trace("A SecurityError has occurred.");
			}
			
			loader.addEventListener(Event.COMPLETE, loadXML);
			loader.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
		}
		
		private function errorHandler(e:IOErrorEvent):void {
            trace("Had problem loading the XML File.");
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
			for (var i:int = 0; i < 5; i++) {
				var j:int = numbers[i];
				content.push(xml.child("quest")[j].attributes()[1]);
			}
			trace(content.length);
			initQuestion();
		}
		
		// генерирование номеров вопросов для викторины
		public function generateTenRandomQuestion(length:int):void {
			for (var i:int = 0; i < length; i++) numbers[i] = i;
			numbers.sort(randomSort);
			numbers.splice(5);
		}
		
		// перемешиванте
		public function randomSort(elementA:Object, elementB:Object):Number {
			return Math.random() - .5;
		}
		
		public function init():void {
			bg = new backgroundGame();
			bg.width = Capabilities.screenResolutionY;
			bg.height = Capabilities.screenResolutionY;
			//bg.x = bg.width / 3;
			tfQuestion.x = 70; //+ bg.width / 3;
			tfQuestion.y = bg.width / 5;
			tfQuestion.height = 30;
			tfQuestion.width = 300;
			tfQuestion.mouseEnabled = false;
			tfQuestion.multiline = true;
			tfQuestion.wordWrap = true;
			f.color = 0x33CCF;
			addChild(bg);
			addChild(tfQuestion);
		}
		
		private function initSelectQuestion():void {
			
			for (var i:int = 0; i <= 4; i++ ) {
				var l:Loader = new Loader();
				l.load(new URLRequest("def1.png"));
				l.x = 50 * i + bg.width / 3;
				l.y =  bg.width / 3 + bg.width / 10;
				
				var tempNumber:TextField = new TextField();
				tempNumber.text = (i + 1)+".";
				tempNumber.x = 50 * i + bg.width / 3 - 12;
				tempNumber.y = bg.width / 3 + 10 + bg.width / 10;
				tempNumber.mouseEnabled = false;
				addChild(tempNumber);
				
				massImage[i] = l;
				massImage[i].addEventListener(MouseEvent.CLICK, onSelectQuestion);
			}
			
			for (var ii:int = 0; ii <= 4; ii++ ) {
				addChild(massImage[ii]);
			}	
			massImage[numberQuestion].filters = [f];
		}
		
		private function onSelectQuestion(e:MouseEvent):void {		
			resetViewButtonquestion();
			switch(e.target) {
				case massImage[0]:
					numberQuestion = 0;
					answer1.visible = true;
					break;
				case massImage[1]:
					numberQuestion = 1;
					answer2.visible = true;
					break;
				case massImage[2]:
					numberQuestion = 2;
					answer3.visible = true;
					break;
				case massImage[3]:
					numberQuestion = 3;
					answer4.visible = true;
					break;
				case massImage[4]:
					numberQuestion = 4;
					answer5.visible = true;
					break;
				default:
					break;
			}
			massImage[numberQuestion].filters = [f];
			initQuestion();
		}
		
		private function resetViewButtonquestion():void {
			for (var i:int = 0; i < massImage.length; i++) {
				massImage[i].filters = null;				
			}
			answer1.visible = false;
			answer2.visible = false;
			answer3.visible = false;
			answer4.visible = false;
			answer5.visible = false;
		}
		
		private function initTextField():void {
			answer1 = new TextField();
			answer1.type = TextFieldType.INPUT;
			answer1.width = bg.width / 1.5;
			answer1.height = bg.width/5;
			answer1.border = true;
			answer1.background = true;
			answer1.x = bg.width / 5;
			answer1.y = bg.width - bg.width / 2;
			answer1.maxChars = 100;
			answer1.mouseEnabled = true;
			answer1.multiline = true;
			answer1.wordWrap = true;
			answer1.visible = true;
			addChild(answer1);
			
			answer2 = new TextField();
			answer2.type = TextFieldType.INPUT;
			answer2.width = bg.width / 1.5;
			answer2.height = bg.width/5;
			answer2.border = true;
			answer2.background = true;
			answer2.x = bg.width / 5;
			answer2.y = bg.width - bg.width / 2;
			answer2.maxChars = 100;
			answer2.mouseEnabled = true;
			answer2.multiline = true;
			answer2.wordWrap = true;
			answer2.visible = false;
			addChild(answer2);
			
			answer3 = new TextField();
			answer3.type = TextFieldType.INPUT;
			answer3.width = bg.width / 1.5;
			answer3.height = bg.width/5;
			answer3.border = true;
			answer3.background = true;
			answer3.x = bg.width / 5;
			answer3.y = bg.width - bg.width / 2;
			answer3.maxChars = 100;
			answer3.mouseEnabled = true;
			answer3.multiline = true;
			answer3.wordWrap = true;
			answer3.visible = false;
			addChild(answer3);
			
			answer4 = new TextField();
			answer4.type = TextFieldType.INPUT;
			answer4.width = bg.width / 1.5;
			answer4.height = bg.width/5;
			answer4.border = true;
			answer4.background = true;
			answer4.x = bg.width / 5;
			answer4.y = bg.width - bg.width / 2;
			answer4.maxChars = 100;
			answer4.mouseEnabled = true;
			answer4.multiline = true;
			answer4.wordWrap = true;
			answer4.visible = false;
			addChild(answer4);
			
			answer5 = new TextField();
			answer5.type = TextFieldType.INPUT;
			answer5.width = bg.width / 1.5;
			answer5.height = bg.width/5;
			answer5.border = true;
			answer5.background = true;
			answer5.x = bg.width / 5;
			answer5.y = bg.width - bg.width / 2;
			answer5.maxChars = 100;
			answer5.mouseEnabled = true;
			answer5.multiline = true;
			answer5.wordWrap = true;
			answer5.visible = false;
			addChild(answer5);
		}
		
		private function initButton():void {
			var _colors:Array = [0xFfffff, 0xEC748B, 0xC13A59, 0xA81230];
			exitQuizState = new Button(_colors);
			addChild(exitQuizState);
			exitQuizState.width = bg.width / 3.5;
			exitQuizState.height = 30;
			exitQuizState.label = Language.getText(Language.EXIT_TEST);
			exitQuizState.x = bg.width/3;
			exitQuizState.y  = bg.height - 150;
			exitQuizState.addEventListener(MouseEvent.CLICK, handlerButton);
		}
		
		private function handlerButton(e:MouseEvent):void {
			removeChildren();
			this.addChild(new FormLogin(answer1.text, answer2.text, answer3.text, answer4.text, answer5.text));
		}
		
		public function initQuestion():void {
			var format:TextFormat = new TextFormat();
            format.font = "Verdana";
            format.color = 0x0000FF;
            format.size = 20;
			format.bold = true;
            format.underline = true;
			tfQuestion.defaultTextFormat = format;
			
			tfQuestion.width = 400;
			tfQuestion.multiline = true;
			tfQuestion.wordWrap = true;
			tfQuestion.height = 100;
			tfQuestion.width = this.height / 1.3;
			
			tfQuestion.text = content[numberQuestion];		
		}
	}

}