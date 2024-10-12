import 'package:google_fonts/google_fonts.dart';
import 'answer_button.dart';
import 'package:flutter/material.dart';
import 'data/questions.dart';

class Question extends StatefulWidget {
  const Question(this.onSelectedAnswer, {super.key});

  final void Function(String) onSelectedAnswer;

  @override
  State<Question> createState() => _QuestionsState();
}

class _QuestionsState extends State<Question> {
  var currenQuestionsIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      currenQuestionsIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currenQuestions = questions[currenQuestionsIndex];
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currenQuestions.text,
              style: GoogleFonts.lato(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),

            // style: TextStyle(fontSize: 24, color: Colors.white),

            ...currenQuestions.shuffledAnswers.map(
              (e) {
                return Container(
                    margin: const EdgeInsets.all(10),
                    child: AnswerButton(
                      answerText: e,
                      onPressed: () => answerQuestion(e),
                    ));
              },
            ),

            const SizedBox(
              height: 20,
            ),
            // style: TextStyle(fontSize: 24, color: Colors.white),
          ]),
    );
  }
}
