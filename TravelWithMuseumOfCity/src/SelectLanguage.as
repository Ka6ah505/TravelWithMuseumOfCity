package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.system.Capabilities;
	import flash.net.*;
	import flash.display.MovieClip;
	import flash.events.TimerEvent; 
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author sq
	 */
	public class SelectLanguage extends Sprite 
	{
		private var bg:backgroundGame;
		//private var buttonRU:Button;
		//private var buttonEN:Button;
		private var flagRU: Array;
		private var flagEU:Array;
		
		private	var current_frame: int;
		private	var _timer:Timer;
		
		public function SelectLanguage() 
		{
			super();
			bg = new backgroundGame();
			bg.width = Capabilities.screenResolutionY;
			bg.height = Capabilities.screenResolutionY;
			addChild(bg);
			/*var _colors:Array = [0xFfffff, 0xEC748B, 0xC13A59, 0xA81230];
			buttonEN = new Button(_colors);
			buttonRU = new Button(_colors);
			
			buttonEN.label = "English";
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
			addChild(buttonRU);*/
			
			current_frame = 1;
			flagRU = new Array();
			flagEU = new Array();

			flagRU.push(new flasgRU_1);
			flagRU.push(new flasgRU_2);
			flagRU.push(new flasgRU_3);
			flagRU.push(new flasgRU_4);
			flagRU.push(new flasgRU_5);
			flagRU.push(new flasgRU_6);
			flagRU.push(new flasgRU_7);
			flagRU.push(new flasgRU_8);
			flagRU.push(new flasgRU_9);
			flagRU.push(new flasgRU_10);
			flagRU.push(new flasgRU_11);
			flagRU.push(new flasgRU_12);
			flagRU.push(new flasgRU_13);
			flagRU.push(new flasgRU_14);
			flagRU.push(new flasgRU_15);
			flagRU.push(new flasgRU_16);
			flagRU.push(new flasgRU_17);
			flagRU.push(new flasgRU_18);
			flagRU.push(new flasgRU_19);
			flagRU.push(new flasgRU_20);
			
			flagEU.push(new flagEU_1);
			flagEU.push(new flagEU_2);
			flagEU.push(new flagEU_3);
			flagEU.push(new flagEU_4);
			flagEU.push(new flagEU_5);
			flagEU.push(new flagEU_6);
			flagEU.push(new flagEU_7);
			flagEU.push(new flagEU_8);
			flagEU.push(new flagEU_9);
			flagEU.push(new flagEU_10);
			flagEU.push(new flagEU_11);
			flagEU.push(new flagEU_12);
			flagEU.push(new flagEU_13);
			flagEU.push(new flagEU_14);
			flagEU.push(new flagEU_15);
			flagEU.push(new flagEU_16);
			flagEU.push(new flagEU_17);
			flagEU.push(new flagEU_18);
			flagEU.push(new flagEU_19);
			flagEU.push(new flagEU_20);
			
			for ( var i:int = 0; i < 20; i++ ) {
				addChild(flagRU[i]);
				addChild(flagEU[i]);
				flagRU[i].addEventListener(MouseEvent.MOUSE_UP, handlerButto1);
				flagEU[i].addEventListener(MouseEvent.MOUSE_UP, handlerButto2);
				
				(Sprite)(flagRU[i]).visible = false;
				(Sprite)(flagRU[i]).x = this.width / 2 - 100;
				(Sprite)(flagRU[i]).y = this.height / 1.5;
				
				(Sprite)(flagEU[i]).visible = false;
				(Sprite)(flagEU[i]).x = this.width / 2 - 100;
				(Sprite)(flagEU[i]).y = this.height / 2.3;
				//(MovieClip)(zomby_frames[i]).addEventListener(MouseEvent.CLICK, handlerButto);
			}
			(Sprite)(flagRU[0]).visible = true;
			(Sprite)(flagEU[0]).visible = true;
			_timer = new Timer(100);
			_timer.addEventListener("timer", onTimer); 
			_timer.start();
		}
		
		public function onTimer(event:TimerEvent):void { 
			(Sprite)(flagRU[current_frame-1]).visible = false;
			(Sprite)(flagEU[current_frame-1]).visible = false;
			if ( current_frame < 20 ) {
				current_frame += 1;
			} else {
				current_frame = 1;
			}
			(Sprite)(flagRU[current_frame-1]).visible = true;
			(Sprite)(flagEU[current_frame-1]).visible = true;
		}
		
		/*private function handlerButton(e:MouseEvent):void { 
			if (e.target == buttonEN) {
				Language.setEnglish();
			} else if (e.target == buttonRU) {
				Language.setRussian();
			}
			removeChildren();
			addChild(new MainMenu());
			
		}*/
		
		private function handlerButto1(e:MouseEvent):void { 
			Language.setRussian();
			removeChildren();
			addChild(new MainMenu());
			
		}
		
		private function handlerButto2(e:MouseEvent):void { 
			Language.setEnglish();
			removeChildren();
			addChild(new MainMenu());
			
		}
		
	}

}