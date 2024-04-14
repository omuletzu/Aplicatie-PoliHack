import 'package:aplicatie_polihack_v15/Authentication/sign_up_provider.dart';
import 'package:aplicatie_polihack_v15/Authentication/signup_for_user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectionSignUp extends StatefulWidget {
  const SelectionSignUp({Key? key});

  @override
  _SelectionSignUpState createState() => _SelectionSignUpState();
}

class _SelectionSignUpState extends State<SelectionSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                      (route) => false);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white, // Change container color to white
                    border: Border.all(
                        color: Color.fromRGBO(17, 138, 178, 1),
                        width: 4.0), // Add border
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          ' Sign up\n as a \n user',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                            color: Color.fromRGBO(17, 138, 178, 1),
                            fontSize: 34,
                            fontWeight: FontWeight.w900,
                          )),
                        ),
                      ),
                      FaIcon(
                        FontAwesomeIcons.users,
                        size: 80.0,
                        color: Color.fromRGBO(17, 138, 178, 1),
                      ),
                      SizedBox(width: 10), // Adjust the width as needed
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'What are you signing up as?',
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                )),
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpProvider()),
                      (route) => false);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                    border: Border.all(
                        color: Color.fromRGBO(17, 138, 178, 1), width: 4.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          ' Sign up\n as a \n provider',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                            color: Color.fromRGBO(17, 138, 178, 1),
                            fontSize: 34,
                            fontWeight: FontWeight.w900,
                          )),
                        ),
                      ),
                      FaIcon(
                        FontAwesomeIcons.toolbox,
                        size: 80.0,
                        color: Color.fromRGBO(17, 138, 178, 1),
                      ),
                      SizedBox(width: 10), // Adjust the width as needed
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
