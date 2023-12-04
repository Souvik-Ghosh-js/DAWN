import 'package:flutter/material.dart';
import 'package:app/question_model_brain.dart';
import 'package:google_fonts/google_fonts.dart';

class brainstrokepage extends StatefulWidget {
  @override
  _BrainstrokePageState createState() => _BrainstrokePageState();
}

class _BrainstrokePageState extends State<brainstrokepage> {
  int currentQuestion = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container at the top of the page
          Container(
            width: screenWidth,
            height: 110,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 70,
                  child: Text(
                    'Brain Stroke Prediction',
                    style: GoogleFonts.josefinSans(
                      textStyle: const TextStyle(
                        color: Colors.teal,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Question ${currentQuestion + 1}/${sampleQuestions.length}",
                    style: const TextStyle(
                      color: Colors.teal,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: sampleQuestions.length,
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (index) {
                        setState(() {
                          currentQuestion = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final question = sampleQuestions[index];
                        return ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Text(
                              sampleQuestions[index].question,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(height: 15),
                            if (question.options != null )
                              ...List.generate(
                                question.options!.length,
                                    (optionIndex) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: RadioListTile(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(4)),
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                        horizontal: 8.0,
                                      ),
                                      selectedTileColor: Colors.teal.shade100,
                                      tileColor: Theme.of(context).colorScheme.background,
                                      title: Text(
                                        question.options![optionIndex],
                                      ),
                                      selected: question.userAnswer == question.options![optionIndex],
                                      value: question.options![optionIndex],
                                      activeColor: Theme.of(context).colorScheme.onPrimaryContainer,
                                      groupValue: question.userAnswer,
                                      onChanged: (value) {
                                        setState(() {
                                          sampleQuestions[index].userAnswer = value.toString();
                                        });
                                      },
                                    ),
                                  );
                                },
                              )
                            else
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      sampleQuestions[index].userAnswer = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Type your answer here',
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.maxFinite,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        if (currentQuestion < sampleQuestions.length - 1) {
                          setState(() {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                            currentQuestion++;
                          });
                        }
                      },
                      child: Text(
                        currentQuestion < sampleQuestions.length - 1 ? "Next" : "Submit",
                        style: GoogleFonts.josefinSans(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal.shade50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
