import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
   const Home(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Image.asset(
              'assets/images/quiz-logo.png',
              width: 250
            ),
          const SizedBox(height: 80,),
           Text(
            'Learn Flutter!',
            style: GoogleFonts.itim(fontSize: 30, color: Colors.white),
          ),
          const SizedBox(height: 40,),
          ElevatedButton.icon(onPressed: switchScreen,
              icon: const Icon(Icons.arrow_forward ,color: Colors.indigo,size: 30),
              label: const Text('Start Quiz',style: TextStyle(fontSize: 20, color: Colors.indigo),))
        ],
      ),
    );
  }
}
