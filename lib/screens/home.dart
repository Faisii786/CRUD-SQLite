// ignore_for_file: non_constant_identifier_names

import 'package:database_app/SqlLite/dbmanager.dart';
import 'package:database_app/SqlLite/studentform.dart';
import 'package:database_app/SqlLite/studentmodel.dart';
import 'package:database_app/screens/login.dart';
import 'package:database_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<Student>? listofstudents;
  void loadstudentrecord() async {
    listofstudents = await DbManager.instance.loadStudentRecord();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadstudentrecord();
  }

  @override
  Widget build(BuildContext context) {
    void AlertLogoutBox() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 10,
            title: const Text('Sign out'),
            content: const Text("Are you sure you want to SignOut ?"),
            actions: [
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                AlertLogoutBox();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const StudentForm()));

          setState(() {
            loadstudentrecord();
          });
        },
        child: const Text(
          "+",
          style: TextStyle(fontSize: 25),
        ),
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: DbManager.instance.loadStudentRecord(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text("Error"));
              } else if (snapshot.hasData) {
                List<ListTile> tiles = [];

                listofstudents?.forEach((element) {
                  ListTile tile = ListTile(
                    horizontalTitleGap: 0,
                    leading: Text(
                      element.id,
                      style: const TextStyle(fontSize: 20),
                    ),
                    title: Text(
                      element.name,
                      style: const TextStyle(fontSize: 20),
                    ),
                    trailing: IconButton(
                      onPressed: () async {
                        await DbManager.instance
                            .deleteStudentRecord(element.id);

                        setState(() {
                          loadstudentrecord();
                        });
                      },
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      iconSize: 30,
                    ),
                    tileColor: Colors.amber,
                    contentPadding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  );
                  tiles.add(tile);
                });
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: tiles,
                  ),
                );
              } else {
                return const Text("");
              }
            }),
      ),
    );
  }
}
