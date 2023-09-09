import 'package:flutter/material.dart';
import 'package:database_app/SqlLite/dbmanager.dart';
import 'package:database_app/SqlLite/studentmodel.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();

  void addstudent() {
    String sID = controller1.text;
    String sName = controller2.text;
    //int sAge = int.parse(controller3.text);
    Student student = Student(
      sID,
      sName, /*sAge*/
    );

    DbManager.instance.addStudentRecord(student);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Center(
            child: Text(
          "Student Form",
          style: TextStyle(fontSize: 20),
        )),
      ),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller1,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Id',
                labelText: 'Student ID',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller2,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter name',
                labelText: 'Student Name',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Back',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ElevatedButton(
                    onPressed: addstudent, child: const Text('Add')),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
