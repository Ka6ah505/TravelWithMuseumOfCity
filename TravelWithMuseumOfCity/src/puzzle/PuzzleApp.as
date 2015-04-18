package puzzle 
{
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.events.MouseEvent;
	import flash.display.BitmapData;
	
	/**
	 * ...
	 * @author sq
	 */
	public class PuzzleApp extends Sprite
	{
		
		// сетка пазла
        private var grid:PuzzleGrid;
		
		private var bitmapData:BitmapData;
		
		public function PuzzleApp(indent:int) {
			//this.stage.scaleMode = StageScaleMode.NO_SCALE;
            //this.stage.align = StageAlign.TOP_LEFT;
            this.graphics.lineStyle(1, 0x999999, 1);
            //this.graphics.drawRect(0, 0, this.stage.stageWidth-1, this.stage.stageHeight-1);
            
            //
            // создаем картинку для пазла
            bitmapData = new image();
            //
            resetGrid(indent);
		}
        
        private function resetGrid(indent:int):void {
			if (grid != null) {
                if (this.contains(grid)) this.removeChild(grid);
            }
            //
            grid = new PuzzleGrid(5, 4);
            grid.x = indent*1.33;
            grid.y = indent*1.5;
            this.addChild(grid);
            // передаем картинку пазлу
            grid.Image = bitmapData;
        }
		
	}

}