import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovbe/Screen/home/driverlist/DriverAdd.dart';
import 'package:moovbe/model/DriverListModel.dart';
import 'package:moovbe/repository/bloc/driverList/driver_bloc.dart';

class DriverList extends StatefulWidget {
  const DriverList({Key? key}) : super(key: key);

  @override
  State<DriverList> createState() => _DriverListState();
}

class _DriverListState extends State<DriverList> {
  void initState() {
    // TODO: implement initState
    BlocProvider.of<DriverBloc>(context).add(FetchDreiverGet());

    super.initState();
  }
late DriverListModel driverListModel;
  @override
  Widget build(BuildContext context) {
    final mHeigth = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor:Color(0xFF050505) ,
        title:Row(
          children: [
            SizedBox(
              width: mWidth*0.2,
            ),
            Text("DriverList"),
          ],
        ),
      ),
      body: BlocBuilder<DriverBloc, DriverState>(
  builder: (context, state) {
    if (state is DriverLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is DriverError) {
      return RefreshIndicator(
        onRefresh: () async {
          return BlocProvider.of<DriverBloc>(context).add(FetchDreiverGet());
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * .9,
            // color: Colors.red,
            child: const Center(
              child: Text("something went wrong"),
            ),
          ),
        ),
      );
    }
    if (state is DriverLoaded) {
      driverListModel = BlocProvider
          .of<DriverBloc>(context)
          .driverListModel;
      return Container(height: mHeigth * 9,
        child: Column(
          children: [
            Container(margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text("32"),
                  Text(" Drivers found"),
                ],
              ),
            ),
            Container(
              height: mHeigth * 0.7,
              child: ListView.builder(
                  itemCount: driverListModel.driverList!.length,
                  itemBuilder: (ctx, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      height: mHeigth * 0.09,
                      width: mWidth * 0.4,
                      child: Card(
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Container(
                                    height: mHeigth * 0.07,
                                    width: mWidth * 0.2,

                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                          "assets/img/Ellipse.png"),
                                    ),),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(driverListModel.driverList![index].name.toString()),
                                  Row(
                                    children: [
                                      Text("licn no:"),
                                      Text(driverListModel.driverList![index].licenseNo.toString()),
                                    ],
                                  )
                                    ],
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                      //   BlocProvider.of<DriverBloc>(context)
                                      //       .add(FetchDreiverdlt(driverId: driverListModel
                                      //       .driverList![index].id
                                      //       .toString()));
                                      },



                                      child: Text(
                                        "Delete",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xFFfc153b))))
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              width: mWidth * 0.01,
              height: mHeigth * 0.04,
            ),
            Container(
              height: mHeigth * 0.06,
              width: mWidth * .65,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (ctx) => DriverAdd()));
                },
                child: Text("Add Driver", style: TextStyle(color: Colors
                    .white),),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(
                        0xFFfc153b))),),

            )
          ],
        ),
      );
    }
    return
    Container
    (
    );
  }
),
    );
  }
}
