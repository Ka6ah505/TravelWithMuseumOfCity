package puzzle 
{
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.filters.DropShadowFilter;
    import flash.filters.GlowFilter;
   
	/**
	 * ...
	 * @author sq
	 */
	public class PuzzleElement extends Sprite {
		public var left:int; // левая сторона
        public var top:int; // верхняя сторона
        public var right:int; // правая сторона
        public var bot:int; // нижняя сторона
		 //
        // спрайт-контейнер который будет
        // содержать куски элемента
        private var cont:Sprite;
		
		 // объект который будет содержать картинку
        private var bitmap:Bitmap;
		
		public function PuzzleElement(_left:int, _top:int, _right:int, _bot:int) {
			super();
			this.left = _left;
            this.top = _top;
            this.right = _right;
            this.bot = _bot;
            //
            cont = new Sprite();
			// проверяем, если это не тестовый пазл
            // который мы создали в методе getSize
            // для определения размеров
            if (left+top+right+bot != 0) {
                // то сдвинуть контейнер
                // на половину длины
                cont.x = PuzzleElement.Width/2;
                // и половину высоты
                cont.y = PuzzleElement.Height/2;
            }
            this.addChild(cont);
			
			// создаем объект для отображения картинки
            bitmap = new Bitmap();
            this.addChild(bitmap);
            if (_convexity != -1) {
                // смещаем картинку влево и вверх
                // на величину выпуклости
                bitmap.x = -_convexity;
                bitmap.y = -_convexity;
            }
			
			 //
            // создаем все четыре стороны,
            // указывая тип стороны и угол поворота для мувиклипа
            addPart(left, -90);
            addPart(top, 0);
            addPart(right, 90);
            addPart(bot, 180);
			
			 // создаем фильтры Белого свечения и Тени
            var glow:GlowFilter = new GlowFilter(0xffffff, 0.5, 1.1, 1.1, 30);
            var shadow:DropShadowFilter = new DropShadowFilter(4, 45, 0x0, .8, 8, 8);
            this.filters = [glow, shadow];
		}
		
		private function addPart(type:int, rot:int):void {
            var part:DisplayObject;
            switch (type) {
                case 0:
                    // создаем клип с ровной стороной
                    part = new part0();
                    break;
                case 1:
                    // создаем клип с выпуклой стороной
                    part = new part1();
                    break;
                case 2:
                    // создаем клип с вогнутой стороной
                    part = new part2();
                    break;
            }
            // поворачиваем клпи на указанный угол
            part.rotation = rot;
            // добавляем клип в контейнер
            cont.addChild(part);
        }
		
		// ширина пазла
        private static var _width:Number = -1;
        public static function get Width():Number
        {
            // если размер не известен,
            // то вызываем функцию которая это вычисляет
            if (_width == -1) {
                getSize();
            }
            return _width;
        }
		
        // высота пазла
        private static var _height:Number = -1;
        public static function get Height():Number
        {
            // если размер не известен,
            // то вызываем функцию которая это вычисляет
            if (_height == -1) {
                getSize();
            }
            return _height;
        }
        /**
         * Функция которая определяет размеры элемента пазла
         */
        private static function getSize():void
        {
            // создаем элемент, у которого все стороны ровные
            var element:PuzzleElement = new PuzzleElement(0, 0, 0, 0);
            // запоминаем размеры
            _width = element.width;
            _height = element.height;
			//
            // для определения размера выпуклости
            // создаем два элемента, один без выпуклостей
            // а второй с выпуклостью
            // и считаем разницу в размере
            var element2:PuzzleElement = new PuzzleElement(0, 0, 1, 0);
            _convexity = element2.width-element.width;
        }
		
		// размер выпуклой части элемента пазла
        // нужен для нарезки картинки
        private static var _convexity:Number = -1;
        public static function get Convexity():Number
        {
            if (_convexity == -1) {
                getSize();
            }
            return _convexity;
        }
		
		/**
         * Обновить местоположение и размер
         * согласно новым размерам картинки
         * @param xscale - сжатие по X
         * @param yscale - сжатие по Y
         * 
         */
        public function UpdateScale(xscale:Number, yscale:Number):void
        {
            this.x *= xscale;
            cont.x *= xscale;
            cont.scaleX = xscale;
            this.y *= yscale;
            cont.y *= yscale;
            cont.scaleY = yscale;
        }
		
		 /**
         * Вставить кусок картинки
         */
        public function set Image(value:BitmapData):void
        {
            // вставляем картинку
            bitmap.bitmapData = value;
            // задаем маску картинке
            bitmap.mask = cont;
        }
		
	}

}