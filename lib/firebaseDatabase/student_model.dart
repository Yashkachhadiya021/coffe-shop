class Student{
  String? key;
  StudentData? studentData;
  Student({this.key,this.studentData});
}

class StudentData{
  String? name;
  String? type;
  String? price;

  StudentData({this.name,this.type,this.price});

  StudentData.fromJson(Map<dynamic,dynamic> json){
    name = json["name"];
    type = json["type"];
    price = json["price"];
  }
}