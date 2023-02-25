import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovbe/Screen/home/driverlist/DriverList.dart';
import 'package:moovbe/repository/bloc/driverList/driver_bloc.dart';

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
    String mobi ="";
    return Scaffold(resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor:Color(0xFF050505) ,
        title: Row(
          children: [
            SizedBox(
              width: mWidth*0.2,
            ),
            Text("Add Driver"),
          ],
        ),
      ),
      body: BlocListener<DriverBloc, DriverState>(
  listener: (context, state) {
    if (state is DriverLoading) {
      print("loading");
    }
    if (state is DriverAdded) {
      // final userid=state.data.user!.id;
      // final token=state.data.tokens!.accessToken;
      // savetoken(token!);
      print("loaded");
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => DriverList()));

      // String token = state.Token;

    }
    if (state is DriverError) {
      print("Error");
    }
  },
  child: Container(height: mHeigth*9,
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
                  // BlocProvider.of<DriverBloc>(context).add(FetchDreiverAdd(name: _nameController.text,
                  //     licenseNo: _licenseController.text,
                  //     mobile: mobi));


                },
                child: Text("Add Driver",style: TextStyle(color:Colors.white),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFfc153b))),) ,

            )
          ],
        ),
      ),
),
    );
  }
}
