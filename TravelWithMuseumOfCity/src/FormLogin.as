package 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	/**
	 * ...
	 * @author sq
	 */
	public class FormLogin extends Sprite 
	{
		private var userMail:TextField;
		private var userName:TextField;
		private var userAge:TextField;
		
		public function FormLogin() 
		{
			super();
			addChild(new background());
			init();
			
		}
		
		private function init():void {
			userName = new TextField();
			userMail = new TextField();
			userAge = new TextField();
			userName.type = TextFieldType.INPUT;
			userMail.type = TextFieldType.INPUT;
			userAge.type = TextFieldType.INPUT;
			userName.width = 200;
			userName.height = 30;
			userMail.width = 200;
			userMail.height = 30;
			userAge.width = 200;
			userAge.height = 30;
			userMail.y = 100;
			userAge.y = 130;
			userName.border = true;
			userName.background = true;
			userMail.border = true;
			userMail.background = true;
			userAge.border = true;
			userAge.background = true;
			addChild(userName);
			addChild(userMail);
			addChild(userAge);
		}
		
	}

}
