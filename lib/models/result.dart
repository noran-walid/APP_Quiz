import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/summary.dart';

import '../data/questions.dart';

class Result extends StatelessWidget {
  const Result(this.selectedAnswers, this.restart, {super.key});

  final List<String> selectedAnswers;
  final void Function() restart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int numOfCorrectAnswer = summaryData
        .where((element) => element['user_answer'] == element['correct_answer'])
        .length;

    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'You answered $numOfCorrectAnswer out of ${questions.length} questions correctly!',
            style: GoogleFonts.itim(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
          Summary(summaryData),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
            onPressed: restart,
            icon: const Icon(
              Icons.restart_alt_outlined,
              color: Colors.indigo,
            ),
            label: const Text('Restart Quiz!',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
