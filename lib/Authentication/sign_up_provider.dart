import 'package:aplicatie_polihack_v15/Authentication/firebase_auth_methods.dart';
import 'package:aplicatie_polihack_v15/Authentication/form_container.dart';
import 'package:aplicatie_polihack_v15/Authentication/login_page.dart';
import 'package:aplicatie_polihack_v15/global/common/toast.dart';
import 'package:aplicatie_polihack_v15/loading_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpProvider extends StatefulWidget {
  const SignUpProvider({super.key});

  @override
  State<SignUpProvider> createState() => _SignUpProviderState();
}

class _SignUpProviderState extends State<SignUpProvider> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  bool isSigningUp = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoadingScreen()),
                (route) => false);
          },
        ),
        title: Text(
          "SkillBoost",
          style: GoogleFonts.openSans(
            textStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("\n\n\nSign Up",
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 32,
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            FormContainerWidget(
              controller: _nameController,
              hintText: "Full name/Company name",
              isPasswordField: false,
            ),
            const SizedBox(
              height: 10,
            ),
            FormContainerWidget(
              controller: _emailController,
              hintText: "Email",
              isPasswordField: false,
            ),
            const SizedBox(
              height: 10,
            ),
            FormContainerWidget(
              controller: _phoneController,
              hintText: "Phone Number",
              isPasswordField: false,
            ),
            const SizedBox(
              height: 10,
            ),
            FormContainerWidget(
              controller: _passwordController,
              hintText: "Password",
              isPasswordField: true,
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                _signUp();
              },
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(17, 138, 178, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: isSigningUp
                      ? CircularProgressIndicator(
                          color: Color.fromRGBO(17, 138, 178, 1))
                      : Text(
                          "Sign up",
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (route) => false);
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Color.fromRGBO(17, 138, 178, 1),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String phoneNumber = _phoneController.text;
    email = email.replaceAll(" ", "");

    // Sign up the user with email and password
    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      // User registration successful, add user details to Firestore
      await FirebaseFirestore.instance
          .collection('providers')
          .doc(user.uid)
          .set({
        'name': name,
        'email': email,
        'phone number': phoneNumber,
      });

      // Update the UI
      setState(() {
        isSigningUp = false;
      });

      // Navigate to the home page
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoadingScreen()));

      // Show success message
      showToast(message: "User successfully created");
    } else {
      // User registration failed
      setState(() {
        isSigningUp = false;
      });
      showToast(message: "Some error occurred");
    }
  }
}
