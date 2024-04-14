import 'package:aplicatie_polihack_v15/MenuPages/menu_car.dart';
import 'package:aplicatie_polihack_v15/MenuPages/menu_home.dart';
import 'package:aplicatie_polihack_v15/MenuPages/menu_tech.dart';
import 'package:aplicatie_polihack_v15/global/common/toast.dart';
import 'package:aplicatie_polihack_v15/loading_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BigMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SkillBoost'),
          centerTitle: true,
          titleTextStyle: GoogleFonts.comicNeue(
            textStyle: const TextStyle(
                color: Color.fromRGBO(69, 146, 197, 1), fontSize: 30.0),
          ),
          backgroundColor: const Color.fromRGBO(240, 241, 246, 1),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black45,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: Drawer(
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
                title: const Text('Home',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w800)),
                textColor: Colors.black54,
                titleTextStyle: GoogleFonts.openSans(),
                leading:
                    const Icon(Icons.house_outlined, color: Colors.black45),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuPageHome(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Settings',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w800)),
                textColor: Colors.black54,
                titleTextStyle: GoogleFonts.openSans(),
                leading: const Icon(Icons.settings, color: Colors.black45),
                onTap: () {
                  // Add your onTap logic here
                },
              ),
              ListTile(
                title: const Text('Log out',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w800)),
                textColor: Colors.black54,
                titleTextStyle: GoogleFonts.openSans(),
                leading: const Icon(Icons.logout, color: Colors.black45),
                onTap: () {
                  _signOut(context);
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
                            child: Builder(
                              builder: (context) => ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MenuPageHome()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(
                                      double.infinity, double.infinity),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.house,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                        SizedBox(width: 8),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'House',
                                              style: TextStyle(
                                                  fontSize: 25.0,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              'Your guide to household tasks',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.white),
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
                            child: Builder(
                              builder: (context) => ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MenuPageCar()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(
                                      double.infinity, double.infinity),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.car,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                        SizedBox(width: 8),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Car',
                                              style: TextStyle(
                                                  fontSize: 25.0,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              'Your guide to car maintenance',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.white),
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
                            child: Builder(
                              builder: (context) => ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MenuPageTech()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(
                                      double.infinity, double.infinity),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.lightbulb,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                        SizedBox(width: 8),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Technology',
                                              style: TextStyle(
                                                  fontSize: 25.0,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              'Your guide to technology',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.white),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoadingScreen()),
      (route) => false,
    );
    showToast(message: "Successfully Signed Out");
  }
}
