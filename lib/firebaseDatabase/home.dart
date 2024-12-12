import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'student_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
List<String> catagory=<String>[
  'All Coffee',
  'Indonesiano',
  'Machiato',
];
typedef MenuEntry = DropdownMenuEntry<String>;
class _HomeState extends State<Home> {

  static final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
    catagory.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)),
  );
  String dropdownValue = catagory.first;

  DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  final TextEditingController _edtNameController = TextEditingController();
  final TextEditingController _edtAgeController = TextEditingController();
  final TextEditingController _edtSubjectController = TextEditingController();
  final TextEditingController _edtCoffeeController = TextEditingController();
  List<Student> studentList = [];
  bool updateStudent = false;

  @override
  void initState() {
    super.initState();
    retrieveStudentData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Directory"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for(int i = 0 ; i < studentList.length ; i++)
              studentWidget(studentList[i])
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        _edtNameController.text = "";
        _edtAgeController.text = "";
        _edtSubjectController.text = "";
        _edtCoffeeController.text="";
        updateStudent = false;
        studentDialog();
      },child: const Icon(Icons.save),),
    );
  }

  void studentDialog({String? key}) {
    showDialog(context: context, builder: (context){
      return Dialog(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: _edtNameController, decoration: const InputDecoration(helperText: "Name"),),
              TextField(controller: _edtAgeController, decoration: const InputDecoration(helperText: "type")),
              TextField(controller: _edtSubjectController, decoration: const InputDecoration(helperText: "price")),
              DropdownMenu(
                controller: _edtCoffeeController,
                helperText: "Select Coffee Type",
                initialSelection: catagory.first,
                  onSelected: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  dropdownMenuEntries: menuEntries
              ),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                Map<String,dynamic> data = {
                  "name": _edtNameController.text.toString(),
                  "type": _edtAgeController.text.toString(),
                  "price": _edtSubjectController.text.toString(),
                  "coffeetype": _edtCoffeeController.text.toString()
                };
                if(updateStudent){
                  dbRef.child("Coffee").child(key!).update(data).then((value) {
                    int index = studentList.indexWhere((element) => element.key == key);
                    studentList.removeAt(index);
                    studentList.insert(index,Student(key: key, studentData: StudentData.fromJson(data)));
                    setState(() {
                    });
                    Navigator.of(context).pop();
                  });
                }
                else{
                  dbRef.child("Coffee").push().set(data).then((value){
                    Navigator.of(context).pop();
                  });
                }
              }, child: Text(updateStudent ? "Update Data" : "Save Data"))
            ],
          ),
        ),
      );
    });
  }

  void retrieveStudentData() {
    dbRef.child("Coffee").onChildAdded.listen((data) {
      StudentData studentData = StudentData.fromJson(data.snapshot.value as Map);
      Student student = Student(key: data.snapshot.key, studentData: studentData);
      studentList.add(student);
      setState(() {});
    });
  }

  Widget studentWidget(Student student) {
    return InkWell(
      onTap: (){
        _edtNameController.text = student.studentData!.name!;
        _edtAgeController.text = student.studentData!.type!;
        _edtSubjectController.text = student.studentData!.price!;
        _edtCoffeeController.text = student.studentData!.coffeetype!;
        updateStudent = true;
        studentDialog(key: student.key);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(top:5,left: 10,right: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(student.studentData!.name!),
                Text(student.studentData!.type!),
                Text(student.studentData!.price!),
                Text(student.studentData!.coffeetype.toString())
              ],
            ),

            InkWell(onTap:(){
              dbRef.child("Coffee").child(student.key!).remove().then((value){
                int index = studentList.indexWhere((element) => element.key == student.key!);
                studentList.removeAt(index);
                setState(() {});
              });
            },child: const Icon(Icons.delete,color: Colors.red,))
          ],
        ),
      ),
    );
  }
}