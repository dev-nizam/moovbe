import 'package:flutter/material.dart';

class ClickBus extends StatefulWidget {
  const ClickBus({Key? key}) : super(key: key);

  @override
  State<ClickBus> createState() => _ClickBusState();
}

class _ClickBusState extends State<ClickBus> {
  @override
  Widget build(BuildContext context) {
    final mHeigth = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text("Swift Scania p-series"),
        backgroundColor:Color(0xFF050505) ,
      ),
      body: Container(margin: EdgeInsets.all(10),
        child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: mHeigth * 0.15,
                width: mWidth * 0.9,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: mHeigth * 0.1,
                      width: mWidth * 0.45,
                      color: Colors.black,
                      child: Column(
                        children: [
                          SizedBox(
                            height:mHeigth*0.02 ,
                          ),
                          Text("Rohit sharma",style: TextStyle(color: Colors.white,fontSize: 25),),
                          Text("License no: PJ515196161655",style: TextStyle(color: Colors.white,fontSize: 8),),
                        ],
                      ),
                    ),
                    Container(
                        height: mHeigth * 0.15,
                        width: mWidth * 0.40,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage("assets/img/Mask group.png"),
                                fit: BoxFit.fill))),
                  ],
                ),
              ),
              SizedBox(
                height:mHeigth*0.04 ,
              ),
              Card(
                child: Container(
                    height: mHeigth * 0.6,
                    width: mWidth * 0.70,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/img/Group 21.png")))),
              ),

            ],
          ),
      ),

    );
  }
}
