package 
{
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
		
		public function QuestionsAndAnswer(question:String, answerA:String, answerB:String, answerC:String, answerD:String, trueAnswer:int) 
		{
			this.question = question;
			this.answerA = answerA;
			this.answerB = answerB;
			this.answerC = answerC;
			this.answerD = answerD;
			this.trueAnswer = trueAnswer;
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
	}

}