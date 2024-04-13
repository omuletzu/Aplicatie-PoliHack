import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('OmniLearn'),
          centerTitle: true,
          titleTextStyle: GoogleFonts.comicNeue(
            textStyle: const TextStyle(color: Color.fromRGBO(69, 146, 197, 1), fontSize: 30.0), // Modify text color here
          ),
          backgroundColor: const Color.fromRGBO(240, 241, 246, 1),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.black45,), // Hamburger menu icon
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Open drawer when icon is pressed
                },
              );
            },
          ),
        ),

        drawer: Drawer(
          // Define your drawer contents here
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                child: Text(''),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 241, 246, 1),
                ),
              ),
              ListTile(
                title: const Text('Home', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w800)),
                textColor: const Color.fromRGBO(0, 0, 0, 1),
                titleTextStyle: GoogleFonts.openSans(),
                leading: const Icon(Icons.house_outlined, color: Colors.black45),
                onTap: () {
                  // Add your onTap logic here
                },
              ),
              ListTile(
                title: const Text('Settings', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w800)),
                textColor: const Color.fromRGBO(0, 0, 0, 1),
                titleTextStyle: GoogleFonts.openSans(),
                leading: const Icon(Icons.settings, color: Colors.black45),
                onTap: () {
                  // Add your onTap logic here
                },
              ),
              ListTile(
                title: const Text('Log out', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w800)),
                textColor: const Color.fromRGBO(0, 0, 0, 1),
                titleTextStyle: GoogleFonts.openSans(),
                leading: const Icon(Icons.logout, color: Colors.black45),
                onTap: () {
                  // Add your onTap logic here
                },
              ),
            ],
          ),
        ),

          body: Column(
            children: [
              Expanded(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Expanded(
                      child: Material(
                        child: Container(
                          color: const Color.fromRGBO(240, 241, 246, 1),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add onPressed logic
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, double.infinity),
                                  padding: const EdgeInsets.all(0.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color.fromRGBO(69, 146, 197, 1),
                                        Color.fromRGBO(101, 194, 226, 1),
                                      ],
                                    ),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(20.0),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.house,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                        SizedBox(width: 8),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Home',
                                              style: TextStyle(fontSize: 25.0, color: Colors.white),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              'This is the description of the home',
                                              style: TextStyle(fontSize: 16.0, color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Material(
                        child: Container(
                          color: const Color.fromRGBO(240, 241, 246, 1),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add onPressed logic
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, double.infinity),
                                  padding: const EdgeInsets.all(0.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color.fromRGBO(69, 146, 197, 1),
                                        Color.fromRGBO(101, 194, 226, 1),
                                      ],
                                    ),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(20.0),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.car,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                        SizedBox(width: 8),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Car',
                                              style: TextStyle(fontSize: 25.0, color: Colors.white),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              'This is the description of the home',
                                              style: TextStyle(fontSize: 16.0, color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Material(
                        child: Container(
                          color: const Color.fromRGBO(240, 241, 246, 1),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add onPressed logic
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, double.infinity),
                                  padding: const EdgeInsets.all(0.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color.fromRGBO(69, 146, 197, 1),
                                        Color.fromRGBO(101, 194, 226, 1),
                                      ],
                                    ),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(20.0),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.lightbulb,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                        SizedBox(width: 8),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Technology',
                                              style: TextStyle(fontSize: 25.0, color: Colors.white),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              'This is the description of the home',
                                              style: TextStyle(fontSize: 16.0, color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
