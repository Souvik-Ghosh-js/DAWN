
import 'package:app/login.dart';

import 'package:app/homepage.dart';
import 'package:app/register.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

final stt.SpeechToText _speech = stt.SpeechToText();


void main() {
  runApp(
      MaterialApp(
    title: 'ARDENTS',

    debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins',
          canvasColor: Colors.teal.shade100,
          useMaterial3: true,
      ),

    initialRoute: 'homepage',
    routes: {
      'login' : (context)=> MyLogin(),
      'homepage' : (context) => MyHomePage(),
      'register' : (context) => MyRegister(),
    },
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ARDENTS',
//
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//           fontFamily: 'Poppins',
//           canvasColor: Colors.teal.shade100,
          // useMaterial3: true,
//           colorScheme: ColorScheme.fromSwatch(
//             primarySwatch: Colors.teal,
//           )
//       ),
//
//     );
//   }
// }
//




// return Column(
//       children: [
//         Container(
//           width: screenWidth,
//           height: 90,
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/images/bg2.jpg'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Positioned(
//                 top: 30, // Adjust top position as needed
//                 // right: orientation == Orientation.portrait ? 180 : 320,
//                 child:
//                 Text('Ardents',
//                   style: GoogleFonts.josefinSans(
//                     textStyle: const TextStyle(
//                       color: Colors.teal,
//                       fontSize: 40,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//
//                 ),
//               ),
//                 ])
//         ),








