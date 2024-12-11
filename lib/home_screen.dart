import 'package:caffee/detail_screen.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  ];
  List coffeename=[
    'Caffee Mocha',
    'Flat White',
    'Caffe Panna',
    'Cappuccino',
  ];
  List coffeetype=[
    'Deep Foam',
    'Espresso',
    'Steamed Milk',
    'Chocalate',
  ];
  List price=[
    "\$ 4.53",
    "\$ 3.53",
    "\$ 5.53",
    "\$ 6.53",
  ];
  int currentindex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
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
                            Text("Bilzen, Tanjungbalal ",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),),
                            Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,size: 18,)
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
                                  color: Colors.brown[400],
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
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  fit: StackFit.loose,
                  children: [
                    Transform.translate(
                      offset: Offset(0.0,-280/2),
                      child: Container(
                        height: 280,
                        width: 340,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/banner.png"))
                        ),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 90),
                      child: SizedBox(
                        height: 40,
                        child: ListView.builder(
        
                          shrinkWrap: true,
                          itemCount: catagory.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
        
                            return Padding(
                              padding: const EdgeInsets.all(2),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentindex=index;
                                    coffee.shuffle();
                                    coffeename.shuffle();
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
                                        color: currentindex==index ? Colors.brown[400] : Colors.white
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
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 140),
                      child: SizedBox(
                        height: 260,
                        child: GridView.builder(
                          itemCount: 4,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 270),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10),
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
                                      Text(coffeename[index],style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18
                                      ),),
                                      Text(coffeetype[index],style: TextStyle(
                                        color: Colors.grey
                                      ),),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(price[index],style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18
                                          ),),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(),));
                                                  });
                                                },
                                             child: Container(
                                                height: 35,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.brown[400]
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
                    ),
                  ],
                ),
        
              ],
            )
        ),
      ),
    );
  }
}
