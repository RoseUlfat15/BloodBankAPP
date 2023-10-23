import 'package:app/screens/login.dart';
import 'package:flutter/material.dart';

class ManagerProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,

      // appBar: AppBar(
      //   title: const Text('Sign Up'),
      // ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          height: 430,
          width: 300,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/user-account.png',
                        width: 90, height: 100),
                    const SizedBox(height: 20),
                    const Text(
                      "MANAGER PROFILE",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 20),

                    const SizedBox(height: 10),
                    Text(
                      'Rosie',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    // Divider
                    const Divider(
                        height: 20, thickness: 1, color: Colors.black),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Johar Town, Lahore',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    // Divider
                    const Divider(
                        height: 20, thickness: 1, color: Colors.black),
                    const SizedBox(
                      height: 20,
                    ),

                    Text(
                      '+923468823009',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    const Divider(
                        height: 20, thickness: 1, color: Colors.black),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Background color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10.0), // Rounded corners
                          ),
                          padding: const EdgeInsets.all(15.0),
                        ),
                        child: const Text('LOGOUT',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
