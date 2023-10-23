// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Color(0xffEB3738),
//         flexibleSpace: Center(
//           child: Image.asset(
//             'assets/images/Group 155.png', height: 116,
//             width: 93, // Replace with your appbar image path.
//             fit: BoxFit.contain, // Adjust the fit as needed.
//           ),
//         ),
//         toolbarHeight: 200,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Expanded(
//             child: Container(
//               height: 600,
//               width: 300,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Container(
//                     height: MediaQuery.of(context).size.height /
//                         2, // Half of the screen's height.
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Colors.grey.shade800,
//                         backgroundBlendMode: BlendMode.colorDodge),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         const Text(
//                           'Login', // Your login heading text.
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: TextField(
//                             decoration: InputDecoration(
//                               hintText: 'Email',
//                             ),
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: TextField(
//                             decoration: InputDecoration(
//                               hintText: 'Password',
//                             ),
//                           ),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             // Implement the login functionality.
//                           },
//                           child: Text('Login'),
//                         ),
//                       ],
//                     ),
//                   ),
//                   // You can add a signup button below the login form if needed.
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:app/screens/map.dart';
import 'package:app/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? selectedRole;

  LoginScreen({super.key});

  // LoginScreen({super.key});

  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Sign-in successful
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Login Successful',
            style: TextStyle(color: Colors.red),
          ),
          backgroundColor: Colors.black,
        ),
      );

      // Navigate to the Todo app or home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MapScreen(),
        ),
      );
    } catch (e) {
      // ignore: avoid_print
      print('Error signing in: $e');
      // Handle sign-in errors and show messages to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Failed, Invalid Account'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Container
          Container(
            width: double.infinity,
            height: 290, // Adjust the height as needed
            decoration: const BoxDecoration(
              color: Color(0xffEB3738),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/Group 155.png',
                height: 116, // Adjust the image height
                width: 93, // Adjust the image width
              ),
            ),
          ),

          // Login Form Container
          Center(
            child: Container(
              height: 380,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                        ),
                      ),
                      // Role selection dropdown
                      DropdownButton<String>(
                        hint: const Text('Select Role'),
                        value: selectedRole,
                        onChanged: (String? newValue) {
                          // setState(() {
                          //   selectedRole = newValue;
                          // });
                        },
                        items: <String>[
                          'User',
                          'Manager',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            signInWithEmailAndPassword(context);
                          },
                          //   if (selectedRole != null) {
                          //     // signInWithEmailAndPassword(context);
                          //     // Implement the login functionality with the selected role.
                          //   } else {
                          //     // Show an error or prompt to select a role.
                          //   }
                          // },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red, // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Rounded corners
                            ),
                            padding: const EdgeInsets.all(15.0),
                          ),
                          child: const Text('SIGN IN',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()),
                          );
                        },
                        child: const Text('Create an Account'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// import 'package:app/screens/map.dart';
// import 'package:app/screens/signup.dart';
// import 'package:app/screens/usermap.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   String? selectedRole;

//   Future<void> signInWithEmailAndPassword(BuildContext context) async {
//     try {
//       final UserCredential userCredential =
//           await _auth.signInWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );

//       final User? user = userCredential.user;
//       // Sign-in successful
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text(
//             'Login Successful',
//             style: TextStyle(color: Colors.red),
//           ),
//           backgroundColor: Colors.black,
//         ),
//       );

//       if (user != null) {
//         final DocumentSnapshot<Map<String, dynamic>> userDoc =
//             await FirebaseFirestore.instance
//                 .collection('user_roles')
//                 .doc(user.uid)
//                 .get();
//         final String? role = userDoc.data()?['role'];

//         if (role == 'Manager') {
//           Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (context) => MapScreen()));
//         } else {
//           Navigator.pushReplacement(context,
//               MaterialPageRoute(builder: (context) => UserMapScreen()));
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Login Failed, Invalid Account'),
//           ),
//         );
//       }
//     } catch (e) {
//       print('Error signing in: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Login Failed, Invalid Account'),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background Container
//           Container(
//             width: double.infinity,
//             height: 290, // Adjust the height as needed
//             decoration: const BoxDecoration(
//               color: Color(0xffEB3738),
//             ),
//             child: Center(
//               child: Image.asset(
//                 'assets/images/Group 155.png',
//                 height: 116, // Adjust the image height
//                 width: 93, // Adjust the image width
//               ),
//             ),
//           ),

//           // Login Form Container
//           Center(
//             child: Container(
//               height: 380,
//               width: 350,
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade200,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       const Text(
//                         'Login',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: TextField(
//                           controller: emailController,
//                           decoration: const InputDecoration(
//                             labelText: 'Email',
//                             prefixIcon: Icon(Icons.email),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: TextField(
//                           controller: passwordController,
//                           decoration: const InputDecoration(
//                             labelText: 'Password',
//                             prefixIcon: Icon(Icons.lock),
//                           ),
//                           obscureText: true,
//                         ),
//                       ),
//                       // Role selection dropdown
//                       DropdownButton<String>(
//                         hint: const Text('Select Role'),
//                         value: selectedRole,
//                         onChanged: (String? newValue) {
//                           setState(() {
//                             selectedRole = newValue;
//                           });
//                         },
//                         items: <String>[
//                           'User',
//                           'Manager',
//                         ].map((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value),
//                           );
//                         }).toList(),
//                       ),
//                       const SizedBox(height: 10),
//                       Container(
//                         width: 200,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             signInWithEmailAndPassword(context);
//                           },
//                           //   if (selectedRole != null) {
//                           //     // signInWithEmailAndPassword(context);
//                           //     // Implement the login functionality with the selected role.
//                           //   } else {
//                           //     // Show an error or prompt to select a role.
//                           //   }
//                           // },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.red, // Background color
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(
//                                   10.0), // Rounded corners
//                             ),
//                             padding: const EdgeInsets.all(15.0),
//                           ),
//                           child: const Text('SIGN IN',
//                               style: TextStyle(color: Colors.white)),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => SignUpScreen()),
//                           );
//                         },
//                         child: const Text('Create an Account'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
