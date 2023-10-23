// // import 'package:cloud_firestore/cloud_firestore.dart';

// // void addDonor(String name, String bloodGroup, String contactNumber) {
// //   FirebaseFirestore.instance.collection('donors').add({
// //     'name': name,
// //     'bloodGroup': bloodGroup,
// //     'contactNumber': contactNumber,
// //   });
// // }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AddDonorScreen extends StatefulWidget {
//   const AddDonorScreen({super.key});

//   @override
//   _AddDonorScreenState createState() => _AddDonorScreenState();
// }

// class _AddDonorScreenState extends State<AddDonorScreen> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController bloodGroupController = TextEditingController();
//   final TextEditingController contactNumberController = TextEditingController();

//   Future<void> addDonor() async {
//     String name = nameController.text;
//     String bloodGroup = bloodGroupController.text;
//     String contactNumber = contactNumberController.text;

//     await FirebaseFirestore.instance.collection('donors').add({
//       'name': name,
//       'bloodGroup': bloodGroup,
//       'contactNumber': contactNumber,
//     });

//     nameController.clear();
//     bloodGroupController.clear();
//     contactNumberController.clear();

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Donor added successfully'),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 60,
//         backgroundColor: const Color(0xffEB3738),
//         title: Text('Add Donor'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: bloodGroupController,
//               decoration: InputDecoration(labelText: 'Blood Group'),
//             ),
//             TextField(
//               controller: contactNumberController,
//               decoration: InputDecoration(labelText: 'Contact Number'),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: addDonor,
//               child: Text('Add Donor'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddDonorScreen extends StatefulWidget {
  const AddDonorScreen({Key? key}) : super(key: key);

  @override
  _AddDonorScreenState createState() => _AddDonorScreenState();
}

class _AddDonorScreenState extends State<AddDonorScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  Future<void> addDonor() async {
    String name = nameController.text;
    String bloodGroup = bloodGroupController.text;
    String contactNumber = contactNumberController.text;
    String date = dateController.text;
    String city = cityController.text;

    try {
      DocumentReference newDonorRef =
          await FirebaseFirestore.instance.collection('donors').add({
        'name': name,
        'bloodGroup': bloodGroup,
        'contactNumber': contactNumber,
        'date': date,
        'city': city,
      });

      // The newDonorRef contains the document reference with the auto-generated donor ID
      String donorId = newDonorRef.id;
      nameController.clear();
      bloodGroupController.clear();
      contactNumberController.clear();
      dateController.clear();
      cityController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Donor added successfully with ID: $donorId'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: const Color(0xffEB3738),
        title: Text('Add Donor'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: bloodGroupController,
              decoration: InputDecoration(labelText: 'Blood Group'),
            ),
            TextField(
              controller: contactNumberController,
              decoration: InputDecoration(labelText: 'Contact Number'),
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            TextField(
              controller: cityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: addDonor,
              child: Text('Add Donor'),
            ),
          ],
        ),
      ),
    );
  }
}
