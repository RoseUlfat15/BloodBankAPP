import 'package:app/screens/adddonor.dart';
import 'package:app/screens/donorlist.dart';
import 'package:app/screens/manager.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: const Color(0xffEB3738),
        leading: IconButton(
          icon:
              Icon(Icons.person), // Profile icon (you can use a different icon)
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ManagerProfileScreen()));
            // Handle the tap on the profile icon here
          },
        ),
        title: Text(
          "JOHAR TOWN, LAHORE",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Column(
        children: [
          Container(
            // Container for the Map
            height: 525,
            width: 1600,
            // Adjust the height as needed
            // Add your map widget here

            child: Image.asset(
              'assets/images/Mask group.png',
              height: 300, // Adjust the image height
              // Adjust the image width
            ),
            // Replace with your map widget
          ),
          SizedBox(height: 10),
          Container(
            // Container for Blood Groups and Buttons
            padding: EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Blood Groups",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                // Blood Group Circles (Separate Lines)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // First Line of Blood Groups
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.red, // Replace with your circle color
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                        child: Text(
                          "O+", // Replace with the blood group text
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.red, // Replace with your circle color
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                        child: Text(
                          "B+", // Replace with the blood group text
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.red, // Replace with your circle color
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                        child: Text(
                          "AB+", // Replace with the blood group text
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.red, // Replace with your circle color
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                        child: Text(
                          "A+", // Replace with the blood group text
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),

                    // Second Line of Blood Groups
                    Container(
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(
                        color: Colors.red, // Replace with your circle color
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                        child: Text(
                          "A-", // Replace with the blood group text
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(
                        color: Colors.red, // Replace with your circle color
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                        child: Text(
                          "B-", // Replace with the blood group text
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // First Line of Blood Groups
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.red, // Replace with your circle color
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                        child: Text(
                          "O+", // Replace with the blood group text
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.red, // Replace with your circle color
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                        child: Text(
                          "B+", // Replace with the blood group text
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.red, // Replace with your circle color
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                        child: Text(
                          "AB+", // Replace with the blood group text
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.red, // Replace with your circle color
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                        child: Text(
                          "A+", // Replace with the blood group text
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),

                    // Second Line of Blood Groups
                    Container(
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(
                        color: Colors.red, // Replace with your circle color
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                        child: Text(
                          "A-", // Replace with the blood group text
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(
                        color: Colors.red, // Replace with your circle color
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                        child: Text(
                          "B-", // Replace with the blood group text
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),

                // Buttons (Two Red Buttons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DonorListScreen()),
                        );
                        // Handle the "Show All" button action
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Button color
                        onPrimary: Colors.white, // Text color
                        padding: EdgeInsets.all(16.0), // Button padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // Button shape
                        ),
                      ),
                      child: Text("Show All"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the "Add Donor" screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddDonorScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red, // Text color
                        padding: EdgeInsets.all(16.0), // Button padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // Button shape
                        ),
                      ),
                      child: Text("Add New Donor"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
