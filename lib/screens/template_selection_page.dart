// import 'dart:convert';

// import 'package:bio_data_maker/screens/template_detail_page.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class TemplateSelectionPage extends StatefulWidget {
//   // final String biodataId;
//   // TemplateSelectionPage({super.key, required this.biodataId});

//   @override
//   _TemplateSelectionPageState createState() => _TemplateSelectionPageState();
// }

// class _TemplateSelectionPageState extends State<TemplateSelectionPage> {
//   List<String> frames = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchTemplates();
//   }

//   Future<void> fetchTemplates() async {
//     try {
//       final response = await http.get(
//         Uri.parse(
//             'https://techfluxsolutions.com/royal_maratha/api/fetchAllThemes'),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         print('API Response: $data'); // Debug print

//         // Check if 'data' exists and if it contains a non-empty list
//         if (data['data'] != null &&
//             data['data'] is List &&
//             data['data'].isNotEmpty) {
//           setState(() {
//             // Use 'frame_image' key to get image URLs
//             frames = List<String>.from(
//                 data['data'].map((item) => item['frame_image']));
//             isLoading = false;
//           });
//         } else {
//           setState(() {
//             isLoading = false;
//           });
//           print('No templates found in response');
//         }
//       } else {
//         setState(() {
//           isLoading = false;
//         });
//         print('Failed to load templates: ${response.statusCode}');
//         print('Response body: ${response.body}');
//       }
//     } catch (error) {
//       setState(() {
//         isLoading = false;
//       });
//       print('Error: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Select Template',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: const Color(0xFFFF5507),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: isLoading
//           ? const Center(
//               child: CircularProgressIndicator()) // Show loader when loading
//           : Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16),
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 1,
//                   mainAxisSpacing: 15,
//                 ),
//                 itemCount: frames.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => TemplateDetailPage(
//                               selectedTemplateUrl: frames[
//                                   index], // Make sure you pass this correctly
//                               biodata: {} // If you have a biodata map, pass it here, or remove this if unnecessary
//                               ),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.white),
//                         image: DecorationImage(
//                           image: NetworkImage(
//                             frames[index],
//                           ), // Use NetworkImage for dynamic images
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:bio_data_maker/screens/template_detail_page.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class TemplateSelectionPage extends StatefulWidget {
//   @override
//   _TemplateSelectionPageState createState() => _TemplateSelectionPageState();
// }

// class _TemplateSelectionPageState extends State<TemplateSelectionPage> {
//   List<String> frames = [];
//   bool isLoading = true;
//   String? errorMessage; // Variable to store error messages

//   @override
//   void initState() {
//     super.initState();
//     fetchTemplates();
//   }

//   Future<void> fetchTemplates() async {
//     try {
//       final response = await http.get(
//         Uri.parse(
//             'https://techfluxsolutions.com/royal_maratha/api/fetchAllThemes'),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         print('API Response: $data'); // Debug print

//         // Check if 'data' exists and if it contains a non-empty list
//         if (data['data'] != null &&
//             data['data'] is List &&
//             data['data'].isNotEmpty) {
//           setState(() {
//             frames = List<String>.from(
//                 data['data'].map((item) => item['frame_image']));
//             isLoading = false;
//             errorMessage = null; // Reset error message
//           });
//         } else {
//           setState(() {
//             isLoading = false;
//             errorMessage = 'No templates found'; // Set error message
//           });
//           print('No templates found in response');
//         }
//       } else {
//         setState(() {
//           isLoading = false;
//           errorMessage =
//               'Failed to load templates: ${response.statusCode}'; // Set error message
//         });
//         print('Failed to load templates: ${response.statusCode}');
//         print('Response body: ${response.body}');
//       }
//     } catch (error) {
//       setState(() {
//         isLoading = false;
//         errorMessage = 'Error: $error'; // Set error message
//       });
//       print('Error: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Select Template',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: const Color(0xFFFF5507),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: isLoading
//           ? const Center(
//               child: CircularProgressIndicator()) // Show loader when loading
//           : errorMessage != null
//               ? Center(
//                   child: Text(errorMessage!)) // Show error message if exists
//               : Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   child: GridView.builder(
//                     shrinkWrap: true,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 1,
//                       mainAxisSpacing: 15,
//                     ),
//                     itemCount: frames.length,
//                     itemBuilder: (context, index) {
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => TemplateDetailPage(
//                                 selectedTemplateUrl: frames[index],
//                                 biodataId: '', // Pass selected template URL
//                                 // Pass biodata if available
//                               ),
//                             ),
//                           );
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.white),
//                           ),
//                           child: Image.network(
//                             frames[index],
//                             fit: BoxFit.cover,
//                             loadingBuilder: (context, child, loadingProgress) {
//                               if (loadingProgress == null) return child;
//                               return Center(
//                                 child: CircularProgressIndicator(
//                                   value: loadingProgress.expectedTotalBytes !=
//                                           null
//                                       ? loadingProgress.cumulativeBytesLoaded /
//                                           (loadingProgress.expectedTotalBytes ??
//                                               1)
//                                       : null,
//                                 ),
//                               );
//                             },
//                             errorBuilder: (context, error, stackTrace) {
//                               return Center(
//                                   child: Icon(Icons
//                                       .error)); // Show error icon if image fails to load
//                             },
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'template_detail_page.dart';

class TemplateSelectionPage extends StatefulWidget {
  final String id;
  @override
  TemplateSelectionPage({Key? key, required this.id}) : super(key: key);

  @override
  _TemplateSelectionPageState createState() => _TemplateSelectionPageState();
}

class _TemplateSelectionPageState extends State<TemplateSelectionPage> {
  List<Map<String, dynamic>> frames = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchTemplates();
  }

  Future<void> fetchTemplates() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://techfluxsolutions.com/royal_maratha/api/fetchAllThemes'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('API Response: $data');

        if (data['data'] != null &&
            data['data'] is List &&
            data['data'].isNotEmpty) {
          setState(() {
            frames = List<Map<String, dynamic>>.from(
              data['data'].map((item) => {
                    'frame_image': item['frame_image'],
                    'id': item['id'], // Use 'id' as biodataId
                  }),
            );
            isLoading = false;
            errorMessage = null;
          });
        } else {
          setState(() {
            isLoading = false;
            errorMessage = 'No templates found';
          });
          print('No templates found in response');
        }
      } else {
        setState(() {
          isLoading = false;
          errorMessage = 'Failed to load templates: ${response.statusCode}';
        });
        print('Failed to load templates: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
        errorMessage = 'Error: $error';
      });
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context); // Ensure proper back navigation
        return true; // Indicate the back button has been handled
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Select Template',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xFFFF5507),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context); // Pop the current screen
            },
          ),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : errorMessage != null
                ? Center(child: Text(errorMessage!))
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 15,
                              childAspectRatio: 3 / 4),
                      itemCount: frames.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TemplateDetailPage(
                                  selectedTemplateUrl:
                                      frames[index]['frame_image'].toString(),
                                  biodataId: widget.id, // Pass dynamic id
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                            ),
                            child: Image.network(
                              frames[index]['frame_image'].toString(),
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            (loadingProgress
                                                    .expectedTotalBytes ??
                                                1)
                                        : null,
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Center(child: Icon(Icons.error));
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
      ),
    );
  }
}
