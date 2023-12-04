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
    question: "What is your Height? (in cm)",
    answer: "",
    options: null,
  ),
  QuestionModel(
    question: "What is your Weight? (in kg)",
    answer: "",
    options: null,
  ),
  QuestionModel(
    question: "What is you Gender ?",
    answer: "",
    options: ["Male" ,"Female" , "Others"],
  ),
  QuestionModel(
    question: "What is your systolic blood pressure?",
    answer: "",
    options: null,
  ),
  QuestionModel(
    question: "What is your diastolic blood pressure?",
    answer: "",
    options: null,
  ),
  QuestionModel(
    question: "What is your Cholestrol Level",
    answer: "",
    options: ["Normal" ,"Above Normal" ,"Well Above Normal"],
  ),
  QuestionModel(
    question: "What is your Glucose Level",
    answer: "",
    options: ["Normal" ,"Above Normal" ,"Well Above Normal"],
  ),

  QuestionModel(
    question: "Do you Smoke?",
    answer: "",
    options:["yes", "no"],
  ),
  QuestionModel(
    question: "Do you consume alcohol?",
    answer: "",
    options: ["yes", "No"],
  ),
  QuestionModel(
    question: "How frequent are you with your physical Activity?",
    answer: "",
    options: ["Active", "Not much"],
  ),
  QuestionModel(
    question: " Do yo have any Cardiovascular Disease",
    answer: "",
    options: ["Yes", "No"],
  ),

];