//first code
// import 'package:bio_data_maker/controller/fetchbiodatadetails_controller.dart';
// import 'package:bio_data_maker/screens/AllDetailsPage.dart';
// import 'package:bio_data_maker/screens/biodata_preview_page.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class TemplateDetailPage extends StatefulWidget {
//   final String selectedTemplateUrl;

//   const TemplateDetailPage({
//     Key? key,
//     required this.selectedTemplateUrl,
//     Map<String, String>? biodata,
//   }) : super(key: key);

//   @override
//   _TemplateDetailPageState createState() => _TemplateDetailPageState();
// }

// class _TemplateDetailPageState extends State<TemplateDetailPage> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback(
//       (_) {
//         print('Fetching biodata...');
//         context.read<FetchbiodatadetailsController>().fetchBiodatabyIdwise();
//       },
//     );
//   }

//   // Helper method to build only non-null fields
//   List<Widget> _buildNonNullFields(Map<String, String?> data) {
//     List<Widget> widgets = [];
//     data.forEach((key, value) {
//       if (value != null && value.isNotEmpty) {
//         widgets.add(
//           Positioned(
//             top: 100 + (widgets.length * 40),
//             left: 20,
//             child: Text(
//               '$key: $value',
//               style: const TextStyle(color: Colors.black, fontSize: 18),
//             ),
//           ),
//         );
//       }
//     });
//     return widgets;
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('Selected template URL: ${widget.selectedTemplateUrl}');

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Template',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: const Color(0xFFFF5507),
//       ),
//       body: Consumer<FetchbiodatadetailsController>(
//         builder: (context, controller, child) {
//           if (controller.loading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (controller.fetchData == null ||
//               controller.fetchData!.data == null) {
//             print('No data available or fetchData is null');
//             return const Center(child: Text('No data available'));
//           } else {
//             final biodata = controller.fetchData!.data!;
//             print('Fetched biodata: $biodata');

//             final Map<String, String?> data = {
//               'title': controller.fetchData!.data!.title,
//               'username': controller.fetchData!.data!.username,
//               'height': controller.fetchData!.data!.height,
//               'birthtime': controller.fetchData!.data!.birthtime,
//               'birthplace': controller.fetchData!.data!.birthplace,
//               'caste': controller.fetchData!.data!.caste,
//               'subcaste': controller.fetchData!.data!.subcaste,
//               'complexion': controller.fetchData!.data!.complexion,
//               "property": controller.fetchData!.data!.property,
//               "expectations": controller.fetchData!.data!.expectations,
//               "email": controller.fetchData!.data!.email,
//               "contact": controller.fetchData!.data!.contact,
//               "father_name": controller.fetchData!.data!.fatherName,
//               "mother_name": controller.fetchData!.data!.motherName,
//               "father_occupation": controller.fetchData!.data!.fatherOccupation,
//               "mother_occupation": controller.fetchData!.data!.motherOccupation,
//               "address": controller.fetchData!.data!.residentialAddress,
//               "no_of_brothers": controller.fetchData!.data!.totalBrothers,
//               "no_of_sisters": controller.fetchData!.data!.totalSisters,
//               "mobile": controller.fetchData!.data!.mobileNumber,
//               "mama_surname": controller.fetchData!.data!.maternalUncle,
//               "surname_of_relatives":
//                   controller.fetchData!.data!.surnameOfRelatives,
//               "family_native_place": controller.fetchData!.data!.nativePlace,
//             };

