import 'package:caffee/firebaseDatabase/student_model.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List icon=[
    'assets/bike.png',
    'assets/bean.png',
    'assets/milk.png',
  ];
  List size=[
    'S',
    'M',
    'L',
  ];
  int currentindex=0;
  @override
  Widget build(BuildContext context) {
    final data=ModalRoute.of(context)!.settings.arguments as Student;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 40, 40, 10),
                  child: Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.arrow_back_ios),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Detail",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),)
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.favorite_border)
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 230,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/coffee4.png'),fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(data.studentData!.name!,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 20,),
                    Expanded(
                      child: Row(
                        children: [
                          Text(data.studentData!.type!,style: TextStyle(
                            color: Colors.grey
                          ),),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 50,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: icon.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {

                              return Padding(
                                padding: const EdgeInsets.all(2),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5,right: 5),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Center(
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          image: DecorationImage(image: AssetImage(icon[index])),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Image(image: AssetImage('assets/ic_star_filled.png')),
                      SizedBox(width: 5,),
                      Text("4.8",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),),
                      SizedBox(width: 5,),
                      Text("(230)",style: TextStyle(
                        color: Colors.grey
                      ),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 8),
                  child: Divider(height: 1,),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 30, 10),
                  child: Text("Description",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: ReadMoreText("A cappuccino is an approximately 150 ml"
                      " (5 oz) beaverage, with 25ml of espresso"
                      " coffee and 85ml of fresh milk...",
                    style: TextStyle(color: Colors.grey),
                    trimMode: TrimMode.Line,
                    trimLines: 2,
                    colorClickableText: Color(0xFFce8050),
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 30, 10),
                  child: Text("Size",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: SizedBox(
                    height: 40,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: size.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(2),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                currentindex=index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8,right: 8),
                              child: Container(
                                width: 90,
                                decoration: BoxDecoration(
                                  border: currentindex==index ? Border.all(color: Color(0xFFce8050)) : Border.all(color: Colors.black),
                                    // boxShadow: [BoxShadow(
                                    //   color: currentindex==index?Colors.brown.withOpacity(1):Colors.grey.withOpacity(1),
                                    //   blurRadius: currentindex==index ? 4 : 3,
                                    // )],
                                    borderRadius: BorderRadius.circular(10),
                                    color: currentindex==index ? Color(0xFFce8050).withOpacity(0.1) : Colors.white
                                  // color: Color(0xfff96163),
                                ),
                                child:
                                Center(
                                  child: Text(
                                    size[index],
                                    style: TextStyle(
                                      color: currentindex==index ? Color(0xFFce8050) : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

              ],
            )
        ),
      ),
      bottomNavigationBar:Container(
        height: 80,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Price",style: TextStyle(
                        color: Colors.grey
                    ),),
                    Text("\$"+data.studentData!.price!,style: TextStyle(
                        color: Color(0xFFce8050),
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                        color: Color(0xFFce8050),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Text("Buy Now",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ) ,
    );
  }
}
