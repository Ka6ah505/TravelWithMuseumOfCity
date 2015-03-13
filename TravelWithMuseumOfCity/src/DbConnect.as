package 
{
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
	public class DbConnect
	{	
		public var xml:XML;
		
        public var loader:URLLoader = new URLLoader();
		//массив вопросов
		public var content:Array = new Array();
		//public var content:Vector.<QuestionsAndAnswer> = new Vector.<QuestionsAndAnswer>;
		// массив номеров вопросов
		public var numbers:Array = new Array();
				
		public function DbConnect() 
		{
			// ссылка на хml файл
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.load(new URLRequest("quest.xml"));	
			loader.addEventListener(Event.COMPLETE, loadXML);
			content.push(new QuestionsAndAnswer("question", "answer1", "answer2", "answer3", "answer4", 4));
		}
		
		private function loadXML(e:Event):void {
			try {
				xml = new XML(loader.data);
				parserXML();
			} catch(e:TypeError) {}
		}
		
		private function parserXML():void {
			/// ??????????
			var data:XMLList = xml.children();
			generateTenRandomQuestion(data.length());
			
			/////////////////// взять numbers и пробежать по всем значениям, в свою очередь значения подставлять в child("quest")[?]
			for (var i:int = 0; i < 10; i++) {
				//var q:XML = data[i];
				var j:int = numbers[i];
				content.push(new QuestionsAndAnswer(xml.child("quest")[j].attributes()[1]+" №"+i, 
													xml.child("quest")[j].attributes()[2], 
													xml.child("quest")[j].attributes()[3], 
													xml.child("quest")[j].attributes()[4], 
													xml.child("quest")[j].attributes()[5],
													xml.child("quest")[j].attributes()[6]
													)
							);
			}
		}
		
		// генерирование номеров вопросов для викторины
		public function generateTenRandomQuestion(length:int):void {
			for (var i:int = 0; i < length; i++) numbers[i] = i;
			numbers.sort(randomSort);
			numbers.splice(10);
		}
		
		public function randomSort(elementA:Object, elementB:Object):Number {
			return Math.random() - .5;
		}
		
		/*public function getContent():Vector.<QuestionsAndAnswer> {
			return content;
		}*/
		
		public function getContent():Array {
			return content;
		}

        public function errorHandler(e:IOErrorEvent):void {
            //xmlTextField.text = "Had problem loading the XML File.";
        }
		
	}

}