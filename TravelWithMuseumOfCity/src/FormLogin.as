package 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.net.*;
	import flash.net.sendToURL;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author sq
	 */
	public class FormLogin extends Sprite 
	{
		private var userMail:TextField;
		private var userName:TextField;
		private var userAge:TextField;
		private var buttonSendMessage:Button;
		
		public function FormLogin(ans1:String, ans2:String, ans3:String, ans4:String, ans5:String) {
			super();
			addChild(new background());
			init();
			var url:String = "http://localhost:8080/WebApplication1/NewServlet";
            var request:URLRequest = new URLRequest(url);
            var variables:URLVariables = new URLVariables();
            //variables.exampleSessionId = new Date().getTime();
            variables.exampleUserLabel = ans1;
			//variables.answer1 = "ответ1: /n"+ans1+"/n";
			//variables.answer2 = "ответ2: /n"+ans2+"/n";
			//variables.answer3 = "ответ3: /n"+ans3+"/n";
			//variables.answer4 = "ответ4: /n"+ans4+"/n";
			//variables.answer5 = "ответ5: /n" + ans5 + "/n";
			//trace(ans1)
            request.data = variables;
			//request.method = URLRequestMethod.POST;
            //navigateToURL(request);
			sendToURL(request);
			//this.addChild(new FormLogin());
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
		
		//private sendToMessage(e:MouseEvent):void {}
	}

}
