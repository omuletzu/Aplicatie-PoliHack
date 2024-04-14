import 'package:aplicatie_polihack_v15/SearchSpec.dart';
import 'package:aplicatie_polihack_v15/Tutorials/tutorial.dart';
import 'package:aplicatie_polihack_v15/subcategorii.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPageTech extends StatefulWidget {
  final VoidCallback? onMenuPageButtonPressed;

  const MenuPageTech({Key? key, this.onMenuPageButtonPressed})
      : super(key: key);

  @override
  State<MenuPageTech> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPageTech> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              leading: const Icon(Icons.house_outlined, color: Colors.black45),
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
            ListTile(
              title: const Text('Handyman list',
                  style:
                      TextStyle(fontSize: 25.0, fontWeight: FontWeight.w800)),
              textColor: Colors.black54,
              titleTextStyle: GoogleFonts.openSans(),
              leading: const Icon(Icons.settings, color: Colors.black45),
              onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchSpec(),
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
                
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          ScrollPage(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(onPressed: (){
            Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.white.withOpacity(0.6),),
    );
  }
}

class ScrollPage extends StatefulWidget {
  const ScrollPage({Key? key}) : super(key: key);

  @override
  State<ScrollPage> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 241, 246, 1),
      body: Scrollbar(
        thumbVisibility: true,
        child: ListView.separated(
          padding: const EdgeInsets.all(20.0),
          separatorBuilder: (context, index) {
            return const SizedBox(height: 24);
          },
          itemCount: 6,
          itemBuilder: (context, index) {
            return Language(index: index);
          },
        ),
      ),
    );
  }
}

class Language extends StatelessWidget {
  final int index;
  const Language({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    String cardText = 'card';
    IconData? category_icon;

    switch (index) {
      case 0:
        cardText = 'Internet safety';
        category_icon = Icons.safety_check;
        break;
      case 1:
        cardText = 'Computer basics';
        category_icon = Icons.plumbing;
        break;
      case 2:
        cardText = 'Programming';
        category_icon = FontAwesomeIcons.plantWilt;
        break;
      case 3:
        cardText = 'Hardware and networks';
        category_icon = FontAwesomeIcons.bowlFood;
        break;
      case 4:
        cardText = 'Digital media';
        category_icon = Icons.clean_hands;
        break;
    }
    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            List<String> title = [
              'Protejare date personale',
              'Evitare phising',
              'Folosire VPN'
            ];
            List<Widget> pageToPush = [TutorialPriza()];

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AbstractCat(title: title, pageToPush: pageToPush),
              ),
            );

            break;

          case 1:
            List<String> title = [
              'Folosire Office Suite',
              'Instalare / Dezinstalare software',
              'Backup date'
            ];
            List<Widget> pageToPush = [TutorialPriza()];

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AbstractCat(title: title, pageToPush: pageToPush),
              ),
            );

            break;

          case 2:
            List<String> title = [
              'HTML / CSS / JavaScript',
              'Creare site web',
              'Erori comune in programare'
            ];
            List<Widget> pageToPush = [TutorialPriza()];

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AbstractCat(title: title, pageToPush: pageToPush),
              ),
            );

            break;

          case 3:
            List<String> title = [
              'Setare retea de acasa',
              'Intelegere specificatii hardware',
              'Upgrade la computer'
            ];
            List<Widget> pageToPush = [TutorialPriza()];

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AbstractCat(title: title, pageToPush: pageToPush),
              ),
            );

            break;

          case 4:
            List<String> title = [
              'Editare video / foto',
              'Platforme streaming',
              'Creare continut social media'
            ];
            List<Widget> pageToPush = [TutorialPriza()];

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AbstractCat(title: title, pageToPush: pageToPush),
              ),
            );

            break;
          // Add cases for other languages here
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(69, 146, 197, 1),
              Color.fromRGBO(101, 194, 226, 1),
            ],
          ),
        ),
        width: double.infinity,
        height: 0.172 * screenSize.height,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                category_icon,
                color: Colors.white,
                size: 25.0,
              ),
              const SizedBox(width: 8),
              Text(
                cardText,
                style: const TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
