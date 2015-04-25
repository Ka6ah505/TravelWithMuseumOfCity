package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.system.Capabilities;
	
	/**
	 * ...
	 * @author sq
	 */
	public class SelectLanguage extends Sprite 
	{
		private var bg:background;
		private var buttonRU:Button;
		private var buttonEN:Button;
		
		public function SelectLanguage() 
		{
			super();
			bg = new background();
			bg.width = Capabilities.screenResolutionY;
			bg.height = Capabilities.screenResolutionY;
			addChild(bg);
			var _colors:Array = [0xFfffff, 0xEC748B, 0xC13A59, 0xA81230];
			buttonEN = new Button(_colors);
			buttonRU = new Button(_colors);
			
			buttonEN.label = "ENGLISH";
			buttonRU.label = "Русский";
			
			buttonEN.width = this.width/6;
			buttonEN.height = this.height / 11;
			buttonEN.x = this.width / 2 - buttonEN.width / 2;
			buttonEN.y = this.height / 1.8;
			
			buttonRU.width = this.width / 6;
			buttonRU.height = this.height / 11;
			buttonRU.x = this.width / 2 - buttonRU.width / 2;
			buttonRU.y = this.height / 1.4;
			
			buttonEN.addEventListener(MouseEvent.CLICK, handlerButton);
			buttonRU.addEventListener(MouseEvent.CLICK, handlerButton);
			addChild(buttonEN);
			addChild(buttonRU);
		}
		
		private function handlerButton(e:MouseEvent):void { 
			if (e.target == buttonEN) {
				Language.setEnglish();
			} else if (e.target == buttonRU) {
				Language.setRussian();
			}
			removeChildren();
			addChild(new MainMenu());
			
		}
		
	}

}