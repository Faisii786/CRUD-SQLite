// ignore_for_file: unnecessary_this, non_constant_identifier_names

import 'package:database_app/SqlLite/studentmodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbManager {
  static DbManager instance = DbManager._();
  DbManager._();

  Future<Database> initDatabse() async {
    String dbPath = await getDatabasesPath();
    final MyDatabase = openDatabase(
      join(
        dbPath,
        'student.db',
      ),
      onCreate: (db, version) {
        return db
            .execute('CREATE TABLE students (id TEXT PRIMARY KEY,name TEXT)');
        //'CREATE TABLE students (id TEXT PRIMARY KEY,name TEXT ,age INTEGER)');
      },
      version: 1,
    );
    return MyDatabase;
  }

  Future<void> addStudentRecord(Student student) async {
    Database db = await this.initDatabse();

    await db.insert('students', student.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Student>> loadStudentRecord() async {
    Database db = await this.initDatabse();

    List<Map<String, dynamic>> studentlist = await db.query('students');

    return List.generate(studentlist.length, (index) {
      return Student(
        studentlist[index]['id'],
        studentlist[index]['name'],
        //studentlist[index]['age'],
      );
    });
  }

  Future<void> deleteStudentRecord(String id) async {
    Database db = await this.initDatabse();

    await db.delete('students', where: 'id = ?', whereArgs: [id]);
  }
}
