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
    question: "Specify your gender",
    answer: "",
    options: [
      "Male",
      "Female",
      "Others",
    ],
  ),
  QuestionModel(
    question: "What is your Age",
    answer: "",
    options: null,
  ),
  QuestionModel(
    question: "Do you have Hypertension",
    answer: "",
    options: [
      "yes","no"
    ],
  ),
  QuestionModel(
    question: "Do you suffer from any kind of Heart Diseases",
    answer: "",
    options: [
      "yes","no"
    ],
  ),
  QuestionModel(
    question: "Are you married",
    answer: "",
    options: [
      "yes","no"
    ],
  ),
  QuestionModel(
    question: "Work Type",
    answer: "",
    options: [
      "Still Pursuing Education","Govt. Job",
      "Never worked", "Private","Self-Employed"
    ],
  ),
  QuestionModel(
    question: "Residence Type",
    answer: "",
    options: [
      "Rural" , "Urban"
    ],
  ),
  QuestionModel(
    question: "What is your urine colour",
    answer: "",
    options: [
      "Dark(like tea or cola",
      "Pale",
      "Bubbly",
      "Blood",
      "Brown",

    ],
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
  QuestionModel(
    question: "Smoking Status",
    answer: "",
    options: [
      "Formerly Smoked","Never Smoked","Smokes","won't say",
    ],
  ),QuestionModel(
    question: "Did you had any types of strokes previously",
    answer: "",
    options: [
      "Yes","No",
    ],
  ),
];