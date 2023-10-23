// // // import 'package:flutter/material.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';

// // // class DonorListScreen extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //          toolbarHeight: 60,
// // //         backgroundColor: const Color(0xffEB3738),
// // //         title: Text('Donor List'),
// // //       ),
// // //       body: StreamBuilder(
// // //         stream: FirebaseFirestore.instance.collection('donors').snapshots(),
// // //         builder: (context, snapshot) {
// // //           if (!snapshot.hasData) {
// // //             return CircularProgressIndicator(); // Loading indicator while data is fetched.
// // //           }
// // //           List<Widget> donorTiles = []; // List to store donor list tiles.

// // //           // Iterate through the donor data and create list tiles.
// // //           snapshot.data!.docs.forEach((donor) {
// // //             var donorData = donor.data() as Map<String, dynamic>;
// // //             donorTiles.add(
// // //               ListTile(
// // //                 title: Text(donorData['name']),
// // //                 subtitle: Text(donorData['bloodGroup']),
// // //                 trailing: Text(donorData['contactNumber']),
// // //               ),
// // //             );
// // //           });

// // //           return ListView(
// // //             children: donorTiles,
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';

// // class DonorListScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         toolbarHeight: 60,
// //         backgroundColor: const Color(0xffEB3738),
// //         title: Text('Donor List'),
// //       ),
// //       body: StreamBuilder(
// //         stream: FirebaseFirestore.instance.collection('donors').snapshots(),
// //         builder: (context, snapshot) {
// //           if (!snapshot.hasData) {
// //             return CircularProgressIndicator(); // Loading indicator while data is fetched.
// //           }
// //           List<Widget> donorCards = []; // List to store donor cards.

// //           // Iterate through the donor data and create cards.
// //           snapshot.data!.docs.forEach((donor) {
// //             var donorData = donor.data() as Map<String, dynamic>;
// //             donorCards.add(
// //               Card(
// //                 elevation: 4, // Card elevation
// //                 margin: EdgeInsets.all(8), // Margin around the card
// //                 child: ListTile(
// //                   title: Text(donorData['name']),
// //                   subtitle: Text(donorData['bloodGroup']),
// //                   trailing: Text(donorData['contactNumber']),
// //                 ),
// //               ),
// //             );
// //           });

// //           return ListView(
// //             children: donorCards,
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class DonorListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 60,
//         backgroundColor: const Color(0xffEB3738),
//         title: Text('Donor List'),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('donors').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return CircularProgressIndicator(); // Loading indicator while data is fetched.
//           }
//           List<Widget> donorTiles = []; // List to store donor list tiles.

//           // Iterate through the donor data and create list tiles.
//           snapshot.data!.docs.forEach((donor) {
//             var donorData = donor.data() as Map<String, dynamic>;
//             donorTiles.add(
//               Card(
//                 child: ListTile(
//                   title: Text('Name: ${donorData['name']}'),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Blood Group: ${donorData['bloodGroup']}'),
//                       Text('Contact Number: ${donorData['contactNumber']}'),
//                       Text('Date: ${donorData['date']}'),
//                       Text('Country: ${donorData['country']}'),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           });

//           return ListView(
//             children: donorTiles,
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class DonorListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 60,
//         backgroundColor: const Color(0xffEB3738),
//         title: Text('ALL DONORS'),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('donors').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return CircularProgressIndicator(); // Loading indicator while data is fetched.
//           }

//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               var donorData =
//                   snapshot.data!.docs[index].data() as Map<String, dynamic>;

//               return Column(
//                 children: [
//                   Card(
//                     borderOnForeground: true, // Add a red border to the card.
//                     shape: RoundedRectangleBorder(
//                       side: BorderSide(
//                         color: Colors.red, // Red border color.
//                         width: 2.0, // Border width.
//                       ),
//                       borderRadius:
//                           BorderRadius.circular(8.0), // Border radius.
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(
//                           16), // Add padding inside the card.
//                       child: ListTile(
//                         title: Row(
//                           children: [
//                             Text('Name: ${donorData['name']}'),
//                             Spacer(), // Pushes blood group to the right.
//                             Container(
//                               width: 30, // Adjust width as needed.
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                 color: Colors.red, // Box background color.
//                                 borderRadius: BorderRadius.circular(
//                                     8.0), // Box border radius.
//                               ),
//                               child: Text(
//                                 '${donorData['bloodGroup']}',
//                                 style: TextStyle(
//                                   color: Colors.white, // Text color.
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                                 'Contact Number: ${donorData['contactNumber']}'),
//                             Text('Date: ${donorData['date']}'),
//                             Text('City: ${donorData['city']}'),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 16), // Add space between cards.
//                 ],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:app/screens/donordetails.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonorListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: const Color(0xffEB3738),
        title: Text('Donor List'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('donors').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator(); // Loading indicator while data is fetched.
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var donorData =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;

              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigate to the donor details screen.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DonorDetailsScreen(donorData),
                        ),
                      );
                    },
                    child: Card(
                      borderOnForeground: true,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: ListTile(
                          title: Row(
                            children: [
                              Text('Name: ${donorData['name']}'),
                              Spacer(),
                              Container(
                                width: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  '${donorData['bloodGroup']}',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Contact Number: ${donorData['contactNumber']}'),
                              Text('Date: ${donorData['date']}'),
                              Text('City: ${donorData['city']}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
