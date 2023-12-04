import 'package:app/brainstroke.dart';
import 'package:app/kidneypage.dart';
import 'package:app/menstural.dart';
import 'package:app/diabetes.dart';
import 'package:app/heartpage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class firstpage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
// Color when active

}
class CustomDialogWidget extends StatelessWidget {
  final String apiResponse;

  const CustomDialogWidget({super.key, required this.apiResponse});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(23)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/healthcare.png',
              width: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text('As a doctor I can assume',
                style: GoogleFonts.josefinSans(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5bc1ac)
                ),),
            ),
            Text(apiResponse ?? ' ',
              style: GoogleFonts.fahkwang(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff8cd3c4)
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class _FirstPageState extends State<firstpage> {
  Color _micIconColor = Colors.black; // Initial color
  Color _activeMicIconColor = Colors.red;
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  TextEditingController _searchBarController = TextEditingController();
  void _startListening() async {
    try {
      if (!_isListening) {
        bool available = await _speech.initialize(
          onStatus: (status) {
            // Handle speech recognition status
          },
          onError: (error) {
            // Handle speech recognition error
          },
        );

        if (available) {
          setState(() {
            _isListening = true;
            _micIconColor = _activeMicIconColor;
          });

          await _speech.listen(
            onResult: (result) async {
              setState(() {
                _searchBarController.text = result.recognizedWords;
              });

            },
          );
        }
      } else {
        setState(() {
          _isListening = false;
          _micIconColor = Colors.black;
          _speech.stop();
        });
      }
    } catch (e) {
      print('Error during speech recognition: $e');
    }
  }
  Future<void> _callApi(String recognizedText, Function(String) onResponse) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse('http://172.20.10.3:8000/getSymptoms/');
      var request = http.Request('POST', url);
      request.body = json.encode({
        "text": recognizedText,
      });
      request.headers.addAll(headers);

      http.Response response = await http.post(url, headers: headers, body: request.body);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        String answer = data['response'];
        onResponse(answer);
      } else {
        print('API call failed with status ${response.statusCode}');
        print(response.body);
        // Handle API call failure
      }
    } catch (e) {
      print('Error during API call: $e');
      // Handle API call error
    }
  }





  void redirectToBrainstrokePage(BuildContext context) {
    // Navigate to the new page when img1 is clicked
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => brainstrokepage(), // Replace NewPage with your desired page
      ),
    );
  }

  void redirectToKidneyPage(BuildContext context) {
    // Navigate to the new page when img1 is clicked
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => kidneypage(), // Replace NewPage with your desired page
      ),
    );
  }
  void redirectToDiabetesPage(BuildContext context) {
    // Navigate to the new page when img1 is clicked
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => diabetespage(), // Replace NewPage with your desired page
      ),
    );
  }
  void redirectToHeartPage(BuildContext context) {
    // Navigate to the new page when img1 is clicked
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => heartpage(), // Replace NewPage with your desired page
      ),
    );
  }
  void redirectToMensturalPage(BuildContext context) {
    // Navigate to the new page when img1 is clicked
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => mensturalpage(), // Replace NewPage with your desired page
      ),
    );
  }



  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return OrientationBuilder(
        builder: (context, orientation)
        {
          // Use screenWidth and orientation to adjust widget positions and sizes
          return SingleChildScrollView(

            child: Column(

                children: [
                  Container(
                    width: screenWidth,
                    height: 180,
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
                          top: 70, // Adjust top position as needed
                          right: orientation == Orientation.portrait ? 180 : 320,
                          child:
                          Text('Ardents',
                            style: GoogleFonts.josefinSans(
                              textStyle: const TextStyle(
                                color: Colors.teal,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ),
                        ),
                        Positioned(
                          top: 115, // Adjust top position as needed
                          right: orientation == Orientation.portrait ? 30 : 180,
                          child:
                          Text('Be your own first AID',
                            style: GoogleFonts.varela(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                          ),
                        ),
                      ],
                    ),

                  ),
                  Container(
                    width: screenWidth,
                    height: 390,
                    decoration: const BoxDecoration(
                      // border: Border.all(
                      //   color: Colors.blue,
                      //   width: 2.0,
                      // ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 21,
                          right:orientation == Orientation.portrait ? 120 : 320, // Adjust the vertical position
                          child: Image.asset(
                            'assets/images/pngegg.png',
                            // Replace with your image asset
                            width: 320, // Set the desired width
                          ),
                        ),
                        Positioned(
                          top: 21,
                          right: orientation == Orientation.portrait ? 20 : 230, // Adjust the vertical position
                          child: Image.asset(
                            'assets/images/prob1.png',
                            // Replace with your image asset
                            width: 170, // Set the desired width
                          ),
                        ),
                        Positioned(
                          top: 175,
                          right: orientation == Orientation.portrait ? 40 : 260, // Adjust the vertical position
                          child: GestureDetector(
                              onTap: _startListening,
                              child: SvgPicture.asset(
                                'assets/images/mic.svg',
                                color: _micIconColor,
                                width: 57,
                              )
                          ),
                        ),

                        Positioned(
                          top: 181,
                          right: orientation == Orientation.portrait ? 102 : 320, // Adjust the vertical position
                          child: Image.asset(
                            'assets/images/speak.png',
                            // Replace with your image asset
                            width: 50, // Set the desired width
                          ),
                        ),
                        Positioned(
                          top: 234,
                          right: orientation == Orientation.portrait ? 45 : 270, // Adjust the vertical position
                          child: const Text('Tap To Speak', style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold), // Set the desired width
                          ),
                        ),
                        Positioned(
                          top: 270,
                          child: Container(
                            width: 360,
                            padding: EdgeInsets.all(20),
                            child: TextField(
                              controller: _searchBarController,
                              decoration: InputDecoration(
                                hintText: 'Search....',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon:  GestureDetector(
                                  onTap: () {
                                    _callApi(_searchBarController.text, (apiResponse) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => CustomDialogWidget(apiResponse: apiResponse),
                                      );
                                    });
                                  },
                                  child: Icon(Icons.search),
                                ),

                              ),
                            ),
                          ),
                        ),
                      ],

                    ),

                  ),
                  Container(
                    // decoration: BoxDecoration(
                    //   border: Border.all(
                    //     width: 0.3,
                    //   )
                    // ),
                      width: screenWidth,
                      height: 75,
                      child: Stack(
                          children: [
                            Positioned(
                                top: 10,
                                left: orientation == Orientation.portrait ? 20 : 20,

                                child: Text('What do you want to', style: GoogleFonts.josefinSans(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                                )
                            ),
                            Positioned(
                                top: 35,
                                left: orientation == Orientation.portrait ? 38 : 40,
                                child: Text('be', style: GoogleFonts.josefinSans(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                                )
                            ),
                            Positioned(
                                top: 34,
                                left: orientation == Orientation.portrait ? 66 : 64,
                                child: Text('DIAGNOSED', style: GoogleFonts.josefinSans(
                                  textStyle: const TextStyle(
                                    color: Colors.teal,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                                )
                            ),
                            Positioned(
                                top: 35,
                                right: orientation == Orientation.portrait ?  86 : 555,
                                child: Text('with ?', style: GoogleFonts.josefinSans(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                                )
                            ),

                          ]
                      )

                  ),
                  Center(
                    child: Container(
                      // decoration: BoxDecoration(
                      //   border: Border.all(
                      //     width: 0.0,
                      //   )
                      // ),
                      width: screenWidth,
                      height: 235,
                      child: PageView.builder(
                        itemCount: 5, // Number of containers
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Container(
                                child: Stack(
                                    children:[
                                      Positioned(
                                        top:30 ,
                                        left:orientation == Orientation.portrait ? 105 : 352,
                                        child:
                                        GestureDetector(
                                          onTap: () {
                                            redirectToBrainstrokePage(context);
                                          },
                                          child:
                                          Image.asset('assets/images/brain.png',
                                            width: 170,
                                          ),
                                        ),
                                      ),

                                      Positioned(
                                          top: 158,
                                          left:orientation == Orientation.portrait ? 165 : 382,
                                          child: Text('BRAIN' , style: GoogleFonts.arapey(
                                              textStyle: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 22,
                                                color: Colors.teal,
                                              )
                                          ), )),
                                      Positioned(
                                          top:95,
                                          right: 10,
                                          child: Icon(Icons.arrow_back_ios_new_outlined)

                                      )
                                    ]
                                )
                            );
                          }
                          else if (index == 1) {
                            return Container(
                                child: Stack(
                                    children:[
                                      Positioned(
                                        top:38 ,
                                        left:orientation == Orientation.portrait ? 137 : 352,
                                        child:
                                        GestureDetector(
                                          onTap: () {
                                            redirectToBrainstrokePage(context);
                                          },
                                          child:
                                          Image.asset('assets/images/img1.png',
                                            width: 120,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          top: 164,
                                          left:orientation == Orientation.portrait ? 164 : 382,
                                          child: Text('KIDNEY' , style: GoogleFonts.arapey(
                                              textStyle: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 22,
                                                color: Colors.teal,
                                              )
                                          ), )),
                                      const Positioned(
                                          top:95,
                                          right: 10,
                                          child: Icon(Icons.arrow_back_ios_new_outlined)

                                      ),

                                    ]
                                )
                            );
                          }
                          else if (index == 2) {
                            return Container(
                                child: Stack(
                                    children:[
                                      Positioned(
                                        top:38 ,
                                        left:orientation == Orientation.portrait ? 137 : 352,
                                        child:
                                        GestureDetector(
                                          onTap: () {
                                            redirectToDiabetesPage(context);
                                          },
                                          child:
                                          Image.asset('assets/images/diabetes.png',
                                            width: 122,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          top: 164,
                                          left:orientation == Orientation.portrait ? 150 : 382,
                                          child: Text('DIABETES' , style: GoogleFonts.arapey(
                                              textStyle: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 22,
                                                color: Colors.teal,
                                              )
                                          ), )),
                                      const Positioned(
                                          top:95,
                                          right: 10,
                                          child: Icon(Icons.arrow_back_ios_new_outlined)

                                      )
                                    ]
                                )
                            );
                          }
                          else if (index == 3) {
                            return Container(
                                child: Stack(
                                    children:[
                                      Positioned(
                                        top:38 ,
                                        left:orientation == Orientation.portrait ? 155 : 352,
                                        child:
                                        GestureDetector(
                                          onTap: () {
                                            redirectToHeartPage(context);
                                          },
                                          child:
                                          Image.asset('assets/images/img3.png',
                                            width: 85,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          top: 168,
                                          left:orientation == Orientation.portrait ? 168 : 382,
                                          child: Text('HEART' , style: GoogleFonts.arapey(
                                              textStyle: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 22,
                                                color: Colors.teal,
                                              )
                                          ), )),
                                      const Positioned(
                                          top:95,
                                          right: 10,
                                          child: Icon(Icons.arrow_back_ios_new_outlined)

                                      )
                                    ]
                                )
                            );
                          }
                          else if (index == 4) {
                            return Container(
                                child: Stack(
                                    children:[
                                      Positioned(
                                        top:20 ,
                                        left:orientation == Orientation.portrait ? 105 : 352,
                                        child:
                                        GestureDetector(
                                          onTap: () {
                                            redirectToMensturalPage(context);
                                          },
                                          child:
                                          Image.asset('assets/images/img4 (2).png',
                                            width: 170,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          top: 178,
                                          left:orientation == Orientation.portrait ? 107 : 382,
                                          child: Text('MENSTURAL CYCLE' , style: GoogleFonts.arapey(
                                              textStyle: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 22,
                                                color: Colors.teal,
                                              )
                                          ), ))
                                    ]
                                )
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                      width: screenWidth,
                      height: 50,
                      child : Stack(
                          children:[
                            Positioned(
                              left: 20,
                              child: Text('Blogs' , style: GoogleFonts.josefinSans(textStyle: TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.bold,
                                color : Colors.teal,
                              )),),
                            ),
                          ])
                  ),


                ]
            ),

          );
        }
    );
  }

}