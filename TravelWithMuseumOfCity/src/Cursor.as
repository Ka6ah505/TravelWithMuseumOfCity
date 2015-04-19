package 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	/**
	 * ...
	 * @author sq
	 */
	
	public class Cursor extends Sprite 
	{
		[Embed(source = "../bin/cursor.png")]public var CursorIco:Class;
		private var cursor:Bitmap;
		
		public function Cursor(_stage:Stage) 
		{
			super();
			// добавим спрайт с курсором на сцену
			cursor = new CursorIco();
			_stage.addChild(cursor);

			// создаем методы обработки событий
			_stage.addEventListener(Event.MOUSE_LEAVE, evMouseLeave);
			_stage.addEventListener(MouseEvent.MOUSE_MOVE, evMouseMove);

			// скроем обычный курсор
			Mouse.hide();
		}
		private function evMouseLeave(e:Event):void
		{
			// метод вызывается, когда курсор покидает сцену
			cursor.visible = false; // скрываем спрайт курсора
		}

		private function evMouseMove(e:MouseEvent):void
		{
			// обработка перемещения курсора по сцене
			if (!cursor.visible) cursor.visible = true;
			cursor.x = mouseX;
			cursor.y = mouseY;
			// обновим сцену после перемещения
			// в этом случае курсор будет перемещаться быстрее
			e.updateAfterEvent();
			Mouse.hide();
		}
		
	}

}