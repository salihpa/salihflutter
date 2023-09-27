import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salihflutter/storage%20preferences/sqflite%20crud/sql%20fn.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Page"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Image.asset(
                "assets/icons/tree.png",
                height: 100,
                width: 100,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Name",
                      labelText: "Name",
                      prefixIcon: Icon(Icons.supervised_user_circle_outlined),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0)))),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "PhoneNumber",
                      labelText: "PhoneNumber",
                      helperText: 'Enter the existing phone number',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0)))),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "UserName",
                      labelText: "UserName",
                      helperText: 'UserName Must be an Email',
                      prefixIcon: Icon(Icons.people_alt_rounded),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0)))),
                ),
              ),
              // SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "PassWord",
                      labelText: "PassWord",
                      helperText: 'Password Must Contain 6 characters',
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0)))),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Confirm PassWord",
                      labelText: "Confirm  PassWord",
                      helperText: 'Password Must be same',
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0)))),
                ),
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Register")),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactBook extends StatefulWidget {
  const ContactBook({super.key});

  @override
  State<ContactBook> createState() => _ContactBookState();
}

class _ContactBookState extends State<ContactBook> {
  List<Map<String, dynamic>> contacts = [];
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Contacts'),
      ),
      body: isLoading
          ? Text(
              "Create New Contact",
              style: GoogleFonts.caesarDressing(fontSize: 35),
            )
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          Colors.primaries[index % Colors.primaries.length],
                      child: Icon(Icons.person),
                    ),
                    title: Text(contacts[index]['cname']),
                    subtitle: Text(contacts[index]['cnum']),
                    trailing: Wrap(
                      children: [
                        IconButton(onPressed: () => {}, icon: Icon(Icons.edit)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showSheet(null),
        child: Icon(Icons.person_add_alt_1_outlined),
      ),
    );
  }

  final name_controller = TextEditingController();
  final num_controller = TextEditingController();

  void showSheet(int? id) {
    if (id != null) {
      final existingcontact =
          contacts.firstWhere((element) => element['id'] == id);
      name_controller.text = existingcontact['cname'];
      num_controller.text = existingcontact['cnum'];
    }

    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 120),
            child: Column(
              children: [
                TextField(
                  controller: name_controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Name"),
                ),
                TextField(
                  controller: num_controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Number"),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (id == null) {
                        createContact(
                            name_controller.text, num_controller.text);
                      }
                      if (id != null) {}
                      name_controller.text = "";
                      num_controller.text = "";
                    },
                    child:
                        Text(id == null ? "Create Contact" : "update contact"))
              ],
            ),
          );
        });
  }

  void createContact(String name, String number) async {
    await SQL_Functions.addnewContact(name, number);
  }

  @override
  void initState() {
    readContact_and_refresh_Ui();
    super.initState();
  }

  Future<void> readContact_and_refresh_Ui() async {
    final mycontacts = await SQL_Functions.readcontacts();
    setState(() {
      contacts = mycontacts;
      isLoading = false;
    });
  }

  Future<void> updateContact(int id) async {
    await SQL_Functions.updateContact(
        id, name_controller.text, num_controller.text);
    readContact_and_refresh_Ui();
  }

  Future<void> deletecontact(int id) async {
    await SQL_Functions.removeContact(id);
    readContact_and_refresh_Ui();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("successfully deleted")));
  }
}
