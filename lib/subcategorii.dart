import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AbstractCat extends StatefulWidget {
  final VoidCallback? onMenuPageButtonPressed;

  final List<String> title;
  final List<Widget> pageToPush;

  const AbstractCat(
      {Key? key,
      this.onMenuPageButtonPressed,
      required this.title,
      required this.pageToPush})
      : super(key: key);

  @override
  State<AbstractCat> createState() => _MenuPageState(title, pageToPush);
}

class _MenuPageState extends State<AbstractCat> {
  final List<String> title;
  final List<Widget> pageToPush;

  _MenuPageState(this.title, this.pageToPush);

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
              title: const Text('Acasa',
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
              title: const Text('Setari',
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
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          ScrollPage(title: title, pageToPush: pageToPush),
        ],
      ),
    );
  }
}

class ScrollPage extends StatefulWidget {
  final List<String> title;
  final List<Widget> pageToPush;

  const ScrollPage({Key? key, required this.title, required this.pageToPush})
      : super(key: key);

  @override
  State<ScrollPage> createState() =>
      _ScrollPageState(this.title, this.pageToPush);
}

class _ScrollPageState extends State<ScrollPage> {
  final List<String> title;
  final List<Widget> pageToPush;

  _ScrollPageState(this.title, this.pageToPush);

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
          itemCount: title.length,
          itemBuilder: (context, index) {
            return Language(index: index, title: title, pageToPush: pageToPush);
          },
        ),
      ),
    );
  }
}

class Language extends StatelessWidget {
  final int index;

  final List<String> title;
  final List<Widget> pageToPush;

  const Language(
      {Key? key,
      required this.index,
      required this.title,
      required this.pageToPush})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    String cardText = 'card';

    cardText = title[index];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return pageToPush[index];
            },
          ),
        );
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
              const SizedBox(width: 8),
              Text(
                cardText,
                style: TextStyle(
                    fontSize: screenSize.width * 0.05, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
