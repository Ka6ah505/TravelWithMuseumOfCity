package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.Capabilities;
	
	/**
	 * ...
	 * @author sega
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Sprite 
	{
		private var menu:MainMenu;
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			addChild(new Cursor(stage));
			//this.x = Capabilities.screenResolutionX / 4;
			//this.y = Capabilities.screenResolutionY / 6;
			menu = new MainMenu();
			addChild(menu);
		}
	}

}