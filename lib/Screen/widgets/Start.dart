import 'package:flutter/material.dart';
import 'package:moovbe/Screen/Login/Login.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
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
            Container(
              height: mHeigth*0.06,
                width: mWidth*0.9,
              child:ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Login()));
                  },child: Text("GetStarted",style: TextStyle(color:Color(0xFFfc153b)),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),) ,

                  )

          ],
        ),
      ) ,
    );
  }
}
