import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Summary extends StatelessWidget {
  const Summary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map((e) => Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              e['user_answer'] == e['correct_answer']
                                  ? Colors.green
                                  : Colors.red,
                          radius: 12,
                          child: Text(
                              ((e['question_index'] as int) + 1).toString()),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e['question'].toString(),
                                  style: GoogleFonts.lato(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(e['user_answer'].toString(),
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center),
                              Text(e['correct_answer'].toString(),
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
