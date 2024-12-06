import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_project3/home_page.dart';
import 'package:flutter_project3/profile_page.dart';
import 'add_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness:Brightness.dark,

      ),
      title: 'Instagram demo',
      home: const SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        // child: Text('',style: TextStyle(fontSize: 50),),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;

  bool _isTaped = false;

  List<Widget> _pages = [
    HomePage(),
    AddPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[pageIndex],

      bottomNavigationBar: MyBottomNavBar(context),

      floatingActionButton: SizedBox(
        height: 50,
        width: 50,
        child: FloatingActionButton(
          backgroundColor:  Colors.yellow[50],
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: BorderSide.none),

          onPressed: () {
            setState(() {
              pageIndex==1;
            });
          },
          child: Icon(Icons.add,color: Colors.deepOrange,size: 30,),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget MyBottomNavBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 60,right: 60),
      height: 50,
      decoration: BoxDecoration(
          color:  Colors.yellow[50]?.withOpacity(1),
          boxShadow: [new BoxShadow(
            color: Colors.grey,
            offset: Offset(0, -3),
            blurRadius: 2,
          )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                pageIndex = 0;
              });
            },
            child: Column(
              children: [
                pageIndex==0?Icon(Icons.home, color: Colors.deepOrange,size: 30,):Icon(Icons.home_outlined, color: Colors.deepOrange,size: 30,),
                pageIndex==0?Text('Home',style: TextStyle(color: Colors.deepOrange,fontSize: 12,fontWeight: FontWeight.bold)):Text('Home',style: TextStyle(color: Colors.deepOrange,fontSize: 12,),)
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                pageIndex = 2;
              });
            },
            child: Column(
              children: [
                pageIndex==2?Icon(Icons.person, color: Colors.deepOrange,size: 30,):Icon(Icons.person_outline, color: Colors.deepOrange,size: 30,),
                pageIndex==2?Text('Profile',style: TextStyle(color: Colors.deepOrange,fontSize: 12,fontWeight: FontWeight.bold)):Text('Profile',style: TextStyle(color: Colors.deepOrange,fontSize: 12,),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}