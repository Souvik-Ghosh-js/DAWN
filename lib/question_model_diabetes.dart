// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuestionModel {
  final String question;
  final String answer;
  final List<String>? options;
  final bool hasAnswered;
  String userAnswer;
  QuestionModel({
    required this.question,
    required this.answer,
    this.options,
    this.hasAnswered = false,
    this.userAnswer = "",
  });

  // check if the answer is correct
  bool isCorrect(String answer) => this.answer == answer;
}

List<QuestionModel> sampleQuestions = [
  QuestionModel(
    question: "What is your age?",
    answer: "",
    options: null,
  ),
  QuestionModel(
    question: "No. of you were pregnant (Including Abortions)",
    answer: "",
    options: null,
  ),
  QuestionModel(
    question: "What is your Glucose level [Plasma glucose concentration of 2 hours in an oral glucose tolerance test]",
    answer: "",
    options: null,
  ),
  QuestionModel(
    question: "What is you Blood Pressure [Diastolic blood pressure] (in mm Hg)",
    answer: "",
    options: null,
  ),
  QuestionModel(
    question: "What is the thickness of your skin [Triceps skin fold thickness] (in mm)",
    answer: "",
    options: null,
  ),
  QuestionModel(
    question: "What is you insulin level [ 2 hour serum insulin ] ( mu U/ml)",
    answer: "",
    options: null,
  ),
  QuestionModel(
    question: "What is your BMI index",
    answer: "",
    options: null,
  ),
  QuestionModel(
    question: " Diabetes pedigree function",
    answer: "",
    options: null,
  ),

  QuestionModel(
    question: "Average Glucose Level in Blood",
    answer: "",
    options:null,
  ),
  QuestionModel(
    question: "What is your BMI index",
    answer: "",
    options: null,
  ),
];