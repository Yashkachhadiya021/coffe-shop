class Student{
  String? key;
  StudentData? studentData;
  Student({this.key,this.studentData});
}

class StudentData{
  String? name;
  String? type;
  String? price;
  String? coffeetype;

  StudentData({this.name,this.type,this.price,this.coffeetype});

  StudentData.fromJson(Map<dynamic,dynamic> json){
    name = json["name"];
    type = json["type"];
    price = json["price"];
    coffeetype=json["coffeetype"];
  }
}