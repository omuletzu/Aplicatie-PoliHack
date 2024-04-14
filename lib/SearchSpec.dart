import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class Person {
  String name;
  String phone;
  String email;
  String occupation;

  Person({required this.name, required this.phone, required this.email, required this.occupation});
}

class SearchSpec extends StatefulWidget {
  @override
  _SearchSpecState createState() => _SearchSpecState();
}

class _SearchSpecState extends State<SearchSpec> {
  late Future<List<Person>> _peopleFuture;

  @override
  void initState() {
    super.initState();
    _peopleFuture = getPerson();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Specialists list',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
              title: const Text('Lista specialisti',
                  style:
                      TextStyle(fontSize: 25.0, fontWeight: FontWeight.w800)),
                        textColor: Colors.black54,
                        titleTextStyle: GoogleFonts.openSans(),
                        leading: const Icon(Icons.settings, color: Colors.black45),
                        onTap: () {},
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
              onTap: () {
                
              },
            ),
          ],
        ),
      ),
        body: FutureBuilder<List<Person>>(
          future: _peopleFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<Person> people = snapshot.data!;
              return ListView.builder(
                itemCount: people.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(people[index].name[0]),
                      ),
                      title: Text(
                        people[index].name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Phone: ${people[index].phone}'),
                          Text('Email: ${people[index].email}'),
                          Text('Occupation: ${people[index].occupation}'),
                        ],
                      ),
                      onTap: () {},
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<Person>> getPerson() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    List<Person> persons = [];

    try {
      QuerySnapshot qs = await db.collection("providers").get();
      qs.docs.forEach((element) {
        Map<String, dynamic> data = element.data() as Map<String, dynamic>;
        String email = data['email'];
        String name = data['name'];
        String phone = data['phone number'];
        String occupation = data['occupation'];

        persons.add(Person(name: name, phone: phone, email: email, occupation: occupation));
      });
    } catch (e) {}

    return persons;
  }
}
