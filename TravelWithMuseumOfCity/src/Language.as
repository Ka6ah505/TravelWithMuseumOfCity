package 
{
	/**
	 * ...
	 * @author sq
	 */
	public class Language 
	{
		public static const EXIT_TEST:String = "exitQuizState";
		public static const QUEST_FILE:String = "quest_en";
		public static const COUNT_QUESTION:String = "tfCount";
		public static const BACK_STATE:String = "backButton";
		public static const RESULT_TEXT:String = "tf";
		public static const START_QUIZ:String = "quizButton";
		public static const START_QUESTIONS:String = "questionsButton";
		
		public static var current:String = "none";
		private static var _labels:Object = {};
		
		public static function setEnglish():void {
			_labels[EXIT_TEST] = "Finish test";
			_labels[QUEST_FILE] = "quest_en.xml";
			_labels[COUNT_QUESTION] = "Question: №";
			_labels[BACK_STATE] = "Back";
			_labels[RESULT_TEXT] = "Correct answers: ";
			_labels[START_QUIZ] = "Quiz";
			_labels[START_QUESTIONS] = "Questions";
			current = "eng";
		}
		public static function setRussian():void {
			_labels[EXIT_TEST] = "Завершить тест";
			_labels[QUEST_FILE] = "quest_ru.xml";
			_labels[COUNT_QUESTION] = "Вопрос: №";
			_labels[BACK_STATE] = "Назад";
			_labels[RESULT_TEXT] = "Верных ответов: ";
			_labels[START_QUIZ] = "Викторина";
			_labels[START_QUESTIONS] = "Олимпиада";
			current = "rus";
		}
		
		public static function getText(id:String):String {
			return (_labels[id] == null) ? "undefined" : _labels[id];
		}


	}

}