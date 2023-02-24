import 'package:flutter/material.dart';
import 'package:moovbe/Screen/home/clickbus.dart';
import 'package:moovbe/Screen/home/driverlist/DriverList.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final mHeigth = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70, // Set this height
        flexibleSpace: Container(
          color: Colors.black,
          child: Column(
            children: [
              SizedBox(
                height: mHeigth * 0.03,
              ),
              Container(
                height: mHeigth * 0.07,
                child: Center(
                  child: Image.asset("assets/img/Group 1.png"),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: mHeigth * 9,
        child: Column(
          children: [
            SizedBox(
              height: mHeigth * 0.01,
            ),
            Container(
              height: mHeigth * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: mHeigth * 0.25,
                    width: mWidth * 0.45,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/img/Group 30.png"),
                            fit: BoxFit.fill)),
                  ),
                  GestureDetector(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (ctx)=>DriverList()));
                  },
                    child: Container(
                        height: mHeigth * 0.25,
                        width: mWidth * 0.45,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/img/Group 31.png"),
                                fit: BoxFit.fill))),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: mWidth * 0.03,
                ),
                Text("21"),
                Text("Bus found")
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: GestureDetector(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>ClickBus()));
                      },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          height: mHeigth * 0.095,
                          width: mWidth * 0.4,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: mHeigth * 0.07,
                                      width: mWidth * 0.2,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/img/image 3.png"),
                                              fit: BoxFit.fill))),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("KSRTC"),
                                      Text("kjhkjskjfkj kjskjhjk"),
                                    ],
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "hgad",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xFFfc153b))))
                                ],
                              ),
                              SizedBox(
                                width: mWidth * 0.01,
                                height: mHeigth * 0.01,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
