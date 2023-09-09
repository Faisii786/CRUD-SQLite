class Student{
  String id;
  String name;
  //int age;

  Student(this.id,this.name,/*this.age*/);

  Map<String,dynamic> toMap() {
    return {
      "Id" : id,
      "Name" : name,
      //"Age": age
    };
  }
}