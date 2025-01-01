import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/smart_device_box.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage>{

  // list of smart devices
  List mySmartDevices = [
    //[smartDevName,iconPath,powerStatus]
    [ "Smart Light", "lib/icons/icons8-light-64.png", true],
    [ "Smart AC", "lib/icons/icons8-air-conditioner-64.png", false],
    [ "Smart TV", "lib/icons/icons8-tv-64.png", false],
    [ "Smart Fan", "lib/icons/icons8-fan-speed-100.png", false],

  ];

  //power btn switched
  void powerSwitchChanged(bool value,int index){
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 25
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //menu icon
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  //account icon
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            //welcome 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home,",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[700],
                    ),
                    ),
                  Text(
                    "GiHANGA101'K👑",
                    style: GoogleFonts.bebasNeue(
                    fontSize: 72,
                    ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 25,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Divider(
                
                color: const Color.fromARGB(127, 76, 175, 79),
                thickness: 1,
              ),
            ),

            //smart grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Smart Devices",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.grey[800]
                ),),
            ),
            Expanded(child: GridView.builder(
              itemCount: mySmartDevices.length,
              // physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(25),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3
              ), 
              itemBuilder: (context, index){
                return SmartDeviceBox(
                  smartDeviceName: mySmartDevices[index][0],
                  iconPath: mySmartDevices[index][1],
                  powerOn: mySmartDevices[index][2],
                  onChanged: (value) => powerSwitchChanged(value,index),

                );
              },
              )
            )
          ],
        ),
      ),
    );
  }
}  
