package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.Capabilities;
	import puzzle.PuzzleApp;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	
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
			//this.x = Capabilities.screenResolutionX / 4;
			//this.y = Capabilities.screenResolutionY / 6;
			
			//this.stage.scaleMode = StageScaleMode.NO_BORDER;
			//this.stage.align = StageAlign.TOP;
			
			// от прошлого
			addChild(new Cursor(stage));
			menu = new MainMenu();
			addChild(menu);
			
			
			//addChild(new PuzzleApp());
			
		}
	}

}