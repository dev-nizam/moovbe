import 'package:flutter/material.dart';

class DriverAdd extends StatefulWidget {
  const DriverAdd({Key? key}) : super(key: key);

  @override
  State<DriverAdd> createState() => _DriverAddState();
}

class _DriverAddState extends State<DriverAdd> {
  TextEditingController _nameController=TextEditingController();
  TextEditingController _licenseController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mHeigth = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor:Color(0xFF050505) ,
        title: Text("Add Driver"),
      ),
      body: Container(height: mHeigth*9,
        margin: EdgeInsets.only(left: 60),
        child: Column(
          children: [
            SizedBox(
              width: mWidth * 0.01,
              height: mHeigth * 0.02,
            ),
            Container(
                margin: EdgeInsets.only(top: mHeigth * .005),
                width: mWidth * .65,
                child: TextFormField(

                  controller: _nameController,
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
                      child: Text("Enter Name"),
                    ),
                  ),
                )
            ),
            SizedBox(
              width: mWidth * 0.01,
              height: mHeigth * 0.01,
            ),
            Container(
                margin: EdgeInsets.only(top: mHeigth * .005),
                width: mWidth * .65,
                child: TextFormField(

                  controller: _licenseController,
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
                      child: Text("Enter License Number"),
                    ),
                  ),
                ),
            ),
            SizedBox(
              width: mWidth * 0.0,
              height: mHeigth * 0.59,
            ),
            Container(
              height:mHeigth*0.06,
              width: mWidth * .65,
              child:ElevatedButton(
                onPressed: (){

                },child: Text("Add Driver",style: TextStyle(color:Colors.white),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFfc153b))),) ,

            )
          ],
        ),
      ),
    );
  }
}
