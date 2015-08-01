package puzzle 
{
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.events.MouseEvent;
	import flash.display.BitmapData;
	import flash.system.Capabilities;
	
	/**
	 * ...
	 * @author sq
	 */
	public class PuzzleApp extends Sprite
	{
		
		// сетка пазла
        public var grid:PuzzleGrid;
		public var grids:PuzzleGridSmall;
		
		public var bitmapData:BitmapData;
		
		public function PuzzleApp(x:int, y:int, i:int, level:String) {
			//this.stage.scaleMode = StageScaleMode.NO_SCALE;
            //this.stage.align = StageAlign.TOP_LEFT;
            this.graphics.lineStyle(1, 0x999999, 1);
            //this.graphics.drawRect(0, 0, this.stage.stageWidth-1, this.stage.stageHeight-1);
            
            //
            // создаем картинку для пазла
            //bitmapData = new image();
			var random:int = Math.round(Math.random() * 2);
			if (random == 0) {
				bitmapData = new jar();
			} else if (random == 1) {
				bitmapData = new gate();
			} else {
				bitmapData = new armor();
			}
				//bitmapData = new jar();
            //
			if (level=="normal") {
				resetGrid4(x, y, i);
			} else if(level=="hight"){
				resetGrid(x, y, i);
				//grid.Mix(bitmapData);
			}
            //resetGrid(x, y, i);
			//grid.Mix(bitmapData);
			//grid.Strogo(bitmapData);
		}
        
        public function resetGrid4(x:int, y:int, i:int):void {
			if (grid != null) {
                if (this.contains(grid)) this.removeChild(grid);
            }
            //
            grid = new PuzzleGrid(4, 5, i);
			grid.x = x;
            grid.y = y / 1.5;
			//grid.scaleX = 1600 / grid.width;
			//grid.scaleY = 1600 / grid.height;
            this.addChild(grid);
            // передаем картинку пазлу
            grid.Image = bitmapData;
        }
		
		public function resetGrid(x:int, y:int, i:int):void {
			if (grids != null) {
                if (this.contains(grid)) this.removeChild(grid);
            }
            //
            grids = new PuzzleGridSmall(2, 2, i);
			grids.x = x;
            grids.y = y / 1.5;
			grids.scaleX = 600 / grids.width;
			grids.scaleY = 600 / grids.height;
            this.addChild(grids);
            // передаем картинку пазлу
            grids.Image = bitmapData;
        }
	}

}