//             return SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                     height: 509,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: widget.selectedTemplateUrl.isNotEmpty
//                             ? NetworkImage(widget.selectedTemplateUrl)
//                             : AssetImage('assets/placeholder.png'),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     child: Stack(
//                       children: _buildNonNullFields(data),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => AllDetailsPage(),
//                         ),
//                       );
//                     },
//                     child: const Text('Edit Biodata'),
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => BiodataPreviewPage(
//                             templateImage: widget.selectedTemplateUrl,
//                             imagePath: '',
//                           ),
//                         ),
//                       );
//                     },
//                     child: const Text('Create PDF'),
//                   ),
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

//adding repaint boundry code
// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:bio_data_maker/controller/fetchbiodatadetails_controller.dart';

// class TemplateDetailPage extends StatefulWidget {
//   final String selectedTemplateUrl;

//   const TemplateDetailPage({
//     Key? key,
//     required this.selectedTemplateUrl,
//     required Map biodata,
//   }) : super(key: key);

//   @override
//   _TemplateDetailPageState createState() => _TemplateDetailPageState();
// }

// class _TemplateDetailPageState extends State<TemplateDetailPage> {
//   GlobalKey _globalKey = GlobalKey();

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback(
//       (_) {
//         context.read<FetchbiodatadetailsController>().fetchBiodatabyIdwise();
//       },
//     );
//   }

//   Future<void> _capturePng() async {
//     try {
//       RenderRepaintBoundary boundary = _globalKey.currentContext!
//           .findRenderObject() as RenderRepaintBoundary;

//       // Capture the image
//       ui.Image image = await boundary.toImage(pixelRatio: 10.0);
//       ByteData? byteData =
//           await image.toByteData(format: ui.ImageByteFormat.png);
//       Uint8List pngBytes = byteData!.buffer.asUint8List();

//       final directory = (await getApplicationDocumentsDirectory()).path;
//       File imgFile = File('$directory/widget_image.png');
//       await imgFile.writeAsBytes(pngBytes);

//       print("Image saved to: $directory/widget_image.png");
//     } catch (e) {
//       print(e);
//     }
//   }

//   List<Widget> _buildNonNullFields(Map<String, String?> data) {
//     List<Widget> widgets = [];
//     data.forEach((key, value) {
//       if (value != null && value.isNotEmpty) {
//         widgets.add(
//           Positioned(
//             top: 100 + (widgets.length * 40),
//             left: 20,
//             child: Text(
//               '$key: $value',
//               style: const TextStyle(color: Colors.black, fontSize: 18),
//             ),
//           ),
//         );
//       }
//     });
//     return widgets;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Template',
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         backgroundColor: const Color(0xFFFF5507),
//       ),
//       body: Consumer<FetchbiodatadetailsController>(
//         builder: (context, controller, child) {
//           if (controller.loading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (controller.fetchData == null) {
//             return const Center(child: Text('No biodata available'));
//           } else {
//             final biodata = controller.fetchData!;
//             final Map<String, String?> data = {
//               'Title': biodata.data!.title,
//               'Username': biodata.data!.username,
//               'Height': biodata.data!.height,
//               'Birth Time': biodata.data!.birthtime,
//               'Birth Place': biodata.data!.birthplace,
//               'Caste': biodata.data!.caste,
//               'Subcaste': biodata.data!.subcaste,
//               'Complexion': biodata.data!.complexion,
//               'Email': biodata.data!.email,
//               'Contact': biodata.data!.contact,
//             };

//             return SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   RepaintBoundary(
//                     key: _globalKey,
//                     child: Container(
//                       height: 500,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: NetworkImage(widget.selectedTemplateUrl),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       child: Stack(
//                         children: _buildNonNullFields(data),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: _capturePng,
//                     child: const Text('Capture'),
//                   ),
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

//niraj code
// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui' as ui;

// import 'package:biodata/consts/globals.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:path_provider/path_provider.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});

//   GlobalKey _globalKey = GlobalKey();

//   Future<void> _capturePng() async {
//     try {
//       // Get the render object of the widget and cast it to RenderRepaintBoundary
//       RenderRepaintBoundary boundary = _globalKey.currentContext!
//           .findRenderObject() as RenderRepaintBoundary;

//       // Capture the image
//       ui.Image image = await boundary.toImage(pixelRatio: 10.0);

//       // Convert the image to ByteData (PNG format)
//       ByteData? byteData =
//           await image.toByteData(format: ui.ImageByteFormat.png);

//       // Convert ByteData to Uint8List (PNG bytes)
//       Uint8List pngBytes = byteData!.buffer.asUint8List();

//       // You can now save the pngBytes to a file or use it as needed.
//       final directory = (await getApplicationDocumentsDirectory()).path;
//       File imgFile = File('$directory/widget_image.png');
//       imgFile.writeAsBytes(pngBytes);

//       print("Image saved to: $directory/widget_image.png");
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.symmetric(
//           horizontal: 20,
//         ),
//         width: double.infinity,
//         child: Column(
//           children: [
//             SizedBox(
//               height: 120,
//             ),
//             RepaintBoundary(
//               key: _globalKey,
//               child: Container(
//                 padding: EdgeInsets.only(left: 40, top: 80),
//                 width: double.infinity,
//                 height: 500,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     fit: BoxFit.fill,
//                     image: AssetImage(assets.temp1),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Name : Niraj Sanjay Patil"),
//                     Text("Birthdate : 9 May 2001"),
//                     Text("Birthplace : Dondaicha"),
//                     Text("Birth Time : 10:00 am"),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             FilledButton(
//               onPressed: _capturePng,
//               child: Text("Capture"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class TemplateDetailPage extends StatefulWidget {
//   final String selectedTemplateUrl;
//   final String biodataId;

//   const TemplateDetailPage({
//     Key? key,
//     required this.selectedTemplateUrl,
//     required this.biodataId, // Add biodata_id to fetch data
//   }) : super(key: key);

//   @override
//   _TemplateDetailPageState createState() => _TemplateDetailPageState();
// }

// class _TemplateDetailPageState extends State<TemplateDetailPage> {
//   Map<String, dynamic>? biodata;
//   bool isLoading = true;
//   String? errorMessage;

//   @override
//   void initState() {
//     super.initState();
//     fetchBiodata();
//   }

//   // Fetch biodata using the provided biodata_id
//   Future<void> fetchBiodata() async {
//     final url =
//         'https://techfluxsolutions.com/royal_maratha/api/users/showBiodataByBiodataId?biodata_id=${widget.biodataId}';
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         print('Biodata fetched: $data');

//         // Check if data is present and update state
//         setState(() {
//           biodata = data['data']; // Assuming 'data' contains the biodata info
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           errorMessage = 'Failed to load biodata: ${response.statusCode}';
//           isLoading = false;
//         });
//       }
//     } catch (error) {
//       setState(() {
//         errorMessage = 'Error: $error';
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Selected Template',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: const Color(0xFFFF5507),
//       ),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator()) // Show loader
//           : errorMessage != null
//               ? Center(child: Text(errorMessage!)) // Show error message
//               : Stack(
//                   children: [
//                     // Show template background image
//                     Container(
//                       width: double.infinity,
//                       height: double.infinity,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: widget.selectedTemplateUrl.isNotEmpty
//                               ? NetworkImage(widget.selectedTemplateUrl)
//                               : const AssetImage('assets/placeholder.png')
//                                   as ImageProvider,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     // Display fetched biodata
//                     Positioned(
//                       top: 100,
//                       left: 20,
//                       child: Text(
//                         'Biodata Information:',
//                         style: const TextStyle(color: Colors.red, fontSize: 24),
//                       ),
//                     ),
//                     if (biodata != null)
//                       Positioned(
//                         top: 140,
//                         left: 20,
//                         child: Text(
//                           biodata!['username'] ??
//                               'No username', // Example field from biodata
//                           style:
//                               const TextStyle(color: Colors.red, fontSize: 18),
//                         ),
//                       ),
//                     // Add more fields as necessary
//                   ],
//                 ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../request/education_details_api.dart';
import 'AllDetailsPage.dart';
import 'biodata_preview_page.dart';

class TemplateDetailPage extends StatefulWidget {
  final String selectedTemplateUrl; // URL of the selected template
  final String biodataId; // ID to fetch the biodata

  const TemplateDetailPage({
    Key? key,
    required this.selectedTemplateUrl,
    required this.biodataId,
  }) : super(key: key);

  @override
  _TemplateDetailPageState createState() => _TemplateDetailPageState();
}

class _TemplateDetailPageState extends State<TemplateDetailPage> {
  Map<String, dynamic>? biodataDetails;
  bool isLoading = true;
  String? errorMessage;
  GlobalKey _globalKey = GlobalKey(); // Key to capture the widget as an image

  @override
  void initState() {
    super.initState();

    print("bio data is is==========${widget.biodataId}");
    fetchBiodataDetails();
  }

  Future<void> fetchBiodataDetails() async {
    try {
      // Fetching biodata using the provided biodataId
      final response = await http.get(
        Uri.parse(
            'https://techfluxsolutions.com/royal_maratha/api/users/showBiodataByBiodataId?biodata_id=${widget.biodataId}'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('API Response: $data'); // Debug print

        // Check if biodata is found
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

  String formatDate(String? date) {
    if (date == null) return ''; // Handle null case
    try {
      // Parse the incoming date in 'yyyy-MM-dd HH:mm:ss' format
      DateTime parsedDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(date);
      // Format it to 'dd-MM-yyyy' (e.g., 12-06-2000)
      return DateFormat('dd-MM-yyyy').format(parsedDate);
    } catch (e) {
      return date; // Return original date if parsing fails
    }
  }

  List<Widget> _buildAllFields(Map<String, String?> data) {
    List<Widget> widgets = [];
    int baseTop = 30; // Base top position
    int spacing = 15; // Spacing between each field

    // Create a widget for each key-value pair
    data.forEach(
      (key, value) {
        // Display "N/A" if the value is null or empty
        String displayValue = (value == null || value.isEmpty) ? "N/A" : value;

        // Create a Row for each key-value pair
        widgets.add(
          Positioned(
            top: baseTop + (widgets.length * spacing).toDouble(),
            left: 50,
            child: Container(
              width: MediaQuery.of(context).size.width - 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '$key:',
                      style: const TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ),
                  SizedBox(
                    width: 225,
                    child: Text(
                      displayValue,
                      style: const TextStyle(color: Colors.black, fontSize: 10),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        if (key == 'Annual Income') {
          widgets.add(
            Positioned(
              top: 240,
              left: 50,
              child: Text(
                "Family Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
        ;
      },
    );

    widgets.add(
      Positioned(
        top: 15,
        right: 50,
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            "assets/images/profile.png",
            height: 150,
            width: 150,
          ),
        ),
      ),
    );

    return widgets;
  }

  // Method to show dialog for photo shape options
  void _showPhotoShapeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Photo Shape'),
          backgroundColor: Colors.white, // Set background color to white
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildPhotoShapeOption(Icons.image, "Circle"),
                    _buildPhotoShapeOption(Icons.image, "Square"),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildPhotoShapeOption(Icons.image, "Round Square"),
                    _buildPhotoShapeOption(Icons.image, "No Image"),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Method to show dialog for photo size options
  void _showPhotoSizeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Photo Size'),
          backgroundColor: Colors.white, // Set background color to white
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildPhotoSizeOption("Small"),
                    _buildPhotoSizeOption("Medium"),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildPhotoSizeOption("Large"),
                    _buildPhotoSizeOption("No Size"),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Widget for displaying photo shape option
  Widget _buildPhotoShapeOption(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        // Handle selection (you can store the selected shape or perform an action)
        Navigator.pop(context); // Close dialog after selection
      },
      child: Column(
        children: [
          Icon(icon, size: 50), // Sample image icon
          Text(label), // Shape label
        ],
      ),
    );
  }

  // Widget for displaying photo size option
  Widget _buildPhotoSizeOption(String size) {
    return GestureDetector(
      onTap: () {
        // Handle selection (you can store the selected size or perform an action)
        Navigator.pop(context); // Close dialog after selection
      },
      child: Column(
        children: [
          Icon(Icons.image, size: 50), // Sample image icon
          Text(size), // Size label
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Template Details',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        backgroundColor: const Color(0xFFFF5507),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(child: Text(errorMessage!))
              : biodataDetails == null
                  ? const Center(
                      child: Text('No biodata found'),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          RepaintBoundary(
                            key: _globalKey,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              height: 500,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      NetworkImage(widget.selectedTemplateUrl),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top:
                                        5, // Adjust this value as needed to position it correctly
                                    left: 180,
                                    child: Text(
                                      "Biodata",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors
                                            .black, // Change this to your desired color
                                        fontSize:
                                            12, // Adjust font size as needed
                                      ),
                                      textAlign: TextAlign
                                          .center, // Center align the text
                                    ),
                                  ),
                                  Positioned(
                                    top:
                                        18, // Adjust this value as needed to position it correctly
                                    left: 50,
                                    child: Text(
                                      "Personal Details",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors
                                            .black, // Change this to your desired color
                                        fontSize:
                                            12, // Adjust font size as needed
                                      ),
                                      textAlign: TextAlign
                                          .center, // Center align the text
                                    ),
                                  ),
                                  ..._buildAllFields(
                                    {
                                      'Name': biodataDetails?['username'],
                                      'Caste': biodataDetails?['caste'],
                                      'Subcaste': biodataDetails?['subcaste'],
                                      'Birthdate': formatDate(
                                        biodataDetails?['birthdate'],
                                      ),
                                      'Birthtime': biodataDetails?['birthtime'],
                                      'Birthplace':
                                          biodataDetails?['birthplace'],
                                      'Height': biodataDetails?['height'],
                                      'Bloodgroup':
                                          biodataDetails?['blood_group'],
                                      'Mobile': biodataDetails?['mobile'],
                                      'Devak': biodataDetails?['gothra'],
                                      'Complexion':
                                          biodataDetails?['complexion'],
                                      'Education':
                                          biodataDetails?['education_level'],
                                      'Occupation':
                                          biodataDetails?['occupation'],
                                      'Annual Income':
                                          biodataDetails?['income'],
                                      'Fathers Name':
                                          biodataDetails?['father_name'],
                                      'Fathers Occu.':
                                          biodataDetails?['father_occupation'],
                                      'Mobile no': biodataDetails?['mobile'],
                                      'Mothers name':
                                          biodataDetails?['mother_name'],
                                      'Mothers occu.':
                                          biodataDetails?['mother_occupation'],
                                      'Total Brothers':
                                          biodataDetails?['no_of_brothers'],
                                      'Total Sisters':
                                          biodataDetails?['no_of_sisters'],
                                      'Relatives': biodataDetails?[
                                          'surname_of_relatives'],
                                      'Resi.Address':
                                          biodataDetails?['address'],
                                      'Native Place':
                                          biodataDetails?['native_taluka'],
                                      'Property': biodataDetails?['property'],
                                      'Expectations':
                                          biodataDetails?['expectations'],
                                    },
                                  ),
                                  // Display biodata fields dynamically
                                  ..._buildAllFields(
                                    {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Edit Biodata Button
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(
                                  color: Colors.orange,
                                  width: 2), // Set border color and width
                            ),
                            onPressed: () {
                              // Navigate to Edit Biodata Page
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => AllDetailsPage(),
                              //   ),
                              // );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllDetailsPage(),
                                ), // Ensure this class is valid
                              );
                            },
                            child: const Text(
                              'Edit Biodata',
                              style:
                                  TextStyle(color: Colors.black), // Text color
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Row for Photo Shape and Photo Size
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.orange),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: _showPhotoShapeDialog,
                                  child: Column(
                                    children: const [
                                      Icon(Icons.image,
                                          size: 50), // Sample image icon
                                      Text(
                                          "Select Photo Shape"), // Label for shape selection
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: _showPhotoSizeDialog,
                                  child: Column(
                                    children: const [
                                      Icon(Icons.image,
                                          size: 50), // Sample image icon
                                      Text(
                                          "Select Photo Size"), // Label for size selection
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          // OutlinedButton(
                          //   style: OutlinedButton.styleFrom(
                          //     backgroundColor: Colors.white,
                          //     side: const BorderSide(
                          //         color: Colors.orange,
                          //         width: 2), // Set border color and width
                          //   ),
                          //   onPressed: () {
                          //     // Navigate to Edit Biodata Page
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => BiodataPreviewPage(
                          //           // imagePath:
                          //           //     'YOUR_IMAGE_PATH_HERE', // Provide the user's image path
                          //           templateImage: widget
                          //               .selectedTemplateUrl, // Provide the selected template image URL
                          //         ),
                          //       ),
                          //     );
                          //   },
                          //   child: const Text(
                          //     'Create PDF',
                          //     style: TextStyle(
                          //       color: Colors.black,
                          //     ), // Text color
                          //   ),
                          // ),
                          // Modify the onPressed function for Create PDF button in TemplateDetailPage
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(
                                  color: Colors.orange,
                                  width: 2), // Set border color and width
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BiodataPreviewPage(
                                    templateImage: widget
                                        .selectedTemplateUrl, // Pass template image URL
                                    // Pass biodata details
                                    biodataId: EducationDetailsRequest()
                                        .newBiodataId
                                        .toString(),
                                  ),
                                ),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BiodataPreviewPage(
                                    templateImage: widget
                                        .selectedTemplateUrl, // Pass template image URL
                                    // Pass biodata details
                                    biodataId: EducationDetailsRequest()
                                        .newBiodataId
                                        .toString(),
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              'Create PDF',
                              style: TextStyle(
                                color: Colors.black,
                              ), // Text color
                            ),
                          ),
                        ],
                      ),
                    ),
    );
  }
}
