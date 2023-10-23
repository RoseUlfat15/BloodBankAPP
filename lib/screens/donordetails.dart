import 'package:app/screens/editdonor.dart';
import 'package:flutter/material.dart';

class DonorDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> donorData;

  DonorDetailsScreen(this.donorData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: const Color(0xffEB3738),
        title: const Text('Donor Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              // Name
              Text(
                'Name: ${donorData['name'] ?? "N/A"}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

              // Divider
              const Divider(height: 20, thickness: 1, color: Colors.black),
              const SizedBox(
                height: 20,
              ),
              Text(
                'City: ${donorData['city'] ?? "N/A"}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Divider(height: 20, thickness: 1, color: Colors.black),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Contact Number: ${donorData['contactNumber'] ?? "N/A"}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Divider(height: 20, thickness: 1, color: Colors.black),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Date: ${donorData['date'] ?? "N/A"}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Divider(height: 20, thickness: 1, color: Colors.black),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: const Text(
                      'Blood Group:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Rectangular box for Blood Group
                  Container(
                    height: 40,
                    width: 40,
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: Text(
                      '${donorData['bloodGroup'] ?? "N/A"}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              // Image
              const SizedBox(height: 55),
              Container(
                height: 200, // Adjust the height as needed
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  'assets/images/Mask group.png', // Replace with your map image
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 55),
              // Buttons (Call and Edit)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton("Call", Icons.call, Colors.red, context),
                  buildButton("Edit", Icons.edit, Colors.red, context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(
      String label, IconData icon, Color buttonColor, BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: () {
            if (label == "Edit") {
              // Navigate to the edit donor details screen.
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditDonorDetailsScreen(
                    donorId: donorData['id'] ?? '',
                    // Pass the donor ID or any identifier you use
                    donorData: donorData,
                  ),
                ),
              );
            } else if (label == "Call") {
              // Implement the action for the "Call" button.
            }
          },
          color: buttonColor,
        ),
        Text(
          label,
          style: TextStyle(color: buttonColor),
        ),
      ],
    );
  }
}
