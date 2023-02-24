import 'package:flutter/material.dart';
import 'package:moovbe/Screen/home/Home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mHeigth=MediaQuery.of(context).size.height;
    final mWidth=MediaQuery.of(context).size.width;
    return Scaffold(resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: [
            Stack(
            children: [
        Container(
        color: Colors.black,
          child: CustomPaint(
            size: Size(mWidth,(mWidth*0.75).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter(),
          ),
        ),
      Positioned(top: 150,
        left: 30,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome",style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.bold),),
            Text("Manage your Bus and Drivers",style: TextStyle(fontSize: 18,color: Colors.white),)
          ],
        ))
            ],),
            SizedBox(
              height:mHeigth*0.03 ,
            ),
            Container(
                margin: EdgeInsets.only(top: mHeigth * .005),
                width: mWidth * .65,
                child: TextFormField(

                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Can\'t be empty';
                    }
                    if (value.length < 100) {
                      return 'Too short';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Center(
                      child: Text("Enter Username"),
                    ),
                  ),
                )
            ),
            SizedBox(
              height:mHeigth*0.02 ,
            ),
            Container(
                margin: EdgeInsets.only(top: mHeigth * .005),
                width: mWidth * .65,
                child: TextFormField(

                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Can\'t be empty';
                    }
                    if (value.length < 100) {
                      return 'Too short';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Center(
                      child: Text("'Enter Password'"),
                    ),

                  ),
                )
            ),
            SizedBox(
              height:mHeigth*0.3 ,
            ),
            Container(
              height:mHeigth*0.06,
              width: mWidth * .65,
              child:ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Home(

                  )));
                },child: Text("GetStarted",style: TextStyle(color:Colors.white),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFfc153b))),) ,

            )
          ],
        ),
      ),
    );
  }

}
class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = const Color(0xFFfc153b)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(size.width*0.1275000,0);
    path0.lineTo(size.width*0.7500000,size.height);
    path0.lineTo(size.width,size.height*0.5933333);
    path0.lineTo(size.width,0);

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
