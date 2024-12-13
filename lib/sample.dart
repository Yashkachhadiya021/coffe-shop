import 'package:caffee/detail_screen.dart';
import 'package:caffee/firebase/auth_service.dart';
import 'package:caffee/firebaseDatabase/student_model.dart';
import 'package:caffee/login_screen.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'firebaseDatabase/student_model.dart';
class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  List<Student> studentList = [];
  List<Student> tempdata=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    retrieveStudentData();
  }
  List catagory=[
    'All Coffee',
    'Indonesiano',
    'Machiato',
  ];
  List coffee=[
    'assets/coffee1.png',
    'assets/coffee2.png',
    'assets/coffee3.png',
    'assets/coffee4.png',
    'assets/background.png',
  ];

  int currentindex=0;
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
        title: Text("Coffee"),
        headerWidget: headerWidget(),
        body:[
          gridView(tempdata),
        ],
      fullyStretchable: true,
      backgroundColor: Colors.white,
      appBarColor: Colors.brown[400],
      headerBottomBar: listview(),
    );
  }
  Widget headerWidget(){
    return Column(
      children: [
        Container(
          height: 270,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black87,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 56, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Location",style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15
                ),),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text("Bilzen, Tanjungbalal ",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),),
                          Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,size: 18,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 15, 0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () async{
                              final message = await AuthService().signOut();
                              //print("logout"+message);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Color(0xFFce8050),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: Container(
                                    height: 20,
                                    width: 20,
                                    child: Icon(Icons.logout,color: Colors.white,)
                                ),
                              ),
                            ),

                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 35, 0, 10),
                  child: Row(
                    children: [
                      Container(
                        width: 250,
                        height: 45,
                        decoration: BoxDecoration(
                          // color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [Colors.white10,
                            Colors.transparent],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft),
                        ),
                        child: Row(
                          children: [
                            Container(
                                height: 20,
                                width: 20,
                                child: Image(image: AssetImage("assets/ic_search.png"),color: Colors.white,)
                            ),
                            Text(" Search coffee",style: TextStyle(
                                color: Colors.grey
                            ),)
                          ],
                        ),
                      ),
                      SizedBox(width: 15,),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            color: Color(0xFFce8050),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Container(
                              height: 20,
                              width: 20,
                              child: Image(image: AssetImage("assets/ic_filter.png"),color: Colors.white,)
                          ),
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
        //stack()
      ],
    );
  }
  Widget listview(){
    return ListView.builder(

      shrinkWrap: true,
      itemCount: catagory.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: GestureDetector(
            onTap: () {
              setState(() {
                Text txt= Text(
                  catagory[index],

                  style: TextStyle(
                    color: currentindex==index ? Colors.white : Colors.black,
                  ),
                );
                var value = txt.data;
                if (index==0) {
                  tempdata.clear();
                  print("coffee: " + value!);
                  for (var Student in studentList) {
                    tempdata.add(Student);
                  }
                  print("coffee: " + tempdata.length.toString());

                }
                else{
                print("type: "+value!);
                tempdata.clear();
                for (var Student in studentList) {
                  if(Student.studentData!.coffeetype.toString()==value){
                    tempdata.add(Student);
                    print(tempdata.length.toString());
                  }
                  }
                }
                currentindex=index;
                //coffee.shuffle();
                //coffeename.shuffle();
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: currentindex==index?Colors.black.withOpacity(0.8):Colors.grey.withOpacity(0.4),
                      blurRadius: currentindex==index ? 4 : 3,
                    )],
                    borderRadius: BorderRadius.circular(10),
                    color: currentindex==index ? Color(0xFFce8050) : Colors.white
                  // color: Color(0xfff96163),
                ),
                child:
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Text(
                    catagory[index],
                    style: TextStyle(
                      color: currentindex==index ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  Widget gridView(List dataList){
    return Column(
      children: [
        SizedBox(
         // height: 800,
          child: GridView.builder(
            padding: EdgeInsets.only(top: 0),
            itemCount:dataList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 270),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              Student std=dataList[index];
              //print("List++++"+std.studentData!.name.toString());

              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Container(

                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 3,
                    )],
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            width: double.infinity,
                            height: 140,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              image: DecorationImage(image: AssetImage(coffee[index]),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        Text(
                            std.studentData!.name.toString(),
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        )),
                        Text(std.studentData!.type.toString(),style: TextStyle(
                            color: Colors.grey
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('\$'+std.studentData!.price.toString(),style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),),
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(),
                                        settings: RouteSettings(arguments: dataList[index])));
                                      });
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color(0xFFce8050)
                                      ),
                                      child: Icon(Icons.add,color: Colors.white,size: 15,),
                                    )
                                ),
                              ],
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },),
        ),
      ],
    );
  }
  void retrieveStudentData() {
    dbRef.child("Coffee").onChildAdded.listen((data) {
      StudentData studentData = StudentData.fromJson(data.snapshot.value as Map);
      Student student = Student(key: data.snapshot.key, studentData: studentData);
      studentList.add(student);
      setState(() {});
    });
  }
}

