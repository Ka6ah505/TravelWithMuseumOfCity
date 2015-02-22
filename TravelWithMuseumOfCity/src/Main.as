package
{
	import flash.display.Sprite;
	import flash.events.Event;

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
			menu = new MainMenu();
			addChild(menu);
		}

	}

}