// // // // // // import 'package:bio_data_maker/screens/payment_screen.dart';
// // // // // // import 'package:flutter/material.dart';

// // // // // // class BiodataPreviewPage extends StatelessWidget {
// // // // // //   final String templateImage;
// // // // // //   final String imagePath;

// // // // // //   BiodataPreviewPage(
// // // // // //       {super.key, required this.imagePath, required this.templateImage});

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       appBar: AppBar(
// // // // // //         title: const Text(
// // // // // //           'Biodata Preview',
// // // // // //           style: TextStyle(
// // // // // //             fontWeight: FontWeight.bold,
// // // // // //             color: Colors.white,
// // // // // //           ),
// // // // // //         ),
// // // // // //       ),

// // // // // //       body: Column(
// // // // // //         children: <Widget>[
// // // // // //           // Display the selected frame with the image
// // // // // //           Container(
// // // // // //             decoration: BoxDecoration(
// // // // // //               image: DecorationImage(
// // // // // //                 image: NetworkImage(
// // // // // //                     imagePath), // Display the selected image from the network
// // // // // //                 fit: BoxFit.cover,
// // // // // //               ),
// // // // // //             ),
// // // // // //             height: 509,
// // // // // //             width: double.infinity,
// // // // // //             child: Stack(
// // // // // //               children: [
// // // // // //                 // Add the user image or placeholder
// // // // // //                 Align(
// // // // // //                   // alignment: Alignment.center,
// // // // // //                   child: Image.asset(
// // // // // //                     'assets/images/frame_8.png',
// // // // // //                     fit: BoxFit.cover,
// // // // // //                   ),
// // // // // //                 ),
// // // // // //                 const Align(
// // // // // //                   alignment: Alignment.bottomCenter,
// // // // // //                 ),
// // // // // //               ],
// // // // // //             ),
// // // // // //           ),
// // // // // //           ElevatedButton(
// // // // // //             onPressed: () {
// // // // // //               _showSubscribeDialog(context); // Show subscription popup
// // // // // //             },
// // // // // //             child: const Text(
// // // // // //               'Create PDF',
// // // // // //               style: TextStyle(
// // // // // //                 color: Colors.white,
// // // // // //               ),
// // // // // //             ),
// // // // // //           ),
// // // // // //           const SizedBox(height: 10),
// // // // // //           // Share PDF Button
// // // // // //           ElevatedButton(
// // // // // //             onPressed: () {
// // // // // //               _showSubscribeDialog(context); // Show subscription popup
// // // // // //             },
// // // // // //             child: const Text(
// // // // // //               'Share PDF',
// // // // // //               style: TextStyle(
// // // // // //                 color: Colors.white,
// // // // // //               ),
// // // // // //             ),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   // Function to show the subscription popup
// // // // // //   void _showSubscribeDialog(BuildContext context) {
// // // // // //     showDialog(
// // // // // //       context: context,
// // // // // //       builder: (BuildContext context) {
// // // // // //         return AlertDialog(
// // // // // //           title: const Text('Subscribe!'),
// // // // // //           content: const Text(
// // // // // //               'Subcribe for Unlimited Creation, Downloads and sharing of Biodata.'),
// // // // // //           actions: [
// // // // // //             ElevatedButton(
// // // // // //               onPressed: () {
// // // // // //                 Navigator.push(
// // // // // //                   context,
// // // // // //                   MaterialPageRoute(
// // // // // //                     builder: (context) => PaymentScreen(),
// // // // // //                   ),
// // // // // //                 );
// // // // // //                 // Navigator.pop(context); // Close the dialog
// // // // // //                 // Navigator.pushNamed(
// // // // // //                 //     context, '/payment'); // Navigate to payment screen
// // // // // //               },
// // // // // //               child: const Text(
// // // // // //                 'Subscribe',
// // // // // //                 style: TextStyle(
// // // // // //                   color: Colors.white,
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ),
// // // // // //           ],
// // // // // //         );
// // // // // //       },
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // import 'dart:convert';

// // // // // import 'package:bio_data_maker/screens/payment_screen.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:http/http.dart' as http;

// // // // // class BiodataPreviewPage extends StatefulWidget {
// // // // //   final String templateImage; // URL for the selected template image
// // // // //   // final String imagePath; // Path for the user's image
// // // // //   final String biodataId;

// // // // //   // Constructor to receive the image path and template image URL
// // // // //   BiodataPreviewPage({
// // // // //     Key? key,
// // // // //     // required this.imagePath,
// // // // //     required this.templateImage,
// // // // //     required this.biodataId,
// // // // //   }) : super(key: key);

// // // // //   @override
// // // // //   State<BiodataPreviewPage> createState() => _BiodataPreviewPageState();
// // // // // }

// // // // // class _BiodataPreviewPageState extends State<BiodataPreviewPage> {
// // // // //   Map<String, dynamic>? biodataDetails;
// // // // //   bool isLoading = true;
// // // // //   String? errorMessage;
// // // // //   GlobalKey _globalKey = GlobalKey(); // Key to capture the widget as an image

// // // // //   @override
// // // // //   void initState() {
// // // // //     super.initState();

// // // // //     print("bio data is is==========${widget.biodataId}");
// // // // //     fetchBiodataDetails();
// // // // //   }

// // // // //   Future<void> fetchBiodataDetails() async {
// // // // //     try {
// // // // //       // Fetching biodata using the provided biodataId
// // // // //       final response = await http.get(
// // // // //         Uri.parse(
// // // // //             'https://techfluxsolutions.com/royal_maratha/api/users/showBiodataByBiodataId?biodata_id=${widget.biodataId}'),
// // // // //       );

// // // // //       if (response.statusCode == 200) {
// // // // //         final data = json.decode(response.body);
// // // // //         print('API Response: $data'); // Debug print

