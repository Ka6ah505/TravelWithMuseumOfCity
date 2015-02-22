package 
{
	import flash.display.Sprite;
	import flash.xml.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	
	/**
	 * ...
	 * @author sega
	 */
	public class DbConnect
	{	
		public var externalXML:XML;    
        public var loader:URLLoader = new URLLoader();
		public var content:Vector.<QuestionsAndAnswer> = new Vector.<QuestionsAndAnswer>;
		public var numbers:Array = new Array();
		public var score:int = 0;
				
		public function DbConnect() 
		{
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
			readQuestionInFile();
		}
		
		public function readQuestionInFile():void {
			readNodes(externalXML);
		}
		
		public function readNodes(node:XML):void {
			for each (var element:XML in node.elements()) {
				if (element.attributes()[0] == numbers[score]) {
					content.push(new QuestionsAndAnswer(element.attributes()[1],
					element.attributes()[2], element.attributes()[3], element.attributes()[4],
					element.attributes()[5], element.attributes()[6]));
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
		
	}

}