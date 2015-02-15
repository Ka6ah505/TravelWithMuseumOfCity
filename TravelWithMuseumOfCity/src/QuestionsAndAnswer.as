package 
{
	/**
	 * ...
	 * @author sega
	 */
	public class QuestionsAndAnswer 
	{
		var question:String;
		var answerA:String;
		var answerB:String;
		var answerC:String;
		var answerD:String;
		var trueAnswer:int;
		
		public function QuestionsAndAnswer(question, answerA, answerB, answerC, answerD, trueAnswer) 
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