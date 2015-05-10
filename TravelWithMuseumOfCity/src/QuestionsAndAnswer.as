package 
{
	import flash.display.Loader;
	/**
	 * ...
	 * @author sega
	 */
	public class QuestionsAndAnswer 
	{
		private var question:String;
		private var answerA:String;
		private var answerB:String;
		private var answerC:String;
		private var answerD:String;
		private var trueAnswer:int;
		private var pic:String;
		
		public function QuestionsAndAnswer(question:String, answerA:String, answerB:String, answerC:String, answerD:String, trueAnswer:int, pic:String) 
		{
			this.question = question;
			this.answerA = answerA;
			this.answerB = answerB;
			this.answerC = answerC;
			this.answerD = answerD;
			this.trueAnswer = trueAnswer;
			this.pic = pic;
		}
		
		public function getQuestion():String {
			return question;
		}
		public function getAnswerA():String {
			return answerA;
		}
		public function getAnswerB():String {
			return answerB;
		}
		public function getAnswerC():String {
			return answerC;
		}
		public function getAnswerD():String {
			return answerD;
		}
		public function getTrueAnswer():int {
			return trueAnswer;
		}
		public function getPic():String {
			return pic;
		}
	}

}