// // // // //         // Check if biodata is found
// // // // //         if (data['status'] == true && data['data'] != null) {
// // // // //           setState(() {
// // // // //             biodataDetails = data['data'];
// // // // //             isLoading = false;
// // // // //           });
// // // // //         } else {
// // // // //           setState(() {
// // // // //             isLoading = false;
// // // // //             errorMessage = 'No biodata found';
// // // // //           });
// // // // //         }
// // // // //       } else {
// // // // //         setState(() {
// // // // //           isLoading = false;
// // // // //           errorMessage = 'Failed to load data: ${response.statusCode}';
// // // // //         });
// // // // //       }
// // // // //     } catch (error) {
// // // // //       setState(() {
// // // // //         isLoading = false;
// // // // //         errorMessage = 'Error: $error';
// // // // //       });
// // // // //     }
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         title: const Text(
// // // // //           'Biodata Preview',
// // // // //           style: TextStyle(
// // // // //             fontWeight: FontWeight.bold,
// // // // //             color: Colors.white,
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //       body: Container(
// // // // //         color: Colors.grey.shade400,
// // // // //         child: Column(
// // // // //           mainAxisAlignment:
// // // // //               MainAxisAlignment.start, // Align items at the start
// // // // //           children: <Widget>[
// // // // //             // Display the selected template image
// // // // //             Expanded(
// // // // //               // Use Expanded to take available space
// // // // //               child: Container(
// // // // //                 decoration: BoxDecoration(
// // // // //                   image: DecorationImage(
// // // // //                     image: NetworkImage(widget
// // // // //                         .templateImage), // Display the selected template image from the network
// // // // //                     fit: BoxFit.cover,
// // // // //                   ),
// // // // //                 ),
// // // // //                 height: 400, // Height of the template image
// // // // //                 width: 370,
// // // // //                 child: Stack(
// // // // //                   // alignment: Alignment.center, // Center align the user image
// // // // //                   children: [
// // // // //                     Positioned(
// // // // //                       top: 20,
// // // // //                       left: 150,
// // // // //                       child: Text(
// // // // //                         "Biodata",
// // // // //                         style: TextStyle(
// // // // //                           fontSize: 12,
// // // // //                           fontWeight: FontWeight.bold,
// // // // //                         ),
// // // // //                       ),
// // // // //                     ),
// // // // //                     Positioned(
// // // // //                       top: 35,
// // // // //                       left: 20,
// // // // //                       child: Text(
// // // // //                         "Personal Details",
// // // // //                         style: TextStyle(
// // // // //                           fontWeight: FontWeight.bold,
// // // // //                         ),
// // // // //                       ),
// // // // //                     ),
// // // // //                     Positioned(
// // // // //                       top: 50,
// // // // //                       left: 20,
// // // // //                       child: Text(
// // // // //                         "Full Name :  ${biodataDetails?['username']}",
// // // // //                         style: TextStyle(
// // // // //                           fontSize: 10,
// // // // //                         ),
// // // // //                       ),
// // // // //                     ),
// // // // //                     Positioned(
// // // // //                       top: 70,
// // // // //                       left: 20,
// // // // //                       child: Text(
// // // // //                         "Full Name :  ${biodataDetails?['username']}",
// // // // //                         style: TextStyle(
// // // // //                           fontSize: 10,
// // // // //                         ),
// // // // //                       ),
// // // // //                     ),
// // // // //                     Positioned(
// // // // //                       top: 80,
// // // // //                       left: 20,
// // // // //                       child: Text(
// // // // //                         "Full Name :  ${biodataDetails?['username']}",
// // // // //                         style: TextStyle(
// // // // //                           fontSize: 10,
// // // // //                         ),
// // // // //                       ),
// // // // //                     ),
// // // // //                   ],
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(
// // // // //                 height: 20), // Add some space between image and buttons
// // // // //             // Buttons in a row
// // // // //             Padding(
// // // // //               padding: const EdgeInsets.all(12.0), // Add padding around buttons
// // // // //               child: Row(
// // // // //                 mainAxisAlignment:
// // // // //                     MainAxisAlignment.spaceEvenly, // Evenly space the buttons
// // // // //                 children: [
// // // // //                   Expanded(
// // // // //                     child: OutlinedButton(
// // // // //                       style: OutlinedButton.styleFrom(
// // // // //                         backgroundColor: Colors.white,
// // // // //                         side: const BorderSide(
// // // // //                             color: Colors.orange,
// // // // //                             width: 2), // Set border color and width
// // // // //                         shadowColor:
// // // // //                             Colors.grey.withOpacity(0.5), // Add a grey shadow
// // // // //                         elevation:
// // // // //                             2, // Add a slight elevation for shadow effect
// // // // //                       ),
// // // // //                       onPressed: () {
// // // // //                         _showSubscribeDialog(
// // // // //                             context); // Show subscription popup
// // // // //                       },
// // // // //                       child: const Text(
// // // // //                         'Create PDF',
// // // // //                         style: TextStyle(color: Colors.black), // Text color
// // // // //                       ),
// // // // //                     ),
// // // // //                   ),
// // // // //                   const SizedBox(width: 10), // Add spacing between buttons
// // // // //                   Expanded(
// // // // //                     child: OutlinedButton(
// // // // //                       style: OutlinedButton.styleFrom(
// // // // //                         backgroundColor: Colors.white,
// // // // //                         side: const BorderSide(
// // // // //                             color: Colors.orange,
// // // // //                             width: 2), // Set border color and width
// // // // //                         shadowColor:
// // // // //                             Colors.grey.withOpacity(0.5), // Add a grey shadow
// // // // //                         elevation:
// // // // //                             2, // Add a slight elevation for shadow effect
// // // // //                       ),
// // // // //                       onPressed: () {
// // // // //                         _showSubscribeDialog(
// // // // //                             context); // Show subscription popup
// // // // //                       },
// // // // //                       child: const Text(
// // // // //                         'Share PDF',
// // // // //                         style: TextStyle(color: Colors.black), // Text color
// // // // //                       ),
// // // // //                     ),
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   // Function to show the subscription popup
// // // // //   void _showSubscribeDialog(BuildContext context) {
// // // // //     showDialog(
// // // // //       context: context,
// // // // //       builder: (BuildContext context) {
// // // // //         return AlertDialog(
// // // // //           backgroundColor: Colors.white,
// // // // //           title: const Text('Subscribe!'),
// // // // //           content: const Text(
// // // // //               'Subscribe for Unlimited Creation, Downloads and sharing of Biodata.'),
// // // // //           actions: [
// // // // //             ElevatedButton(
// // // // //               onPressed: () {
// // // // //                 Navigator.push(
// // // // //                   context,
// // // // //                   MaterialPageRoute(
// // // // //                     builder: (context) => PaymentScreen(),
// // // // //                   ),
// // // // //                 );
// // // // //               },
// // // // //               child: const Text(
// // // // //                 'Subscribe',
// // // // //                 style: TextStyle(
// // // // //                   color: Colors.white,
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //           ],
// // // // //         );
// // // // //       },
// // // // //     );
// // // // //   }
// // // // // }

// // // // import 'dart:convert';
// // // // import 'package:bio_data_maker/screens/payment_screen.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:http/http.dart' as http;

// // // // class BiodataPreviewPage extends StatefulWidget {
// // // //   final String templateImage; // URL for the selected template image
// // // //   final String biodataId;

// // // //   BiodataPreviewPage({
// // // //     Key? key,
// // // //     required this.templateImage,
// // // //     required this.biodataId,
// // // //   }) : super(key: key);

// // // //   @override
// // // //   _BiodataPreviewPageState createState() => _BiodataPreviewPageState();
// // // // }

// // // // class _BiodataPreviewPageState extends State<BiodataPreviewPage> {
// // // //   Map<String, dynamic>? biodataDetails;
// // // //   bool isLoading = true;
// // // //   String? errorMessage;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     fetchBiodataDetails();
// // // //   }

// // // //   Future<void> fetchBiodataDetails() async {
// // // //     try {
// // // //       final response = await http.get(
// // // //         Uri.parse(
// // // //             'https://techfluxsolutions.com/royal_maratha/api/users/showBiodataByBiodataId?biodata_id=${widget.biodataId}'),
// // // //       );

// // // //       if (response.statusCode == 200) {
// // // //         final data = json.decode(response.body);
// // // //         if (data['status'] == true && data['data'] != null) {
// // // //           setState(() {
// // // //             biodataDetails = data['data'];
// // // //             isLoading = false;
// // // //           });
// // // //         } else {
// // // //           setState(() {
// // // //             isLoading = false;
// // // //             errorMessage = 'No biodata found';
// // // //           });
// // // //         }
// // // //       } else {
// // // //         setState(() {
// // // //           isLoading = false;
// // // //           errorMessage = 'Failed to load data: ${response.statusCode}';
// // // //         });
// // // //       }
// // // //     } catch (error) {
// // // //       setState(() {
// // // //         isLoading = false;
// // // //         errorMessage = 'Error: $error';
// // // //       });
// // // //     }
// // // //   }

// // // //   // Helper method to build field rows with labels
// // // //   Widget _buildField(String label, String? value) {
// // // //     return Padding(
// // // //       padding: const EdgeInsets.symmetric(vertical: 4.0),
// // // //       child: Row(
// // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // //         children: [
// // // //           Text(
// // // //             '$label: ',
// // // //             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
// // // //           ),
// // // //           Expanded(
// // // //             child: Text(
// // // //               value ?? 'Not available',
// // // //               style: const TextStyle(fontSize: 14),
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: const Text(
// // // //           'Biodata Preview',
// // // //           style: TextStyle(
// // // //             fontWeight: FontWeight.bold,
// // // //             color: Colors.white,
// // // //           ),
// // // //         ),
// // // //       ),
// // // //       body: isLoading
// // // //           ? const Center(child: CircularProgressIndicator()) // Show loading
// // // //           : errorMessage != null
// // // //               ? Center(child: Text(errorMessage!)) // Show error message
// // // //               : SingleChildScrollView(
// // // //                   child: Column(
// // // //                     crossAxisAlignment: CrossAxisAlignment.stretch,
// // // //                     children: [
// // // //                       // Displaying the template image
// // // //                       Container(
// // // //                         height: 400,
// // // //                         decoration: BoxDecoration(
// // // //                           image: DecorationImage(
// // // //                             image: NetworkImage(widget.templateImage),
// // // //                             fit: BoxFit.cover,
// // // //                           ),
// // // //                         ),
// // // //                         child: Stack(
// // // //                           children: [],
// // // //                         ),
// // // //                       ),
// // // //                       Padding(
// // // //                         padding: const EdgeInsets.all(16.0),
// // // //                         child: Column(
// // // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // // //                           children: [
// // // //                             const SizedBox(height: 16),
// // // //                             const Text(
// // // //                               'Personal Details',
// // // //                               style: TextStyle(
// // // //                                   fontWeight: FontWeight.bold, fontSize: 18),
// // // //                             ),
// // // //                             const SizedBox(height: 10),
// // // //                             _buildField(
// // // //                                 'Full Name', biodataDetails?['username']),
// // // //                             _buildField('Caste', biodataDetails?['caste']),
// // // //                             _buildField(
// // // //                                 'Subcaste', biodataDetails?['subcaste']),
// // // //                             _buildField(
// // // //                                 'Birthdate', biodataDetails?['birthdate']),
// // // //                             _buildField(
// // // //                                 'Birthtime', biodataDetails?['birthtime']),
// // // //                             _buildField(
// // // //                                 'Birthplace', biodataDetails?['birthplace']),
// // // //                             _buildField('Height', biodataDetails?['height']),
// // // //                             _buildField(
// // // //                                 'Blood Group', biodataDetails?['blood_group']),
// // // //                             _buildField('Mobile', biodataDetails?['mobile']),
// // // //                             _buildField('Devak', biodataDetails?['gothra']),
// // // //                             _buildField(
// // // //                                 'Complexion', biodataDetails?['complexion']),
// // // //                             _buildField('Education',
// // // //                                 biodataDetails?['education_level']),
// // // //                             _buildField(
// // // //                                 'Occupation', biodataDetails?['occupation']),
// // // //                             _buildField(
// // // //                                 'Annual Income', biodataDetails?['income']),
// // // //                             const SizedBox(height: 16),
// // // //                             const Text(
// // // //                               'Family Details',
// // // //                               style: TextStyle(
// // // //                                   fontWeight: FontWeight.bold, fontSize: 18),
// // // //                             ),
// // // //                             const SizedBox(height: 10),
// // // //                             _buildField('Father\'s Name',
// // // //                                 biodataDetails?['father_name']),
// // // //                             _buildField('Father\'s Occupation',
// // // //                                 biodataDetails?['father_occupation']),
// // // //                             _buildField('Mother\'s Name',
// // // //                                 biodataDetails?['mother_name']),
// // // //                             _buildField('Mother\'s Occupation',
// // // //                                 biodataDetails?['mother_occupation']),
// // // //                             _buildField('Total Brothers',
// // // //                                 biodataDetails?['no_of_brothers'].toString()),
// // // //                             _buildField('Total Sisters',
// // // //                                 biodataDetails?['no_of_sisters'].toString()),
// // // //                             const SizedBox(height: 16),
// // // //                             const Text(
// // // //                               'Other Details',
// // // //                               style: TextStyle(
// // // //                                   fontWeight: FontWeight.bold, fontSize: 18),
// // // //                             ),
// // // //                             const SizedBox(height: 10),
// // // //                             _buildField('Relatives',
// // // //                                 biodataDetails?['surname_of_relatives']),
// // // //                             _buildField('Residential Address',
// // // //                                 biodataDetails?['address']),
// // // //                             _buildField('Native Place',
// // // //                                 biodataDetails?['native_taluka']),
// // // //                             _buildField(
// // // //                                 'Property', biodataDetails?['property']),
// // // //                             _buildField('Expectations',
// // // //                                 biodataDetails?['expectations']),
// // // //                           ],
// // // //                         ),
// // // //                       ),
// // // //                       const SizedBox(height: 20),
// // // //                       // Buttons for PDF actions
// // // //                       Padding(
// // // //                         padding: const EdgeInsets.all(16.0),
// // // //                         child: Row(
// // // //                           children: [
// // // //                             Expanded(
// // // //                               child: OutlinedButton(
// // // //                                 style: OutlinedButton.styleFrom(
// // // //                                   backgroundColor: Colors.white,
// // // //                                   side: const BorderSide(
// // // //                                       color: Colors.orange, width: 2),
// // // //                                 ),
// // // //                                 onPressed: () {
// // // //                                   _showSubscribeDialog(context);
// // // //                                 },
// // // //                                 child: const Text(
// // // //                                   'Create PDF',
// // // //                                   style: TextStyle(color: Colors.black),
// // // //                                 ),
// // // //                               ),
// // // //                             ),
// // // //                             const SizedBox(width: 10),
// // // //                             Expanded(
// // // //                               child: OutlinedButton(
// // // //                                 style: OutlinedButton.styleFrom(
// // // //                                   backgroundColor: Colors.white,
// // // //                                   side: const BorderSide(
// // // //                                       color: Colors.orange, width: 2),
// // // //                                 ),
// // // //                                 onPressed: () {
// // // //                                   _showSubscribeDialog(context);
// // // //                                 },
// // // //                                 child: const Text(
// // // //                                   'Share PDF',
// // // //                                   style: TextStyle(color: Colors.black),
// // // //                                 ),
// // // //                               ),
// // // //                             ),
// // // //                           ],
// // // //                         ),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //     );
// // // //   }

// // // //   // Function to show the subscription popup
// // // //   void _showSubscribeDialog(BuildContext context) {
// // // //     showDialog(
// // // //       context: context,
// // // //       builder: (BuildContext context) {
// // // //         return AlertDialog(
// // // //           backgroundColor: Colors.white,
// // // //           title: const Text('Subscribe!'),
// // // //           content: const Text(
// // // //               'Subscribe for Unlimited Creation, Downloads, and Sharing of Biodata.'),
// // // //           actions: [
// // // //             ElevatedButton(
// // // //               onPressed: () {
// // // //                 Navigator.push(
// // // //                   context,
// // // //                   MaterialPageRoute(
// // // //                     builder: (context) => PaymentScreen(),
// // // //                   ),
// // // //                 );
// // // //               },
// // // //               child: const Text(
// // // //                 'Subscribe',
// // // //                 style: TextStyle(color: Colors.white),
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         );
// // // //       },
// // // //     );
// // // //   }
// // // // }

// // import 'dart:convert';
// // import 'package:bio_data_maker/screens/payment_screen.dart';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;

// // class BiodataPreviewPage extends StatefulWidget {
// //   final String templateImage; // URL for the selected template image
// //   final String biodataId;

// //   BiodataPreviewPage({
// //     Key? key,
// //     required this.templateImage,
// //     required this.biodataId,
// //   }) : super(key: key);

// //   @override
// //   State<BiodataPreviewPage> createState() => _BiodataPreviewPageState();
// // }

// // class _BiodataPreviewPageState extends State<BiodataPreviewPage> {
// //   Map<String, dynamic>? biodataDetails;
// //   bool isLoading = true;
// //   String? errorMessage;

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchBiodataDetails();
// //   }

// //   Future<void> fetchBiodataDetails() async {
// //     try {
// //       final response = await http.get(
// //         Uri.parse(
// //             'https://techfluxsolutions.com/royal_maratha/api/users/showBiodataByBiodataId?biodata_id=${widget.biodataId}'),
// //       );

// //       if (response.statusCode == 200) {
// //         final data = json.decode(response.body);

// //         if (data['status'] == true && data['data'] != null) {
// //           setState(() {
// //             biodataDetails = data['data'];
// //             isLoading = false;
// //           });
// //         } else {
// //           setState(() {
// //             isLoading = false;
// //             errorMessage = 'No biodata found';
// //           });
// //         }
// //       } else {
// //         setState(() {
// //           isLoading = false;
// //           errorMessage = 'Failed to load data: ${response.statusCode}';
// //         });
// //       }
// //     } catch (error) {
// //       setState(() {
// //         isLoading = false;
// //         errorMessage = 'Error: $error';
// //       });
// //     }
// //   }

// //   Widget _buildField(String title, String? value) {
// //     return Text(
// //       '$title: ${value ?? 'N/A'}',
// //       style: TextStyle(fontSize: 14, color: Colors.black),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text(
// //           'Biodata Preview',
// //           style: TextStyle(
// //             fontWeight: FontWeight.bold,
// //             color: Colors.white,
// //           ),
// //         ),
// //       ),
// //       body: isLoading
// //           ? const Center(child: CircularProgressIndicator())
// //           : errorMessage != null
// //               ? Center(child: Text(errorMessage!))
// //               : Container(
// //                   color: Colors.grey.shade400,
// //                   child: Stack(
// //                     children: [
// //                       // Background template image
// //                       Positioned.fill(
// //                         child: Container(
// //                           decoration: BoxDecoration(
// //                             image: DecorationImage(
// //                               image: NetworkImage(widget.templateImage),
// //                               fit: BoxFit.cover,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       // Personal Details Section
// //                       Positioned(
// //                         top: 20,
// //                         left: 20,
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             const Text(
// //                               'Personal Details',
// //                               style: TextStyle(
// //                                   fontWeight: FontWeight.bold,
// //                                   fontSize: 18,
// //                                   color: Colors.black),
// //                             ),
// //                             // const SizedBox(height: 10),
// //                             _buildField(
// //                                 'Full Name', biodataDetails?['username']),
// //                             _buildField('Caste', biodataDetails?['caste']),
// //                             _buildField(
// //                                 'Subcaste', biodataDetails?['subcaste']),
// //                             _buildField(
// //                                 'Birthdate', biodataDetails?['birthdate']),
// //                             _buildField(
// //                                 'Birthtime', biodataDetails?['birthtime']),
// //                             _buildField(
// //                                 'Birthplace', biodataDetails?['birthplace']),
// //                             _buildField('Height', biodataDetails?['height']),
// //                             _buildField(
// //                                 'Blood Group', biodataDetails?['blood_group']),
// //                             _buildField('Mobile', biodataDetails?['mobile']),
// //                             _buildField('Devak', biodataDetails?['gothra']),
// //                             _buildField(
// //                                 'Complexion', biodataDetails?['complexion']),
// //                             _buildField('Education',
// //                                 biodataDetails?['education_level']),
// //                             _buildField(
// //                                 'Occupation', biodataDetails?['occupation']),
// //                             _buildField(
// //                                 'Annual Income', biodataDetails?['income']),
// //                           ],
// //                         ),
// //                       ),

// //                       Positioned(
// //                         top: 340,
// //                         left: 20,
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             const Text(
// //                               'Family Details',
// //                               style: TextStyle(
// //                                   fontWeight: FontWeight.bold,
// //                                   fontSize: 18,
// //                                   color: Colors.black),
// //                             ),
// //                             const SizedBox(height: 10),
// //                             _buildField('Father\'s Name',
// //                                 biodataDetails?['father_name']),
// //                             _buildField('Father\'s Occupation',
// //                                 biodataDetails?['father_occupation']),
// //                             _buildField('Mother\'s Name',
// //                                 biodataDetails?['mother_name']),
// //                             _buildField('Mother\'s Occupation',
// //                                 biodataDetails?['mother_occupation']),
// //                             _buildField('Total Brothers',
// //                                 biodataDetails?['no_of_brothers'].toString()),
// //                             _buildField('Total Sisters',
// //                                 biodataDetails?['no_of_sisters'].toString()),
// //                           ],
// //                         ),
// //                       ),
// //                       // Other Details Section
// //                       Positioned(
// //                         top:
// //                             500, // Adjust this value to position the other details
// //                         left: 20,
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             const Text(
// //                               'Other Details',
// //                               style: TextStyle(
// //                                   fontWeight: FontWeight.bold,
// //                                   fontSize: 18,
// //                                   color: Colors.black),
// //                             ),
// //                             _buildField('Relatives',
// //                                 biodataDetails?['surname_of_relatives']),
// //                             _buildField('Residential Address',
// //                                 biodataDetails?['address']),
// //                             _buildField('Native Place',
// //                                 biodataDetails?['native_taluka']),
// //                             _buildField(
// //                                 'Property', biodataDetails?['property']),
// //                             _buildField('Expectations',
// //                                 biodataDetails?['expectations']),
// //                           ],
// //                         ),
// //                       ),
// //                       // Bottom Buttons
// //                       Positioned(
// //                         bottom:
// //                             20, // Adjust this value for spacing from the bottom
// //                         left: 20,
// //                         right: 20,
// //                         child: Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                           children: [
// //                             Expanded(
// //                               child: OutlinedButton(
// //                                 style: OutlinedButton.styleFrom(
// //                                   backgroundColor: Colors.white,
// //                                   side: const BorderSide(
// //                                       color: Colors.orange, width: 2),
// //                                   shadowColor: Colors.grey.withOpacity(0.5),
// //                                   elevation: 2,
// //                                 ),
// //                                 onPressed: () {
// //                                   _showSubscribeDialog(context);
// //                                 },
// //                                 child: const Text(
// //                                   'Create PDF',
// //                                   style: TextStyle(color: Colors.black),
// //                                 ),
// //                               ),
// //                             ),
// //                             Expanded(
// //                               child: OutlinedButton(
// //                                 style: OutlinedButton.styleFrom(
// //                                   backgroundColor: Colors.white,
// //                                   side: const BorderSide(
// //                                       color: Colors.orange, width: 2),
// //                                   shadowColor: Colors.grey.withOpacity(0.5),
// //                                   elevation: 2,
// //                                 ),
// //                                 onPressed: () {
// //                                   _showSubscribeDialog(context);
// //                                 },
// //                                 child: const Text(
// //                                   'Share PDF',
// //                                   style: TextStyle(color: Colors.black),
// //                                 ),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //     );
// //   }

// //   void _showSubscribeDialog(BuildContext context) {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           backgroundColor: Colors.white,
// //           title: const Text('Subscribe!'),
// //           content: const Text(
// //               'Subscribe for Unlimited Creation, Downloads and sharing of Biodata.'),
// //           actions: [
// //             ElevatedButton(
// //               onPressed: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (context) => PaymentScreen(),
// //                   ),
// //                 );
// //               },
// //               child: const Text(
// //                 'Subscribe',
// //                 style: TextStyle(color: Colors.white),
// //               ),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }

// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:io';
// // import 'dart:typed_data';
// // import 'dart:ui' as ui;
// // import 'package:flutter/rendering.dart';
// // import 'package:path_provider/path_provider.dart';

// // import 'payment_screen.dart';

// // class BiodataPreviewPage extends StatefulWidget {
// //   final String templateImage; // URL for the selected template image
// //   final String biodataId;

// //   BiodataPreviewPage({
// //     Key? key,
// //     required this.templateImage,
// //     required this.biodataId,
// //   }) : super(key: key);

// //   @override
// //   State<BiodataPreviewPage> createState() => _BiodataPreviewPageState();
// // }

// // class _BiodataPreviewPageState extends State<BiodataPreviewPage> {
// //   Map<String, dynamic>? biodataDetails;
// //   bool isLoading = true;
// //   String? errorMessage;

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchBiodataDetails();
// //   }

// //   Future<void> fetchBiodataDetails() async {
// //     try {
// //       final response = await http.get(
// //         Uri.parse(
// //             'https://techfluxsolutions.com/royal_maratha/api/users/showBiodataByBiodataId?biodata_id=${widget.biodataId}'),
// //       );

// //       if (response.statusCode == 200) {
// //         final data = json.decode(response.body);

// //         if (data['status'] == true && data['data'] != null) {
// //           setState(() {
// //             biodataDetails = data['data'];
// //             isLoading = false;
// //           });
// //         } else {
// //           setState(() {
// //             isLoading = false;
// //             errorMessage = 'No biodata found';
// //           });
// //         }
// //       } else {
// //         setState(() {
// //           isLoading = false;
// //           errorMessage = 'Failed to load data: ${response.statusCode}';
// //         });
// //       }
// //     } catch (error) {
// //       setState(() {
// //         isLoading = false;
// //         errorMessage = 'Error: $error';
// //       });
// //     }
// //   }

// //   Widget _buildField(String title, String? value) {
// //     return Text(
// //       '$title: ${value ?? 'N/A'}',
// //       style: TextStyle(fontSize: 14, color: Colors.black),
// //     );
// //   }

// //   GlobalKey _globalKey = GlobalKey();

// //   Future<void> _capturePng() async {
// //     try {
// //       RenderRepaintBoundary boundary = _globalKey.currentContext!
// //           .findRenderObject() as RenderRepaintBoundary;

// //       ui.Image image = await boundary.toImage(pixelRatio: 10.0);

// //       ByteData? byteData =
// //           await image.toByteData(format: ui.ImageByteFormat.png);

// //       Uint8List pngBytes = byteData!.buffer.asUint8List();

// //       final directory = (await getDownloadsDirectory())!.path;
// //       File imgFile = File('$directory/widget_image.png');
// //       await imgFile.writeAsBytes(pngBytes);
// //       print("Image saved to: $directory/widget_image.png");
// //     } catch (e) {
// //       print(e);
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text(
// //           'Biodata Preview',
// //           style: TextStyle(
// //             fontWeight: FontWeight.bold,
// //             color: Colors.white,
// //           ),
// //         ),
// //       ),
// //       body: isLoading
// //           ? const Center(child: CircularProgressIndicator())
// //           : errorMessage != null
// //               ? Center(child: Text(errorMessage!))
// //               : Container(
// //                   color: Colors.grey.shade400,
// //                   child: Stack(
// //                     children: [
// //                       // Background template image
// //                       Positioned.fill(
// //                         child: Container(
// //                           decoration: BoxDecoration(
// //                             image: DecorationImage(
// //                               image: NetworkImage(widget.templateImage),
// //                               fit: BoxFit.cover,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       // Personal Details Section
// //                       Positioned(
// //                         top: 20,
// //                         left: 20,
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             const Text(
// //                               'Personal Details',
// //                               style: TextStyle(
// //                                   fontWeight: FontWeight.bold,
// //                                   fontSize: 18,
// //                                   color: Colors.black),
// //                             ),
// //                             _buildField(
// //                                 'Full Name', biodataDetails?['username']),
// //                             _buildField('Caste', biodataDetails?['caste']),
// //                             _buildField(
// //                                 'Subcaste', biodataDetails?['subcaste']),
// //                             _buildField(
// //                                 'Birthdate', biodataDetails?['birthdate']),
// //                             _buildField(
// //                                 'Birthtime', biodataDetails?['birthtime']),
// //                             _buildField(
// //                                 'Birthplace', biodataDetails?['birthplace']),
// //                             _buildField('Height', biodataDetails?['height']),
// //                             _buildField(
// //                                 'Blood Group', biodataDetails?['blood_group']),
// //                             _buildField('Mobile', biodataDetails?['mobile']),
// //                             _buildField('Devak', biodataDetails?['gothra']),
// //                             _buildField(
// //                                 'Complexion', biodataDetails?['complexion']),
// //                             _buildField('Education',
// //                                 biodataDetails?['education_level']),
// //                             _buildField(
// //                                 'Occupation', biodataDetails?['occupation']),
// //                             _buildField(
// //                                 'Annual Income', biodataDetails?['income']),
// //                           ],
// //                         ),
// //                       ),

// //                       Positioned(
// //                         top: 340,
// //                         left: 20,
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             const Text(
// //                               'Family Details',
// //                               style: TextStyle(
// //                                   fontWeight: FontWeight.bold,
// //                                   fontSize: 18,
// //                                   color: Colors.black),
// //                             ),
// //                             _buildField('Father\'s Name',
// //                                 biodataDetails?['father_name']),
// //                             _buildField('Father\'s Occupation',
// //                                 biodataDetails?['father_occupation']),
// //                             _buildField('Mother\'s Name',
// //                                 biodataDetails?['mother_name']),
// //                             _buildField('Mother\'s Occupation',
// //                                 biodataDetails?['mother_occupation']),
// //                             _buildField('Total Brothers',
// //                                 biodataDetails?['no_of_brothers'].toString()),
// //                             _buildField('Total Sisters',
// //                                 biodataDetails?['no_of_sisters'].toString()),
// //                           ],
// //                         ),
// //                       ),
// //                       // Other Details Section
// //                       Positioned(
// //                         top:
// //                             500, // Adjust this value to position the other details
// //                         left: 20,
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             const Text(
// //                               'Other Details',
// //                               style: TextStyle(
// //                                   fontWeight: FontWeight.bold,
// //                                   fontSize: 18,
// //                                   color: Colors.black),
// //                             ),
// //                             _buildField('Relatives',
// //                                 biodataDetails?['surname_of_relatives']),
// //                             _buildField('Residential Address',
// //                                 biodataDetails?['address']),
// //                             _buildField('Native Place',
// //                                 biodataDetails?['native_taluka']),
// //                             _buildField(
// //                                 'Property', biodataDetails?['property']),
// //                             _buildField('Expectations',
// //                                 biodataDetails?['expectations']),
// //                           ],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //       bottomNavigationBar: Container(
// //         height: 40,
// //         color: Colors.grey.shade300,
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //           children: [
// //             Expanded(
// //               child: OutlinedButton(
// //                 style: OutlinedButton.styleFrom(
// //                   backgroundColor: Colors.white,
// //                   side: const BorderSide(color: Colors.orange, width: 2),
// //                   shadowColor: Colors.grey.withOpacity(0.5),
// //                   elevation: 2,
// //                 ),
// //                 onPressed: () {
// //                   // _showSubscribeDialog(context);
// //                   _capturePng();
// //                 },
// //                 child: const Text(
// //                   'Create PDF',
// //                   style: TextStyle(color: Colors.black),
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(width: 10),
// //             Expanded(
// //               child: OutlinedButton(
// //                 style: OutlinedButton.styleFrom(
// //                   backgroundColor: Colors.white,
// //                   side: const BorderSide(color: Colors.orange, width: 2),
// //                   shadowColor: Colors.grey.withOpacity(0.5),
// //                   elevation: 2,
// //                 ),
// //                 onPressed: () {
// //                   _showSubscribeDialog(context);
// //                 },
// //                 child: const Text(
// //                   'Share PDF',
// //                   style: TextStyle(color: Colors.black),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   void _showSubscribeDialog(BuildContext context) {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           backgroundColor: Colors.white,
// //           title: const Text('Subscribe!'),
// //           content: const Text(
// //               'Subscribe for Unlimited Creation, Downloads and sharing of Biodata.'),
// //           actions: [
// //             ElevatedButton(
// //               onPressed: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (context) => PaymentScreen(),
// //                   ),
// //                 );
// //               },
// //               child: const Text(
// //                 'Subscribe',
// //                 style: TextStyle(color: Colors.white),
// //               ),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }

// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:io';
// // import 'dart:typed_data';
// // import 'dart:ui' as ui;
// // import 'package:flutter/rendering.dart';
// // import 'package:path_provider/path_provider.dart';

// // import 'payment_screen.dart';

// // class BiodataPreviewPage extends StatefulWidget {
// //   final String templateImage; // URL for the selected template image
// //   final String biodataId;

// //   BiodataPreviewPage({
// //     Key? key,
// //     required this.templateImage,
// //     required this.biodataId,
// //   }) : super(key: key);

// //   @override
// //   State<BiodataPreviewPage> createState() => _BiodataPreviewPageState();
// // }

// // class _BiodataPreviewPageState extends State<BiodataPreviewPage> {
// //   Map<String, dynamic>? biodataDetails;
// //   bool isLoading = true;
// //   String? errorMessage;

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchBiodataDetails();
// //   }

// //   Future<void> fetchBiodataDetails() async {
// //     try {
// //       final response = await http.get(
// //         Uri.parse(
// //             'https://techfluxsolutions.com/royal_maratha/api/users/showBiodataByBiodataId?biodata_id=${widget.biodataId}'),
// //       );

// //       if (response.statusCode == 200) {
// //         final data = json.decode(response.body);

// //         if (data['status'] == true && data['data'] != null) {
// //           setState(() {
// //             biodataDetails = data['data'];
// //             isLoading = false;
// //           });
// //         } else {
// //           setState(() {
// //             isLoading = false;
// //             errorMessage = 'No biodata found';
// //           });
// //         }
// //       } else {
// //         setState(() {
// //           isLoading = false;
// //           errorMessage = 'Failed to load data: ${response.statusCode}';
// //         });
// //       }
// //     } catch (error) {
// //       setState(() {
// //         isLoading = false;
// //         errorMessage = 'Error: $error';
// //       });
// //     }
// //   }

// //   Widget _buildField(String title, String? value) {
// //     return Text(
// //       '$title: ${value ?? 'N/A'}',
// //       style: TextStyle(fontSize: 14, color: Colors.black),
// //     );
// //   }

// //   GlobalKey _globalKey = GlobalKey();

// //   Future<void> _capturePng() async {
// //     try {
// //       RenderRepaintBoundary boundary = _globalKey.currentContext!
// //           .findRenderObject() as RenderRepaintBoundary;

// //       ui.Image image = await boundary.toImage(pixelRatio: 10.0);

// //       ByteData? byteData =
// //           await image.toByteData(format: ui.ImageByteFormat.png);

// //       Uint8List pngBytes = byteData!.buffer.asUint8List();

// //       final directory = (await getDownloadsDirectory())!.path;
// //       File imgFile = File('$directory/widget_image.png');
// //       await imgFile.writeAsBytes(pngBytes);
// //       print("Image saved to: $directory/widget_image.png");
// //     } catch (e) {
// //       print(e);
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text(
// //           'Biodata Preview',
// //           style: TextStyle(
// //             fontWeight: FontWeight.bold,
// //             color: Colors.white,
// //           ),
// //         ),
// //       ),
// //       body: isLoading
// //           ? const Center(child: CircularProgressIndicator())
// //           : errorMessage != null
// //               ? Center(child: Text(errorMessage!))
// //               : Container(
// //                   color: Colors.grey.shade400,
// //                   child: Stack(
// //                     children: [
// //                       // Background template image
// //                       Positioned.fill(
// //                         child: Container(
// //                           decoration: BoxDecoration(
// //                             image: DecorationImage(
// //                               image: NetworkImage(widget.templateImage),
// //                               fit: BoxFit.cover,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       // Personal Details Section
// //                       Positioned(
// //                         top: 20,
// //                         left: 20,
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             const Text(
// //                               'Personal Details',
// //                               style: TextStyle(
// //                                   fontWeight: FontWeight.bold,
// //                                   fontSize: 18,
// //                                   color: Colors.black),
// //                             ),
// //                             _buildField(
// //                                 'Full Name', biodataDetails?['username']),
// //                             _buildField('Caste', biodataDetails?['caste']),
// //                             _buildField(
// //                                 'Subcaste', biodataDetails?['subcaste']),
// //                             _buildField(
// //                                 'Birthdate', biodataDetails?['birthdate']),
// //                             _buildField(
// //                                 'Birthtime', biodataDetails?['birthtime']),
// //                             _buildField(
// //                                 'Birthplace', biodataDetails?['birthplace']),
// //                             _buildField('Height', biodataDetails?['height']),
// //                             _buildField(
// //                                 'Blood Group', biodataDetails?['blood_group']),
// //                             _buildField('Mobile', biodataDetails?['mobile']),
// //                             _buildField('Devak', biodataDetails?['gothra']),
// //                             _buildField(
// //                                 'Complexion', biodataDetails?['complexion']),
// //                             _buildField('Education',
// //                                 biodataDetails?['education_level']),
// //                             _buildField(
// //                                 'Occupation', biodataDetails?['occupation']),
// //                             _buildField(
// //                                 'Annual Income', biodataDetails?['income']),
// //                           ],
// //                         ),
// //                       ),

// //                       Positioned(
// //                         top: 340,
// //                         left: 20,
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             const Text(
// //                               'Family Details',
// //                               style: TextStyle(
// //                                   fontWeight: FontWeight.bold,
// //                                   fontSize: 18,
// //                                   color: Colors.black),
// //                             ),
// //                             _buildField('Father\'s Name',
// //                                 biodataDetails?['father_name']),
// //                             _buildField('Father\'s Occupation',
// //                                 biodataDetails?['father_occupation']),
// //                             _buildField('Mother\'s Name',
// //                                 biodataDetails?['mother_name']),
// //                             _buildField('Mother\'s Occupation',
// //                                 biodataDetails?['mother_occupation']),
// //                             _buildField('Total Brothers',
// //                                 biodataDetails?['no_of_brothers'].toString()),
// //                             _buildField('Total Sisters',
// //                                 biodataDetails?['no_of_sisters'].toString()),
// //                           ],
// //                         ),
// //                       ),
// //                       // Other Details Section
// //                       Positioned(
// //                         top:
// //                             500, // Adjust this value to position the other details
// //                         left: 20,
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             const Text(
// //                               'Other Details',
// //                               style: TextStyle(
// //                                   fontWeight: FontWeight.bold,
// //                                   fontSize: 18,
// //                                   color: Colors.black),
// //                             ),
// //                             _buildField('Relatives',
// //                                 biodataDetails?['surname_of_relatives']),
// //                             _buildField('Residential Address',
// //                                 biodataDetails?['address']),
// //                             _buildField('Native Place',
// //                                 biodataDetails?['native_taluka']),
// //                             _buildField(
// //                                 'Property', biodataDetails?['property']),
// //                             _buildField('Expectations',
// //                                 biodataDetails?['expectations']),
// //                           ],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //       bottomNavigationBar: Container(
// //         height: 40,
// //         color: Colors.grey.shade300,
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //           children: [
// //             Expanded(
// //               child: OutlinedButton(
// //                 style: OutlinedButton.styleFrom(
// //                   backgroundColor: Colors.white,
// //                   side: const BorderSide(color: Colors.orange, width: 2),
// //                   shadowColor: Colors.grey.withOpacity(0.5),
// //                   elevation: 2,
// //                 ),
// //                 onPressed: () {
// //                   // _showSubscribeDialog(context);
// //                   _capturePng();
// //                 },
// //                 child: const Text(
// //                   'Create PDF',
// //                   style: TextStyle(color: Colors.black),
// //                 ),
// //               ),
// //             ),
// // const SizedBox(width: 10),
// // Expanded(
// //   child: OutlinedButton(
// //     style: OutlinedButton.styleFrom(
// //       backgroundColor: Colors.white,
// //       side: const BorderSide(color: Colors.orange, width: 2),
// //       shadowColor: Colors.grey.withOpacity(0.5),
// //       elevation: 2,
// //     ),
// //     onPressed: () {
// //       _showSubscribeDialog(context);
// //     },
// //     child: const Text(
// //       'Share PDF',
// //       style: TextStyle(color: Colors.black),
// //     ),
// //   ),
// // ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// // void _showSubscribeDialog(BuildContext context) {
// //   showDialog(
// //     context: context,
// //     builder: (BuildContext context) {
// //       return AlertDialog(
// //         backgroundColor: Colors.white,
// //         title: const Text('Subscribe!'),
// //         content: const Text(
// //             'Subscribe for Unlimited Creation, Downloads and sharing of Biodata.'),
// //         actions: [
// //           ElevatedButton(
// //             onPressed: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(
// //                   builder: (context) => PaymentScreen(),
// //                 ),
// //               );
// //             },
// //             child: const Text(
// //               'Subscribe',
// //               style: TextStyle(color: Colors.white),
// //             ),
// //           ),
// //         ],
// //       );
// //     },
// //   );
// // }
// // }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui' as ui;
// import 'package:flutter/rendering.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

// import 'payment_screen.dart';

// class BiodataPreviewPage extends StatefulWidget {
//   final String templateImage; // URL for the selected template image
//   final String biodataId;

//   BiodataPreviewPage({
//     Key? key,
//     required this.templateImage,
//     required this.biodataId,
//   }) : super(key: key);

//   @override
//   State<BiodataPreviewPage> createState() => _BiodataPreviewPageState();
// }

// class _BiodataPreviewPageState extends State<BiodataPreviewPage> {
//   Map<String, dynamic>? biodataDetails;
//   bool isLoading = true;
//   String? errorMessage;
//   GlobalKey _globalKey = GlobalKey();

//   @override
//   void initState() {
//     super.initState();
//     fetchBiodataDetails();
//   }

//   Future<void> fetchBiodataDetails() async {
//     try {
//       final response = await http.get(
//         Uri.parse(
//             'https://techfluxsolutions.com/royal_maratha/api/users/showBiodataByBiodataId?biodata_id=${widget.biodataId}'),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);

//         if (data['status'] == true && data['data'] != null) {
//           setState(() {
//             biodataDetails = data['data'];
//             isLoading = false;
//           });
//         } else {
//           setState(() {
//             isLoading = false;
//             errorMessage = 'No biodata found';
//           });
//         }
//       } else {
//         setState(() {
//           isLoading = false;
//           errorMessage = 'Failed to load data: ${response.statusCode}';
//         });
//       }
//     } catch (error) {
//       setState(() {
//         isLoading = false;
//         errorMessage = 'Error: $error';
//       });
//     }
//   }

//   Widget _buildField(String title, String? value) {
//     return Text(
//       '$title: ${value ?? 'N/A'}',
//       style: TextStyle(fontSize: 14, color: Colors.black),
//     );
//   }

//   Future<void> _captureAndSaveAsPdf() async {
//     try {
//       // Capture the widget as an image
//       RenderRepaintBoundary boundary = _globalKey.currentContext!
//           .findRenderObject() as RenderRepaintBoundary;
//       ui.Image image = await boundary.toImage(pixelRatio: 3.0);
//       ByteData? byteData =
//           await image.toByteData(format: ui.ImageByteFormat.png);
//       Uint8List pngBytes = byteData!.buffer.asUint8List();

//       // Create a PDF document
//       final pdf = pw.Document();
//       final imageMemory = pw.MemoryImage(pngBytes);

//       // Add the captured image as a page in the PDF
//       pdf.addPage(
//         pw.Page(
//           build: (pw.Context context) {
//             return pw.Center(
//               child: pw.Image(imageMemory),
//             );
//           },
//         ),
//       );

//       // Save the PDF file
//       final directory = await getApplicationDocumentsDirectory();
//       final path = '${directory.path}/biodata_preview.pdf';
//       final file = File(path);
//       await file.writeAsBytes(await pdf.save());

//       print("PDF saved to: $path");

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('PDF saved successfully!')),
//       );
//     } catch (e) {
//       print("Error saving PDF: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error saving PDF!')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Biodata Preview',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : errorMessage != null
//               ? Center(child: Text(errorMessage!))
//               : RepaintBoundary(
//                   key: _globalKey,
//                   child: Container(
//                     color: Colors.grey.shade400,
//                     child: Stack(
//                       children: [
//                         // Background template image
//                         Positioned.fill(
//                           child: Container(
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: NetworkImage(widget.templateImage),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                         // Personal Details Section
//                         Positioned(
//                           top: 20,
//                           left: 20,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'Personal Details',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18,
//                                     color: Colors.black),
//                               ),
//                               _buildField(
//                                   'Full Name', biodataDetails?['username']),
//                               _buildField('Caste', biodataDetails?['caste']),
//                               _buildField(
//                                   'Subcaste', biodataDetails?['subcaste']),
//                               _buildField(
//                                   'Birthdate', biodataDetails?['birthdate']),
//                               _buildField(
//                                   'Birthtime', biodataDetails?['birthtime']),
//                               _buildField(
//                                   'Birthplace', biodataDetails?['birthplace']),
//                               _buildField('Height', biodataDetails?['height']),
//                               _buildField('Blood Group',
//                                   biodataDetails?['blood_group']),
//                               _buildField('Mobile', biodataDetails?['mobile']),
//                               _buildField('Devak', biodataDetails?['gothra']),
//                               _buildField(
//                                   'Complexion', biodataDetails?['complexion']),
//                               _buildField('Education',
//                                   biodataDetails?['education_level']),
//                               _buildField(
//                                   'Occupation', biodataDetails?['occupation']),
//                               _buildField(
//                                   'Annual Income', biodataDetails?['income']),
//                             ],
//                           ),
//                         ),
//                         // Family Details Section
//                         Positioned(
//                           top: 340,
//                           left: 20,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'Family Details',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18,
//                                     color: Colors.black),
//                               ),
//                               _buildField('Father\'s Name',
//                                   biodataDetails?['father_name']),
//                               _buildField('Father\'s Occupation',
//                                   biodataDetails?['father_occupation']),
//                               _buildField('Mother\'s Name',
//                                   biodataDetails?['mother_name']),
//                               _buildField('Mother\'s Occupation',
//                                   biodataDetails?['mother_occupation']),
//                               _buildField('Total Brothers',
//                                   biodataDetails?['no_of_brothers'].toString()),
//                               _buildField('Total Sisters',
//                                   biodataDetails?['no_of_sisters'].toString()),
//                             ],
//                           ),
//                         ),
//                         // Other Details Section
//                         Positioned(
//                           top:
//                               500, // Adjust this value to position the other details
//                           left: 20,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'Other Details',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18,
//                                     color: Colors.black),
//                               ),
//                               _buildField('Relatives',
//                                   biodataDetails?['surname_of_relatives']),
//                               _buildField('Residential Address',
//                                   biodataDetails?['address']),
//                               _buildField('Native Place',
//                                   biodataDetails?['native_taluka']),
//                               _buildField(
//                                   'Property', biodataDetails?['property']),
//                               _buildField('Expectations',
//                                   biodataDetails?['expectations']),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//       bottomNavigationBar: Container(
//         height: 40,
//         color: Colors.grey.shade300,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Expanded(
//               child: OutlinedButton(
//                 style: OutlinedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   side: const BorderSide(color: Colors.orange, width: 2),
//                 ),
//                 onPressed: _captureAndSaveAsPdf,
//                 child: const Text(
//                   'Create PDF',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 10),
//             Expanded(
//               child: OutlinedButton(
//                 style: OutlinedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   side: const BorderSide(color: Colors.orange, width: 2),
//                   shadowColor: Colors.grey.withOpacity(0.5),
//                   elevation: 2,
//                 ),
//                 onPressed: () {
//                   _showSubscribeDialog(context);
//                 },
//                 child: const Text(
//                   'Share PDF',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showSubscribeDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: Colors.white,
//           title: const Text('Subscribe!'),
//           content: const Text(
//               'Subscribe for Unlimited Creation, Downloads and sharing of Biodata.'),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => PaymentScreen(),
//                   ),
//                 );
//               },
//               child: const Text(
//                 'Subscribe',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'payment_screen.dart';

class BiodataPreviewPage extends StatefulWidget {
  final String templateImage; // URL for the selected template image
  final String biodataId;

  BiodataPreviewPage({
    Key? key,
    required this.templateImage,
    required this.biodataId,
  }) : super(key: key);

  @override
  State<BiodataPreviewPage> createState() => _BiodataPreviewPageState();
}

class _BiodataPreviewPageState extends State<BiodataPreviewPage> {
  Map<String, dynamic>? biodataDetails;
  bool isLoading = true;
  String? errorMessage;
  GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    fetchBiodataDetails();
  }

  Future<void> fetchBiodataDetails() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://techfluxsolutions.com/royal_maratha/api/users/showBiodataByBiodataId?biodata_id=${widget.biodataId}'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == true && data['data'] != null) {
          setState(() {
            biodataDetails = data['data'];
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
            errorMessage = 'No biodata found';
          });
        }
      } else {
        setState(() {
          isLoading = false;
          errorMessage = 'Failed to load data: ${response.statusCode}';
        });
      }
    } catch (error) {
      setState(() {
        isLoading = false;
        errorMessage = 'Error: $error';
      });
    }
  }

  Widget _buildField(String title, String? value) {
    return Text(
      '$title: ${value ?? 'N/A'}',
      style: TextStyle(fontSize: 14, color: Colors.black),
    );
  }

  Future<void> _captureAndSaveAsPdf() async {
    try {
      // Capture the widget as an image
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Create a PDF document
      final pdf = pw.Document();
      final imageMemory = pw.MemoryImage(pngBytes);

      // Add the captured image as a page in the PDF
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Image(imageMemory),
            );
          },
        ),
      );

      // Save the PDF to the Downloads directory
      final directory =
          await getExternalStorageDirectory(); // This will provide the external storage directory
      final path =
          '${directory!.path}/biodata_preview.pdf'; // Specify file name
      final file = File(path);
      await file.writeAsBytes(await pdf.save());

      print("PDF saved to: $path");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF saved successfully! Path: $path')),
      );
    } catch (e) {
      print("Error saving PDF: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving PDF!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Biodata Preview',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(child: Text(errorMessage!))
              : RepaintBoundary(
                  key: _globalKey,
                  child: Container(
                    color: Colors.grey.shade400,
                    child: Stack(
                      children: [
                        // Background template image
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(widget.templateImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        // Personal Details Section
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Personal Details',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                              _buildField(
                                  'Full Name', biodataDetails?['username']),
                              _buildField('Caste', biodataDetails?['caste']),
                              _buildField(
                                  'Subcaste', biodataDetails?['subcaste']),
                              _buildField(
                                  'Birthdate', biodataDetails?['birthdate']),
                              _buildField(
                                  'Birthtime', biodataDetails?['birthtime']),
                              _buildField(
                                  'Birthplace', biodataDetails?['birthplace']),
                              _buildField('Height', biodataDetails?['height']),
                              _buildField('Blood Group',
                                  biodataDetails?['blood_group']),
                              _buildField('Mobile', biodataDetails?['mobile']),
                              _buildField('Devak', biodataDetails?['gothra']),
                              _buildField(
                                  'Complexion', biodataDetails?['complexion']),
                              _buildField('Education',
                                  biodataDetails?['education_level']),
                              _buildField(
                                  'Occupation', biodataDetails?['occupation']),
                              _buildField(
                                  'Annual Income', biodataDetails?['income']),
                            ],
                          ),
                        ),
                        // Family Details Section
                        Positioned(
                          top: 340,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Family Details',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                              _buildField('Father\'s Name',
                                  biodataDetails?['father_name']),
                              _buildField('Father\'s Occupation',
                                  biodataDetails?['father_occupation']),
                              _buildField('Mother\'s Name',
                                  biodataDetails?['mother_name']),
                              _buildField('Mother\'s Occupation',
                                  biodataDetails?['mother_occupation']),
                              _buildField('Total Brothers',
                                  biodataDetails?['no_of_brothers'].toString()),
                              _buildField('Total Sisters',
                                  biodataDetails?['no_of_sisters'].toString()),
                            ],
                          ),
                        ),
                        // Other Details Section
                        Positioned(
                          top:
                              500, // Adjust this value to position the other details
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Other Details',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                              _buildField('Relatives',
                                  biodataDetails?['surname_of_relatives']),
                              _buildField('Residential Address',
                                  biodataDetails?['address']),
                              _buildField('Native Place',
                                  biodataDetails?['native_taluka']),
                              _buildField(
                                  'Property', biodataDetails?['property']),
                              _buildField('Expectations',
                                  biodataDetails?['expectations']),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
      bottomNavigationBar: Container(
        height: 40,
        color: Colors.grey.shade300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.orange, width: 2),
                ),
                onPressed: _captureAndSaveAsPdf,
                child: const Text(
                  'Create PDF',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.orange, width: 2),
                  shadowColor: Colors.grey.withOpacity(0.5),
                  elevation: 2,
                ),
                onPressed: () {
                  _showSubscribeDialog(context);
                },
                child: const Text(
                  'Share PDF',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSubscribeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Subscribe!'),
          content: const Text(
              'Subscribe for Unlimited Creation, Downloads and sharing of Biodata.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(),
                  ),
                );
              },
              child: const Text(
                'Subscribe',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
