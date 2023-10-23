import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditDonorDetailsScreen extends StatefulWidget {
  final String donorId;
  final Map<String, dynamic> donorData;

  EditDonorDetailsScreen({
    required this.donorId,
    required this.donorData,
  });

  @override
  _EditDonorDetailsScreenState createState() =>
      _EditDonorDetailsScreenState(donorData);
}

class _EditDonorDetailsScreenState extends State<EditDonorDetailsScreen> {
  final Map<String, dynamic> donorData;
  final _nameController = TextEditingController();
  final _cityController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _dateController = TextEditingController();

  _EditDonorDetailsScreenState(this.donorData);

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with the current values
    _nameController.text = donorData['name'] ?? "";
    _cityController.text = donorData['city'] ?? "";
    _contactNumberController.text = donorData['contactNumber'] ?? "";
    _dateController.text = donorData['date'] ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: const Color(0xffEB3738),
        title: const Text('Edit Donor Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Name
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 20),

            // City
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(labelText: 'City'),
            ),
            const SizedBox(height: 20),

            // Contact Number
            TextField(
              controller: _contactNumberController,
              decoration: const InputDecoration(labelText: 'Contact Number'),
            ),
            const SizedBox(height: 20),

            // Date
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(labelText: 'Date'),
            ),
            const SizedBox(height: 40),

            // Save Button
            ElevatedButton(
              onPressed: () {
                // Implement the save action to update data in Firebase Firestore
                showConfirmationDialog(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void updateDonorDetails() {
  //   // Update the donor data in Firebase Firestore
  //   FirebaseFirestore.instance.collection('donors').doc(widget.donorId).update({
  //     'name': _nameController.text,
  //     'city': _cityController.text,
  //     'contactNumber': _contactNumberController.text,
  //     'date': _dateController.text,
  //   }).then((_) {
  //     // Data updated successfully, navigate back to the donor details screen
  //     Navigator.of(context).pop();
  //   }).catchError((error) {
  //     // Handle error, e.g., show an error message
  //     print('Error updating donor details: $error');
  //   });
  // }

  void updateDonorDetails() {
    final donorId = widget.donorId;

    if (donorId != null && donorId.isNotEmpty) {
      // Update the donor data in Firebase Firestore
      FirebaseFirestore.instance.collection('donors').doc(donorId).update({
        'name': _nameController.text,
        'city': _cityController.text,
        'contactNumber': _contactNumberController.text,
        'date': _dateController.text,
      }).then((_) {
        // Data updated successfully, navigate back to the donor details screen
        Navigator.of(context).pop();
      }).catchError((error) {
        // Handle error, e.g., show an error message
        print('Error updating donor details: $error');
      });
    } else {
      // Handle the situation when donorId is empty or null
      print('Invalid donor ID');
    }
  }

  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Save'),
          content: Text('Are you sure you want to save changes?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                updateDonorDetails();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // Dispose of text controllers
    _nameController.dispose();
    _cityController.dispose();
    _contactNumberController.dispose();
    _dateController.dispose();
    super.dispose();
  }
}
