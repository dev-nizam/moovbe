import 'package:flutter/material.dart';
import 'package:moovbe/Screen/home/Home.dart';
import 'package:moovbe/Screen/widgets/Start.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future<void> getSaveDate() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("token")) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => Home()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const Start()));
    }
  }
  @override
  void initState() {
    splashFunc();
    super.initState();
  }
  // void initState() {
  //   Future.delayed(const Duration(seconds: 3), () {
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (context) => const Hello()),
  //             (route) => false);
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final mHeigth=MediaQuery.of(context).size.height;
    final mWidth=MediaQuery.of(context).size.width;

    return Scaffold(backgroundColor: Color(0xFFfc153b),
      body:Container(
        height:mHeigth*9 ,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: mHeigth*0.9,
              width: mWidth*7,
              decoration: BoxDecoration(
                  image:  DecorationImage(
                    image: AssetImage("assets/img/Group 1.png"),
                  )
              ),
            ),


          ],
        ),
      ) ,
    );
  }
  Future splashFunc() async {
    Future.delayed(const Duration(seconds: 2), () {
      getSaveDate();
    });
  }
}
