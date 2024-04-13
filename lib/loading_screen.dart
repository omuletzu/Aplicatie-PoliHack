import 'package:aplicatie_polihack_v15/Authentication/selection_sign_up_page.dart';
import 'package:aplicatie_polihack_v15/Authentication/signup_for_user.dart';
import 'package:aplicatie_polihack_v15/home_page.dart';
import 'package:aplicatie_polihack_v15/menu_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    checkUserLoggedIn();
  }

  Future<void> checkUserLoggedIn() async {
    await Future.delayed(Duration(seconds: 1));

    //verificam daca utilizatorul este logat

    var user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Utilizatorul este logat , mergem la pagina principala
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BigMenu()),
      );
    } else {
      // Utilizatorul nu este logat , mergem la sign up page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SelectionSignUp()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
