import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("About Us Page"),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 3,
          shadowColor: Colors.black,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
        // body: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,

        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        //         child: ElevatedButton(
        //           style: TextButton.styleFrom(
        //             shape: RoundedRectangleBorder(
        //               borderRadius: const BorderRadius.all(Radius.circular(8)),
        //             ),
        //             backgroundColor: Colors.black,
        //             minimumSize: Size(double.infinity, 50),
        //             elevation: 8,
        //             shadowColor: Colors.black,
        //           ),
        //           child: Text("Home", style: TextStyle(color: Colors.white)),
        //           onPressed: () {
        //             Navigator.pop(context);
        //           },
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        body: TabBarView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.blue,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text("First Tab Text or content will be here",style: TextStyle(color: Colors.white),),
                   Icon(Icons.directions_car)
                ],
              )
              
            // Icon(Icons.directions_car),
            ),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
