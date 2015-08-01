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
		public static const QUEST2_FILE:String = "quest2_en";
		public static const COUNT_QUESTION:String = "tfCount";
		public static const BACK_STATE:String = "backButton";
		public static const RESULT_TEXT:String = "tf";
		public static const START_QUIZ:String = "quizButton";
		public static const START_QUESTIONS:String = "questionsButton";
		public static const QUESTIONS_ANSWER_Perfect:String = "perfect";
		public static const QUESTIONS_ANSWER_Good:String = "good";
		public static const QUESTIONSANSWER_Bad:String = "bad";
		
		public static var current:String = "none";
		private static var _labels:Object = {};
		
		public static function setEnglish():void {
			_labels[EXIT_TEST] = "Finish test";
			_labels[QUEST_FILE] = "quest_en.xml";
			_labels[QUEST2_FILE] = "quest2_en.xml";
			_labels[COUNT_QUESTION] = "Question: №";
			_labels[BACK_STATE] = "Back";
			_labels[RESULT_TEXT] = "Correct answers: ";
			_labels[START_QUIZ] = "Puzzle museum";
			_labels[START_QUESTIONS] = "Puzzle museum-2";
			_labels[QUESTIONS_ANSWER_Perfect] = "Congratulations! You know very well the history of Yaroslavl! We will be glad to see such an expert in our museum!";
			_labels[QUESTIONS_ANSWER_Good] = "Good result! But it can be improved, we visited the Museum!";
			_labels[QUESTIONSANSWER_Bad] = "Come to the Museum for knowledge!";
			
			current = "eng";
		}
		public static function setRussian():void {
			_labels[EXIT_TEST] = "Завершить тест";
			_labels[QUEST_FILE] = "quest_ru.xml";
			_labels[QUEST2_FILE] = "quest2_ru.xml";
			_labels[COUNT_QUESTION] = "Вопрос: №";
			_labels[BACK_STATE] = "Назад";
			_labels[RESULT_TEXT] = "Верных ответов: ";
			_labels[START_QUIZ] = "Музейный пазл";
			_labels[START_QUESTIONS] = "Музейный пазл-2";
			_labels[QUESTIONS_ANSWER_Perfect] = "Поздравляем! Вы отлично знаете историю ярославля! Будем рады видеть такого знатока у нас в Музее!";
			_labels[QUESTIONS_ANSWER_Good] = "Хороший результат! Но его можно улучшить, побывав у нас в Музее!";
			_labels[QUESTIONSANSWER_Bad] = "Срочно в Музей за знаниями!";
			
			current = "rus";
		}
		
		public static function setDeutch():void {
			_labels[EXIT_TEST] = "Finish test";
			_labels[QUEST_FILE] = "quest_en.xml";
			_labels[QUEST2_FILE] = "quest2_en.xml";
			_labels[COUNT_QUESTION] = "Question: №";
			_labels[BACK_STATE] = "Back";
			_labels[RESULT_TEXT] = "Correct answers: ";
			_labels[START_QUIZ] = "Puzzle museum";
			_labels[START_QUESTIONS] = "Puzzle museum-2";
			_labels[QUESTIONS_ANSWER_Perfect] = "Congratulations! You know very well the history of Yaroslavl! We will be glad to see such an expert in our museum!";
			_labels[QUESTIONS_ANSWER_Good] = "Good result! But it can be improved, we visited the Museum!";
			_labels[QUESTIONSANSWER_Bad] = "Come to the Museum for knowledge!";
			
			current = "eng";
		}
		
		public static function getText(id:String):String {
			return (_labels[id] == null) ? "undefined" : _labels[id];
		}
	}

}