package puzzle 
{
	import flash.display.Sprite;
	import flash.display.BitmapData;
	import flash.geom.Point;
    import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author sq
	 */
	public class PuzzleGridSmall extends Sprite 
	{
		// массив всех элементов пазла
        private var elements:Vector.<PuzzleElement>;
		
		public function PuzzleGridSmall(w:int, h:int, answer:int) 
		{
			super();
			// создаем массив для хранения всех элементов пазла
            elements = new Vector.<PuzzleElement>();
            // создаем объект который будет хранить
            // пазлы по координатам X:Y;
            var grid:Object = new Object();
            //
            var i:int;
            var j:int;
            // элемент который находится слева от текущего
            var leftElement:PuzzleElement;
            // элемент который находится сверху от текущего
            var topElement:PuzzleElement;
            // текущий элемент
            var newElement:PuzzleElement;
			var iii:int = 0;
            for (i=0; i<w; i++) {
                for (j = 0; j < h; j++) {
                    // левый элемент от текущего
                    leftElement = grid[(i-1)+'x'+j];
                    // верхний элемент от текущего
                    topElement = grid[i+'x'+(j-1)];
                    //
                    //
                    //
                    var left:int;
                    // если левого элемента нет,
                    if (leftElement == null) {
                        //то левую сторону текущего элемента
                        // указываем прямой
                        left = 0;
                    } else {
                        // если слева есть элемент, то
                        // левую сторону текущего элемента
                        // указываем исходя из значения
                        // правой стороны левого элемента
                        if (leftElement.right == 1) {
                            left = 2;
                        } else {
                            left = 1;
                        }
                    }
                    //
                    //
                    //
                    // параметр top вычисляем так же как и параметр left
                    // только здесь используется более сокращенный вид
                    // без лишних if else которые увеличивают текст кода
                    var top:int = topElement == null ? 0 : 3-topElement.bot;
                    //
                    //
                    //
                    var right:int;
                    // если элемент не крайний правый в сетке
                    if (i < w-1) {
                        // то вычисляем правую сторону случайно
                        // используя Math.random()
                        right = Math.random() < 0.5 ? 2 : 1;
                    } else {
                        // если элемент крайний правый в сетке
                        // то используем прямую сторону
                        right = 0;
                    }
                    //
                    //
                    //
                    // вычисляем нижнюю сторону,
                    // так же как и правую
                    var bot:int;
                    if (j < h-1) {
                        bot = Math.random() < 0.5 ? 2 : 1;
                    } else {
                        bot = 0;
                    }
                    //
                    //
                    //
                    // создаем элемент пазла используя 
                    // полученные параметры left, top, right и bot
					newElement = new PuzzleElement(left, top, right, bot);
					// сдвигаем элемент пазла на длину и высоту пазла
					// ВНИМАНИЕ, здесь я написал +100 что бы раздвинуть
					// элементы друг от друга,
					// что бы увидеть общий результат
					newElement.x = (PuzzleElement.Width) * i;
					newElement.y = (PuzzleElement.Height) * j;
					// добавляем элемент пазла в список отображения
					//this.addChild(newElement);
					//
					//
					// сохраняем новый элемент в массиве
					elements.push(newElement);
					// и сохраняем в объекте grid по координатам i,j
					grid[i + 'x' + j] = newElement;
                }
            }
			splicePuzzle(answer);
				
			for (var k:int = 0; k < elements.length; k++) {
				this.addChild(elements[k]);
			}
		}
		public function splicePuzzle(i:int):void {
			switch(i) {
				case 0 :
					elements.splice(0, 4);
					break;
				case 1 :
					elements.splice(1, 3);
					break;
				case 2 :
					elements.splice(2, 2);
					break;	
				case 3:
					//elements.splice(2, 2);
					elements.splice(3, 1);
					break;
				case 4 :
					break;
			}
		}
		
		 /**
         * Задать картинку пазлу
         * Метод режет картинку на куски и
         * раздает куски созданным элементам пазла
         */
        public function set Image(value:BitmapData):void
        {
            // вычисляем на на сколько необходимо
            // увеличить/уменьшить элементы пазла
            // что бы размеры совпали с картинкой
            var xscale:Number = value.width/this.width;
            var yscale:Number = value.height/this.height;
            //
            var i:int;
            // элемент пазла
            var element:PuzzleElement;
            // кусок вырезанной картинки
            var bitmapData:BitmapData;
            // размер для вырезания куска картинки
            var rect:Rectangle;
            for (i=0; i<elements.length; i++) {
                element = elements[i];
                // обновляем размеры и местоположение элемента пазла
                element.UpdateScale(xscale, yscale);
                //
                // создаем новый кусок для картинки
                bitmapData = new BitmapData(element.width, element.height, true, 0x00000000);
                // вычисляем размер и местоположение откуда вырезать кусок картинки
                rect = new Rectangle();
                rect.x = element.x-PuzzleElement.Convexity;
                rect.y = element.y-PuzzleElement.Convexity;
                rect.width = element.width;
                rect.height = element.height;
                // создаем кусок из исходной картинки
                bitmapData.copyPixels(value, rect, new Point());
                // передаем куско выбранному элементу пазла
                element.Image = bitmapData;
            }
        }
		
	}

}