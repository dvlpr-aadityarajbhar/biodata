// import 'dart:convert';

// import 'package:bio_data_maker/controller/showbiodata_controller.dart';
// import 'package:bio_data_maker/screens/AllDetailsPage.dart';
// import 'package:bio_data_maker/screens/login_form.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:path/path.dart';
// import 'package:provider/provider.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   String? _authToken;

//   // List of available languages
//   // final List<String> _languages = [
//   //   'English',
//   //   'Hindi',
//   //   'Bengali',
//   //   'Gujarati',
//   //   'Kannada',
//   //   'Marathi'
//   // ];
//   String _selectedLanguage = 'English';

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 6, vsync: this);
//     // _fetchBiodataInfo();
//     // print("Hellllllooo");
//     // _test();
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   void _handleMenuItemClick(String value) {
//     switch (value) {
//       case 'share':
//         _shareApp();
//         // Handle share app action
//         break;
//       case 'products':
//         // Handle our products action
//         break;
//       case 'delete':
//         _showDeleteAccountConfirmation(context);
//         break;
//       case 'logout':
//         _handleLogout(context);
//         break;
//     }
//   }

//   Future<void> logout(context) async {
//     // Access the SharedPreferences instance
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     // Clear the 'tokenKey' and 'isLoggedIn' fields
//     await prefs.remove('token_key'); // Remove the token
//     await prefs.setBool('isLoggedIn', false); // Set isLoggedIn to false

//     // Navigate back to the login page
//     Navigator.of(context).pushReplacementNamed('/login');
//   }

//   void _shareApp() {
//     const String appLink = 'https://Instagram.com';
//     const String message = 'Check out this awesome app: $appLink';
//     Share.share(message);
//   }

//   void _showDeleteAccountConfirmation(context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Delete Account'),
//           content: const Text(
//               'Are you sure you want to delete your account? This action cannot be undone.'),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: const Text('Delete'),
//               onPressed: () async {
//                 Navigator.of(context).pop();
//                 await _deleteAccount(context);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> _deleteAccount(context) async {
//     final url = Uri.parse(
//         'https://techfluxsolutions.com/royal_maratha/api/users/delete');

//     try {
//       final response = await http.delete(
//         url,
//         headers: {'Authorization': 'Bearer $_authToken'},
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);

//         // Ensure 'success' is a boolean and handle null values
//         bool success = data['success'] ?? false;

//         if (success) {
//           // Clear SharedPreferences and navigate to login
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           await prefs.clear();
//           Navigator.of(context).pushReplacementNamed('/login');
//         } else {
//           // Handle failure case with a message if available
//           String message = data['message'] ?? 'Failed to delete account';
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(message)),
//           );
//         }
//       } else {
//         // Handle HTTP error
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content:
//                   Text('Failed to delete account: ${response.statusCode}')),
//         );
//       }
//     } catch (e) {
//       print('Error deleting account: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text('An error occurred while deleting account')),
//       );
//     }
//   }

//   void _handleLogout(context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     await prefs.remove('token');
//     await prefs.remove('matri_id');
//     await prefs.setBool('isLoggedIn', false);

//     Navigator.of(context).pushAndRemoveUntil(
//       MaterialPageRoute(
//           builder: (context) => LoginForm(
//                 onLoginSuccess: () {},
//               )),
//       (Route<dynamic> route) => false,
//     );
//   }

//   void _test() {
//     print(
//         "hjgddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
//     return;
//   }

//   // Future<void> _getSharedPreferences() async {
//   //   try {
//   //     SharedPreferences prefs = await SharedPreferences.getInstance();

//   //     final authToken = prefs.getString('token_key');
//   //     final matriId = prefs.getString('matriId');

