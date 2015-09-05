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
		public static const RESULT_TEXT_SECOND:String = "tfs";
		public static const START_QUIZ:String = "quizButton";
		public static const START_QUESTIONS:String = "questionsButton";
		public static const QUESTIONS_ANSWER_Perfect:String = "perfect";
		public static const QUESTIONS_ANSWER_Good:String = "good";
		public static const QUESTIONS_ANSWER_Bad:String = "bad";
		public static const INVITATION:String = "inviation";
		public static const INVITATIONB:String = "inviationB";
		public static const FEEDBACK:String = "feedback";
		public static const FEEDBACKB:String = "feedbackb";
		
		public static var current:String = "none";
		private static var _labels:Object = {};
		
		public static function setEnglish():void {
			_labels[EXIT_TEST] = "Finish test";
			_labels[QUEST_FILE] = "quest_en.xml";
			_labels[QUEST2_FILE] = "quest2_en.xml";
			_labels[COUNT_QUESTION] = "Question: №";
			_labels[BACK_STATE] = "Back";
			_labels[RESULT_TEXT] = "You have ";
			_labels[RESULT_TEXT_SECOND] = " correct answers!";
			_labels[START_QUIZ] = "Puzzle museum";
			_labels[START_QUESTIONS] = "Puzzle museum-2";
			_labels[QUESTIONS_ANSWER_Perfect] = "Congratulations! You know very well the history of Yaroslavl! We will be glad to see such an expert in our museum!";
			_labels[QUESTIONS_ANSWER_Good] = "Good result! But it can be improved, we visited the Museum!";
			_labels[QUESTIONS_ANSWER_Bad] = "Come to the Museum for knowledge!";
			_labels[INVITATION] = "Try your hand at other difficult questions!";
			_labels[INVITATIONB] = "Attempt";
			_labels[FEEDBACK] = "If you wish to receive information on the activities of the museum, please send us your contact information";
			_labels[FEEDBACKB] = "Subscribe";
			
			current = "eng";
		}
		public static function setRussian():void {
			_labels[EXIT_TEST] = "Завершить тест";
			_labels[QUEST_FILE] = "quest_ru.xml";
			_labels[QUEST2_FILE] = "quest2_ru.xml";
			_labels[COUNT_QUESTION] = "Вопрос: №";
			_labels[BACK_STATE] = "Назад";
			_labels[RESULT_TEXT] = "Вы дали ";
			_labels[RESULT_TEXT_SECOND] = " верных ответов!";
			_labels[START_QUIZ] = "Музейный пазл";
			_labels[START_QUESTIONS] = "Музейный пазл-2";
			_labels[QUESTIONS_ANSWER_Perfect] = "Поздравляем! Вы отлично знаете историю ярославля! Будем рады видеть такого знатока у нас в Музее!";
			_labels[QUESTIONS_ANSWER_Good] = "Хороший результат! Но его можно улучшить, побывав у нас в Музее!";
			_labels[QUESTIONS_ANSWER_Bad] = "Срочно в Музей за знаниями!";
			_labels[INVITATION] = "Попробуйте свои силы в более сложных вопросах!";
			_labels[INVITATIONB] = "Попытаться";
			_labels[FEEDBACK] = "Если Вы хотите получать информацию о мероприятиях музея, пришлите нам вашу контактную информацию";
			_labels[FEEDBACKB] = "Подписаться";
			
			current = "rus";
		}
		
		public static function setDeutch():void {
			_labels[EXIT_TEST] = "Finish test";
			_labels[QUEST_FILE] = "quest_en.xml";
			_labels[QUEST2_FILE] = "quest2_en.xml";
			_labels[COUNT_QUESTION] = "Question: №";
			_labels[BACK_STATE] = "Back";
			_labels[RESULT_TEXT] = "Sie haben ";
			_labels[RESULT_TEXT_SECOND] = " richtige Antworten!";
			_labels[START_QUIZ] = "Puzzle museum";
			_labels[START_QUESTIONS] = "Puzzle museum-2";
			_labels[QUESTIONS_ANSWER_Perfect] = "Congratulations! You know very well the history of Yaroslavl! We will be glad to see such an expert in our museum!";
			_labels[QUESTIONS_ANSWER_Good] = "Good result! But it can be improved, we visited the Museum!";
			_labels[QUESTIONS_ANSWER_Bad] = "Come to the Museum for knowledge!";
			_labels[INVITATION] = "Попробуйте свои силы в более сложных вопросах!";
			_labels[INVITATIONB] = "ATTEMPT";
			_labels[FEEDBACK] = "If you wish to receive information on the activities of the museum, please send us your contact information";
			_labels[FEEDBACKB] = "Subscribe";
			
			current = "eng";
		}
		
		public static function getText(id:String):String {
			return (_labels[id] == null) ? "undefined" : _labels[id];
		}
	}

}