//   //     setState(() {
//   //       _authToken = authToken;
//   //       _matriId = matriId;
//   //     });
//   //   } catch (e) {
//   //     print('Error retrieving SharedPreferences: $e');
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Biodata Maker',
//           style: TextStyle(
//             fontSize: 26.0,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         backgroundColor: const Color(0xFFFF5508),
//         automaticallyImplyLeading: false,
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: _handleMenuItemClick,
//             itemBuilder: (BuildContext context) {
//               return [
//                 const PopupMenuItem(
//                   value: 'languages',
//                   child: Text('Languages'),
//                 ),
//                 const PopupMenuItem(
//                   value: 'share',
//                   child: Text('Share App'),
//                 ),
//                 const PopupMenuItem(
//                   value: 'Rate App',
//                   child: Text('Rate App'),
//                 ),
//                 const PopupMenuItem(
//                   value: 'Feedback',
//                   child: Text('Feedback'),
//                 ),
//                 const PopupMenuItem(
//                   value: 'Privacy Policy',
//                   child: Text('Privacy Policy'),
//                 ),
//                 const PopupMenuItem(
//                   value: 'Customer Care',
//                   child: Text('Customer Care'),
//                 ),
//                 const PopupMenuItem(
//                   value: 'delete',
//                   child: Text('Delete Account'),
//                 ),
//                 const PopupMenuItem(
//                   value: 'logout',
//                   child: Text('Logout'),
//                 ),
//               ];
//             },
//             icon: const Icon(Icons.menu, color: Colors.white),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             const SizedBox(height: 8),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 2,
//                     blurRadius: 5,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => AllDetailsPage()),
//                       );
//                     },
//                     icon: const Icon(Icons.brush),
//                     label: const Text('Create Biodata'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFFFF5507),
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       setState(() {
//                         // _showBannerImage = false;
//                       });
//                     },
//                     icon: const Icon(Icons.add),
//                     label: const Text('Add Sample'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFFFF5507),
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 15),
//             _buildBiodataCard(),

//             // ElevatedButton(
//             //   onPressed: () {
//             //     Navigator.push(
//             //       context,
//             //       MaterialPageRoute(
//             //         builder: (context) => PaymentScreen(),
//             //       ),
//             //     );
//             //   },
//             //   child: Text("payment"),
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget _buildBiodataCard() {
//   Map<String, dynamic> dummyAccount = {
//     'profile_photo': 'https://example.com/dummy_photo.jpeg', // Dummy image URL
//     'firstname':,
//     'lastname': 'Doe',
//     'caste': 'Maratha',
//     'dob': '01-01-1990',
//   };

//   return Consumer<ShowbiodataController>(
//     builder: (context,controller,_) {
//       return Card(
//         elevation: 5,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ListTile(
//                 leading: CircleAvatar(
//                   backgroundImage: NetworkImage(
//                       dummyAccount['profile_photo'] ?? 'assets/images/dummy.jpeg'),
//                   radius: 30,
//                 ),
//                 title: Text(
//                   '${dummyAccount['firstname']} ${dummyAccount['lastname']}',
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 subtitle: Text(
//                     'Caste: ${dummyAccount['caste']} DOB: ${dummyAccount['dob']}'),
//                 trailing: ElevatedButton(
//                   onPressed: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(builder: (context) => AllDetailsPage()),
//                     // );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     // foregroundColor: AppTheme.primaryColor(0xFFb27409),
//                     // side: const BorderSide(color: Color(0xFFb27409)),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   child: const Text('Edit'),
//                 ),
//               ),
//               const Divider(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   _buildBioOptionButton(Icons.edit, 'Edit', () {
//                     // Navigate to edit page
//                   }),
//                   _buildBioOptionButton(Icons.copy, 'Copy', () {
//                     // Implement copy functionality
//                   }),
//                   _buildBioOptionButton(Icons.delete, 'Delete', () {
//                     // Implement delete functionality
//                   }),
//                   _buildBioOptionButton(Icons.file_copy, 'Template', () {
//                     // Implement template change functionality
//                   }),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   );
// }

// Widget _buildBioOptionButton(
//     IconData icon, String label, VoidCallback onPressed) {
//   return Column(
//     children: [
//       IconButton(
//         icon: Icon(icon, color: Colors.grey[700]),
//         onPressed: onPressed,
//       ),
//       Text(label, style: TextStyle(color: Colors.grey[700])),
//     ],
//   );
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/showbiodata_controller.dart';
import '../AllDetailsPage.dart';
import '../login_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? _authToken;

  String _selectedLanguage = 'English';

  Future<void> _getMatriIdAndFetchBiodata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? matriId =
        prefs.getString('matri_id'); // Assuming 'matri_id' is stored

    if (matriId != null) {
      await _fetchBiodataInfo(matriId);
    } else {
      // Handle the case where matriId is null
      // You could display an error message or perform some other action
      print('matriId is null. Unable to fetch biodata.');
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _getAuthToken();
    _getMatriIdAndFetchBiodata();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _authToken = prefs.getString('token_key');
    });
  }

  Future<void> _fetchBiodataInfo(String matriId) async {
    final controller =
        Provider.of<ShowbiodataController>(context, listen: false);
    // Call the method to fetch biodata here
    await controller.fetchBiodata(); // Pass necessary parameters if needed
  }

  void _handleMenuItemClick(String value) {
    switch (value) {
      case 'share':
        _shareApp();
        break;
      case 'RateApp':
        _shareApp();
        break;
      case 'delete':
        _showDeleteAccountConfirmation(context);
        break;
      case 'logout':
        _handleLogout(context);
        break;
    }
  }

  _rateApp() {}

  Future<void> _handleLogout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token_key');
    await prefs.remove('matri_id');
    await prefs.setBool('isLoggedIn', false);
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginForm(onLoginSuccess: () {})),
      (Route<dynamic> route) => false,
    );
  }

  void _shareApp() {
    const String appLink = 'https://Instagram.com';
    const String message = 'Check out this awesome app: $appLink';
    Share.share(message);
  }

  void _showDeleteAccountConfirmation(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text(
              'Are you sure you want to delete your account? This action cannot be undone.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                Navigator.of(context).pop();
                await _deleteAccount(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteAccount(context) async {
    final url = Uri.parse(
        'https://techfluxsolutions.com/royal_maratha/api/users/delete');

    try {
      final response = await http.delete(
        url,
        headers: {'Authorization': 'Bearer $_authToken'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        bool success = data['success'] ?? false;

        if (success) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.clear();
          Navigator.of(context).pushReplacementNamed('/login');
        } else {
          String message = data['message'] ?? 'Failed to delete account';
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Failed to delete account: ${response.statusCode}')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('An error occurred while deleting account')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Biodata Maker',
          style: TextStyle(
              fontSize: 26.0, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color(0xFFFF5508),
        actions: [
          PopupMenuButton<String>(
            color: Colors.white,
            onSelected: _handleMenuItemClick,
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(value: 'share', child: Text('Share App')),
                const PopupMenuItem(value: 'RateApp', child: Text('Rate App')),
                const PopupMenuItem(
                    value: 'delete', child: Text('Delete Account')),
                const PopupMenuItem(value: 'logout', child: Text('Logout')),
              ];
            },
            icon: const Icon(Icons.menu, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          // Wrap the entire content in SingleChildScrollView
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align content to the start
            children: <Widget>[
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllDetailsPage()),
                        );
                      },
                      icon: const Icon(Icons.brush,
                          size: 18), // Decrease icon size
                      label: const Text(
                        'Create Biodata',
                        style: TextStyle(fontSize: 14), // Reduce font size
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 10), // Reduce padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8), // Adjust border radius if needed
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Add sample functionality here
                      },
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text(
                        'Add Sample',
                        style: TextStyle(fontSize: 14),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF5507),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Consumer<ShowbiodataController>(
                builder: (context, controller, _) {
                  // Show loading indicator while data is being fetched
                  if (controller.loading) {
                    return const Center(
                      child: CircularProgressIndicator(), // Loading indicator
                    );
                  }

                  // Check if userData or data is null
                  if (controller.userData == null ||
                      controller.userData!['data'] == null ||
                      controller.userData!['data'].isEmpty) {
                    return const Center(
                      child: Text('No data available'),
                    );
                  }

                  // Show ListView if data is available
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap:
                        true, // Ensure the ListView does not take infinite height
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable scrolling for the ListView
                    itemCount: controller.userData!['data'].length,
                    itemBuilder: (context, index) {
                      // Extract the individual biodata from the list
                      final biodata = controller.userData!['data'][index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _buildBiodataCard(context, biodata),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildBiodataCard(BuildContext context, Map<String, dynamic> biodata) {
  return Card(
    color: Colors.white,
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 4.0, horizontal: 8.0), // Adjusted padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              // backgroundImage: biodata['photo1'] != null &&
              //         biodata['photo1'].isNotEmpty
              //     ? NetworkImage(
              //         biodata['photo1']) // Load from network if available
              //     : AssetImage(
              //         'assets/images/sample_image.jpg'), // Load from assets if not
              radius: 30,
            ),
            title: Text(
              '${biodata['username'] ?? 'John'}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Caste: ${biodata['caste'] ?? 'Maratha'} \nHeight: ${biodata['dob'] ?? '01-01-1990'}',
            ),
          ),
          // Remove Divider and add grey background to the row
          Container(
            color: Colors.grey[200], // Set the background color for the row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBioOptionButton(Icons.edit, 'Edit', () {
                  // Navigate to edit page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllDetailsPage(),
                    ),
                  );
                }),
                _buildBioOptionButton(Icons.copy, 'Copy', () {
                  // Implement copy functionality
                }),
                _buildBioOptionButton(Icons.delete, 'Delete', () {
                  // Implement delete functionality
                }),
                _buildBioOptionButton(Icons.file_copy, 'Template', () {
                  // Implement template change functionality
                }),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildBioOptionButton(
    IconData icon, String label, VoidCallback onPressed) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[200], // Set the background color to a light grey
      borderRadius:
          BorderRadius.circular(8), // Add border radius for rounded corners
    ),
    child: Column(
      children: [
        IconButton(
          icon: Icon(icon, color: Colors.grey[700]),
          onPressed: onPressed,
        ),
        Text(label, style: TextStyle(color: Colors.grey[700])),
      ],
    ),
  );
}
