// // // // // // // // // import 'dart:convert';

// // // // // // // // // import 'package:bio_data_maker/controller/showbiodata_controller.dart';
// // // // // // // // // import 'package:bio_data_maker/screens/AllDetailsPage.dart';
// // // // // // // // // import 'package:bio_data_maker/screens/login_form.dart';
// // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // import 'package:http/http.dart' as http;
// // // // // // // // // import 'package:path/path.dart';
// // // // // // // // // import 'package:provider/provider.dart';
// // // // // // // // // import 'package:share_plus/share_plus.dart';
// // // // // // // // // import 'package:shared_preferences/shared_preferences.dart';

// // // // // // // // // class HomePage extends StatefulWidget {
// // // // // // // // //   const HomePage({super.key});

// // // // // // // // //   @override
// // // // // // // // //   _HomePageState createState() => _HomePageState();
// // // // // // // // // }

// // // // // // // // // class _HomePageState extends State<HomePage>
// // // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // // //   late TabController _tabController;
// // // // // // // // //   String? _authToken;

// // // // // // // // //   // List of available languages
// // // // // // // // //   // final List<String> _languages = [
// // // // // // // // //   //   'English',
// // // // // // // // //   //   'Hindi',
// // // // // // // // //   //   'Bengali',
// // // // // // // // //   //   'Gujarati',
// // // // // // // // //   //   'Kannada',
// // // // // // // // //   //   'Marathi'
// // // // // // // // //   // ];
// // // // // // // // //   String _selectedLanguage = 'English';

// // // // // // // // //   @override
// // // // // // // // //   void initState() {
// // // // // // // // //     super.initState();
// // // // // // // // //     _tabController = TabController(length: 6, vsync: this);
// // // // // // // // //     // _fetchBiodataInfo();
// // // // // // // // //     // print("Hellllllooo");
// // // // // // // // //     // _test();
// // // // // // // // //   }

// // // // // // // // //   @override
// // // // // // // // //   void dispose() {
// // // // // // // // //     _tabController.dispose();
// // // // // // // // //     super.dispose();
// // // // // // // // //   }

// // // // // // // // //   void _handleMenuItemClick(String value) {
// // // // // // // // //     switch (value) {
// // // // // // // // //       case 'share':
// // // // // // // // //         _shareApp();
// // // // // // // // //         // Handle share app action
// // // // // // // // //         break;
// // // // // // // // //       case 'products':
// // // // // // // // //         // Handle our products action
// // // // // // // // //         break;
// // // // // // // // //       case 'delete':
// // // // // // // // //         _showDeleteAccountConfirmation(context);
// // // // // // // // //         break;
// // // // // // // // //       case 'logout':
// // // // // // // // //         _handleLogout(context);
// // // // // // // // //         break;
// // // // // // // // //     }
// // // // // // // // //   }

// // // // // // // // //   Future<void> logout(context) async {
// // // // // // // // //     // Access the SharedPreferences instance
// // // // // // // // //     SharedPreferences prefs = await SharedPreferences.getInstance();

// // // // // // // // //     // Clear the 'tokenKey' and 'isLoggedIn' fields
// // // // // // // // //     await prefs.remove('token_key'); // Remove the token
// // // // // // // // //     await prefs.setBool('isLoggedIn', false); // Set isLoggedIn to false

// // // // // // // // //     // Navigate back to the login page
// // // // // // // // //     Navigator.of(context).pushReplacementNamed('/login');
// // // // // // // // //   }

// // // // // // // // //   void _shareApp() {
// // // // // // // // //     const String appLink = 'https://Instagram.com';
// // // // // // // // //     const String message = 'Check out this awesome app: $appLink';
// // // // // // // // //     Share.share(message);
// // // // // // // // //   }

// // // // // // // // //   void _showDeleteAccountConfirmation(context) {
// // // // // // // // //     showDialog(
// // // // // // // // //       context: context,
// // // // // // // // //       builder: (BuildContext context) {
// // // // // // // // //         return AlertDialog(
// // // // // // // // //           title: const Text('Delete Account'),
// // // // // // // // //           content: const Text(
// // // // // // // // //               'Are you sure you want to delete your account? This action cannot be undone.'),
// // // // // // // // //           actions: <Widget>[
// // // // // // // // //             TextButton(
// // // // // // // // //               child: const Text('Cancel'),
// // // // // // // // //               onPressed: () {
// // // // // // // // //                 Navigator.of(context).pop();
// // // // // // // // //               },
// // // // // // // // //             ),
// // // // // // // // //             TextButton(
// // // // // // // // //               child: const Text('Delete'),
// // // // // // // // //               onPressed: () async {
// // // // // // // // //                 Navigator.of(context).pop();
// // // // // // // // //                 await _deleteAccount(context);
// // // // // // // // //               },
// // // // // // // // //             ),
// // // // // // // // //           ],
// // // // // // // // //         );
// // // // // // // // //       },
// // // // // // // // //     );
// // // // // // // // //   }

// // // // // // // // //   Future<void> _deleteAccount(context) async {
// // // // // // // // //     final url = Uri.parse(
// // // // // // // // //         'https://techfluxsolutions.com/royal_maratha/api/users/delete');

// // // // // // // // //     try {
// // // // // // // // //       final response = await http.delete(
// // // // // // // // //         url,
// // // // // // // // //         headers: {'Authorization': 'Bearer $_authToken'},
// // // // // // // // //       );

// // // // // // // // //       if (response.statusCode == 200) {
// // // // // // // // //         final data = json.decode(response.body);

// // // // // // // // //         // Ensure 'success' is a boolean and handle null values
// // // // // // // // //         bool success = data['success'] ?? false;

// // // // // // // // //         if (success) {
// // // // // // // // //           // Clear SharedPreferences and navigate to login
// // // // // // // // //           SharedPreferences prefs = await SharedPreferences.getInstance();
// // // // // // // // //           await prefs.clear();
// // // // // // // // //           Navigator.of(context).pushReplacementNamed('/login');
// // // // // // // // //         } else {
// // // // // // // // //           // Handle failure case with a message if available
// // // // // // // // //           String message = data['message'] ?? 'Failed to delete account';
// // // // // // // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // // // // // // //             SnackBar(content: Text(message)),
// // // // // // // // //           );
// // // // // // // // //         }
// // // // // // // // //       } else {
// // // // // // // // //         // Handle HTTP error
// // // // // // // // //         ScaffoldMessenger.of(context).showSnackBar(
// // // // // // // // //           SnackBar(
// // // // // // // // //               content:
// // // // // // // // //                   Text('Failed to delete account: ${response.statusCode}')),
// // // // // // // // //         );
// // // // // // // // //       }
// // // // // // // // //     } catch (e) {
// // // // // // // // //       print('Error deleting account: $e');
// // // // // // // // //       ScaffoldMessenger.of(context).showSnackBar(
// // // // // // // // //         const SnackBar(
// // // // // // // // //             content: Text('An error occurred while deleting account')),
// // // // // // // // //       );
// // // // // // // // //     }
// // // // // // // // //   }

// // // // // // // // //   void _handleLogout(context) async {
// // // // // // // // //     SharedPreferences prefs = await SharedPreferences.getInstance();

// // // // // // // // //     await prefs.remove('token');
// // // // // // // // //     await prefs.remove('matri_id');
// // // // // // // // //     await prefs.setBool('isLoggedIn', false);

// // // // // // // // //     Navigator.of(context).pushAndRemoveUntil(
// // // // // // // // //       MaterialPageRoute(
// // // // // // // // //           builder: (context) => LoginForm(
// // // // // // // // //                 onLoginSuccess: () {},
// // // // // // // // //               )),
// // // // // // // // //       (Route<dynamic> route) => false,
// // // // // // // // //     );
// // // // // // // // //   }

// // // // // // // // //   void _test() {
// // // // // // // // //     print(
// // // // // // // // //         "hjgddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
// // // // // // // // //     return;
// // // // // // // // //   }

// // // // // // // // //   // Future<void> _getSharedPreferences() async {
// // // // // // // // //   //   try {
// // // // // // // // //   //     SharedPreferences prefs = await SharedPreferences.getInstance();

// // // // // // // // //   //     final authToken = prefs.getString('token_key');
// // // // // // // // //   //     final matriId = prefs.getString('matriId');

// // // // // // // // //   //     setState(() {
// // // // // // // // //   //       _authToken = authToken;
// // // // // // // // //   //       _matriId = matriId;
// // // // // // // // //   //     });
// // // // // // // // //   //   } catch (e) {
// // // // // // // // //   //     print('Error retrieving SharedPreferences: $e');
// // // // // // // // //   //   }
// // // // // // // // //   // }

// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     return Scaffold(
// // // // // // // // //       appBar: AppBar(
// // // // // // // // //         title: const Text(
// // // // // // // // //           'Biodata Maker',
// // // // // // // // //           style: TextStyle(
// // // // // // // // //             fontSize: 26.0,
// // // // // // // // //             fontWeight: FontWeight.bold,
// // // // // // // // //             color: Colors.white,
// // // // // // // // //           ),
// // // // // // // // //           textAlign: TextAlign.center,
// // // // // // // // //         ),
// // // // // // // // //         backgroundColor: const Color(0xFFFF5508),
// // // // // // // // //         automaticallyImplyLeading: false,
// // // // // // // // //         actions: [
// // // // // // // // //           PopupMenuButton<String>(
// // // // // // // // //             onSelected: _handleMenuItemClick,
// // // // // // // // //             itemBuilder: (BuildContext context) {
// // // // // // // // //               return [
// // // // // // // // //                 const PopupMenuItem(
// // // // // // // // //                   value: 'languages',
// // // // // // // // //                   child: Text('Languages'),
// // // // // // // // //                 ),
// // // // // // // // //                 const PopupMenuItem(
// // // // // // // // //                   value: 'share',
// // // // // // // // //                   child: Text('Share App'),
// // // // // // // // //                 ),
// // // // // // // // //                 const PopupMenuItem(
// // // // // // // // //                   value: 'Rate App',
// // // // // // // // //                   child: Text('Rate App'),
// // // // // // // // //                 ),
// // // // // // // // //                 const PopupMenuItem(
// // // // // // // // //                   value: 'Feedback',
// // // // // // // // //                   child: Text('Feedback'),
// // // // // // // // //                 ),
// // // // // // // // //                 const PopupMenuItem(
// // // // // // // // //                   value: 'Privacy Policy',
// // // // // // // // //                   child: Text('Privacy Policy'),
// // // // // // // // //                 ),
// // // // // // // // //                 const PopupMenuItem(
// // // // // // // // //                   value: 'Customer Care',
// // // // // // // // //                   child: Text('Customer Care'),
// // // // // // // // //                 ),
// // // // // // // // //                 const PopupMenuItem(
// // // // // // // // //                   value: 'delete',
// // // // // // // // //                   child: Text('Delete Account'),
// // // // // // // // //                 ),
// // // // // // // // //                 const PopupMenuItem(
// // // // // // // // //                   value: 'logout',
// // // // // // // // //                   child: Text('Logout'),
// // // // // // // // //                 ),
// // // // // // // // //               ];
// // // // // // // // //             },
// // // // // // // // //             icon: const Icon(Icons.menu, color: Colors.white),
// // // // // // // // //           ),
// // // // // // // // //         ],
// // // // // // // // //       ),
// // // // // // // // //       body: Padding(
// // // // // // // // //         padding: const EdgeInsets.all(16.0),
// // // // // // // // //         child: Column(
// // // // // // // // //           mainAxisAlignment: MainAxisAlignment.start,
// // // // // // // // //           children: <Widget>[
// // // // // // // // //             const SizedBox(height: 8),
// // // // // // // // //             Container(
// // // // // // // // //               decoration: BoxDecoration(
// // // // // // // // //                 color: Colors.white,
// // // // // // // // //                 borderRadius: BorderRadius.circular(15),
// // // // // // // // //                 boxShadow: [
// // // // // // // // //                   BoxShadow(
// // // // // // // // //                     color: Colors.grey.withOpacity(0.5),
// // // // // // // // //                     spreadRadius: 2,
// // // // // // // // //                     blurRadius: 5,
// // // // // // // // //                     offset: const Offset(0, 3),
// // // // // // // // //                   ),
// // // // // // // // //                 ],
// // // // // // // // //               ),
// // // // // // // // //               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
// // // // // // // // //               child: Row(
// // // // // // // // //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // // // // // //                 children: [
// // // // // // // // //                   ElevatedButton.icon(
// // // // // // // // //                     onPressed: () {
// // // // // // // // //                       Navigator.push(
// // // // // // // // //                         context,
// // // // // // // // //                         MaterialPageRoute(
// // // // // // // // //                             builder: (context) => AllDetailsPage()),
// // // // // // // // //                       );
// // // // // // // // //                     },
// // // // // // // // //                     icon: const Icon(Icons.brush),
// // // // // // // // //                     label: const Text('Create Biodata'),
// // // // // // // // //                     style: ElevatedButton.styleFrom(
// // // // // // // // //                       backgroundColor: const Color(0xFFFF5507),
// // // // // // // // //                       foregroundColor: Colors.white,
// // // // // // // // //                       padding: const EdgeInsets.symmetric(
// // // // // // // // //                           horizontal: 10, vertical: 15),
// // // // // // // // //                       shape: RoundedRectangleBorder(
// // // // // // // // //                         borderRadius: BorderRadius.circular(10),
// // // // // // // // //                       ),
// // // // // // // // //                     ),
// // // // // // // // //                   ),
// // // // // // // // //                   ElevatedButton.icon(
// // // // // // // // //                     onPressed: () {
// // // // // // // // //                       setState(() {
// // // // // // // // //                         // _showBannerImage = false;
// // // // // // // // //                       });
// // // // // // // // //                     },
// // // // // // // // //                     icon: const Icon(Icons.add),
// // // // // // // // //                     label: const Text('Add Sample'),
// // // // // // // // //                     style: ElevatedButton.styleFrom(
// // // // // // // // //                       backgroundColor: const Color(0xFFFF5507),
// // // // // // // // //                       foregroundColor: Colors.white,
// // // // // // // // //                       padding: const EdgeInsets.symmetric(
// // // // // // // // //                           horizontal: 10, vertical: 15),
// // // // // // // // //                       shape: RoundedRectangleBorder(
// // // // // // // // //                         borderRadius: BorderRadius.circular(10),
// // // // // // // // //                       ),
// // // // // // // // //                     ),
// // // // // // // // //                   ),
// // // // // // // // //                 ],
// // // // // // // // //               ),
// // // // // // // // //             ),
// // // // // // // // //             SizedBox(height: 15),
// // // // // // // // //             _buildBiodataCard(),

// // // // // // // // //             // ElevatedButton(
// // // // // // // // //             //   onPressed: () {
// // // // // // // // //             //     Navigator.push(
// // // // // // // // //             //       context,
// // // // // // // // //             //       MaterialPageRoute(
// // // // // // // // //             //         builder: (context) => PaymentScreen(),
// // // // // // // // //             //       ),
// // // // // // // // //             //     );
// // // // // // // // //             //   },
// // // // // // // // //             //   child: Text("payment"),
// // // // // // // // //             // )
// // // // // // // // //           ],
// // // // // // // // //         ),
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // // }

// // // // // // // // // Widget _buildBiodataCard() {
// // // // // // // // //   Map<String, dynamic> dummyAccount = {
// // // // // // // // //     'profile_photo': 'https://example.com/dummy_photo.jpeg', // Dummy image URL
// // // // // // // // //     'firstname':,
// // // // // // // // //     'lastname': 'Doe',
// // // // // // // // //     'caste': 'Maratha',
// // // // // // // // //     'dob': '01-01-1990',
// // // // // // // // //   };

// // // // // // // // //   return Consumer<ShowbiodataController>(
// // // // // // // // //     builder: (context,controller,_) {
// // // // // // // // //       return Card(
// // // // // // // // //         elevation: 5,
// // // // // // // // //         shape: RoundedRectangleBorder(
// // // // // // // // //           borderRadius: BorderRadius.circular(10),
// // // // // // // // //         ),
// // // // // // // // //         child: Padding(
// // // // // // // // //           padding: const EdgeInsets.all(8.0),
// // // // // // // // //           child: Column(
// // // // // // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // // //             children: [
// // // // // // // // //               ListTile(
// // // // // // // // //                 leading: CircleAvatar(
// // // // // // // // //                   backgroundImage: NetworkImage(
// // // // // // // // //                       dummyAccount['profile_photo'] ?? 'assets/images/dummy.jpeg'),
// // // // // // // // //                   radius: 30,
// // // // // // // // //                 ),
// // // // // // // // //                 title: Text(
// // // // // // // // //                   '${dummyAccount['firstname']} ${dummyAccount['lastname']}',
// // // // // // // // //                   style: const TextStyle(fontWeight: FontWeight.bold),
// // // // // // // // //                 ),
// // // // // // // // //                 subtitle: Text(
// // // // // // // // //                     'Caste: ${dummyAccount['caste']} DOB: ${dummyAccount['dob']}'),
// // // // // // // // //                 trailing: ElevatedButton(
// // // // // // // // //                   onPressed: () {
// // // // // // // // //                     // Navigator.push(
// // // // // // // // //                     //   context,
// // // // // // // // //                     //   MaterialPageRoute(builder: (context) => AllDetailsPage()),
// // // // // // // // //                     // );
// // // // // // // // //                   },
// // // // // // // // //                   style: ElevatedButton.styleFrom(
// // // // // // // // //                     backgroundColor: Colors.white,
// // // // // // // // //                     // foregroundColor: AppTheme.primaryColor(0xFFb27409),
// // // // // // // // //                     // side: const BorderSide(color: Color(0xFFb27409)),
// // // // // // // // //                     shape: RoundedRectangleBorder(
// // // // // // // // //                       borderRadius: BorderRadius.circular(20),
// // // // // // // // //                     ),
// // // // // // // // //                   ),
// // // // // // // // //                   child: const Text('Edit'),
// // // // // // // // //                 ),
// // // // // // // // //               ),
// // // // // // // // //               const Divider(),
// // // // // // // // //               Row(
// // // // // // // // //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // // // // // // //                 children: [
// // // // // // // // //                   _buildBioOptionButton(Icons.edit, 'Edit', () {
// // // // // // // // //                     // Navigate to edit page
// // // // // // // // //                   }),
// // // // // // // // //                   _buildBioOptionButton(Icons.copy, 'Copy', () {
// // // // // // // // //                     // Implement copy functionality
// // // // // // // // //                   }),
// // // // // // // // //                   _buildBioOptionButton(Icons.delete, 'Delete', () {
// // // // // // // // //                     // Implement delete functionality
// // // // // // // // //                   }),
// // // // // // // // //                   _buildBioOptionButton(Icons.file_copy, 'Template', () {
// // // // // // // // //                     // Implement template change functionality
// // // // // // // // //                   }),
// // // // // // // // //                 ],
// // // // // // // // //               ),
// // // // // // // // //             ],
// // // // // // // // //           ),
// // // // // // // // //         ),
// // // // // // // // //       );
// // // // // // // // //     }
// // // // // // // // //   );
// // // // // // // // // }

// // // // // // // // // Widget _buildBioOptionButton(
// // // // // // // // //     IconData icon, String label, VoidCallback onPressed) {
// // // // // // // // //   return Column(
// // // // // // // // //     children: [
// // // // // // // // //       IconButton(
// // // // // // // // //         icon: Icon(icon, color: Colors.grey[700]),
// // // // // // // // //         onPressed: onPressed,
// // // // // // // // //       ),
// // // // // // // // //       Text(label, style: TextStyle(color: Colors.grey[700])),
// // // // // // // // //     ],
// // // // // // // // //   );
// // // // // // // // // }

// // // // // // // // import 'dart:convert';

// // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // import 'package:http/http.dart' as http;
// // // // // // // // import 'package:provider/provider.dart';
// // // // // // // // import 'package:share_plus/share_plus.dart';
// // // // // // // // import 'package:shared_preferences/shared_preferences.dart';

// // // // // // // // import '../../controller/showbiodata_controller.dart';
// // // // // // // // import '../AllDetailsPage.dart';
// // // // // // // // import '../login_form.dart';

// // // // // // // // class HomePage extends StatefulWidget {
// // // // // // // //   const HomePage({super.key});

// // // // // // // //   @override
// // // // // // // //   _HomePageState createState() => _HomePageState();
// // // // // // // // }

// // // // // // // // class _HomePageState extends State<HomePage>
// // // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // // //   late TabController _tabController;
// // // // // // // //   String? _authToken;

// // // // // // // //   String _selectedLanguage = 'English';

// // // // // // // //   Future<void> _getMatriIdAndFetchBiodata() async {
// // // // // // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // // // // // //     String? matriId =
// // // // // // // //         prefs.getString('matri_id'); // Assuming 'matri_id' is stored

// // // // // // // //     if (matriId != null) {
// // // // // // // //       await _fetchBiodataInfo(matriId);
// // // // // // // //     } else {
// // // // // // // //       print('matriId is null. Unable to fetch biodata.');
// // // // // // // //     }
// // // // // // // //   }

// // // // // // // //   @override
// // // // // // // //   void initState() {
// // // // // // // //     super.initState();
// // // // // // // //     _tabController = TabController(length: 6, vsync: this);
// // // // // // // //     _getAuthToken();
// // // // // // // //     _getMatriIdAndFetchBiodata();
// // // // // // // //   }

// // // // // // // //   @override
// // // // // // // //   void dispose() {
// // // // // // // //     _tabController.dispose();
// // // // // // // //     super.dispose();
// // // // // // // //   }

// // // // // // // //   Future<void> _getAuthToken() async {
// // // // // // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // // // // // //     setState(() {
// // // // // // // //       _authToken = prefs.getString('token_key');
// // // // // // // //     });
// // // // // // // //   }

// // // // // // // //   Future<void> _fetchBiodataInfo(String matriId) async {
// // // // // // // //     final controller =
// // // // // // // //         Provider.of<ShowbiodataController>(context, listen: false);
// // // // // // // //     // Call the method to fetch biodata here
// // // // // // // //     await controller.fetchBiodata(); // Pass necessary parameters if needed
// // // // // // // //   }

// // // // // // // //   void _handleMenuItemClick(String value) {
// // // // // // // //     switch (value) {
// // // // // // // //       case 'share':
// // // // // // // //         _shareApp();
// // // // // // // //         break;
// // // // // // // //       case 'RateApp':
// // // // // // // //         _shareApp();
// // // // // // // //         break;
// // // // // // // //       case 'delete':
// // // // // // // //         _showDeleteAccountConfirmation(context);
// // // // // // // //         break;
// // // // // // // //       case 'logout':
// // // // // // // //         _handleLogout(context);
// // // // // // // //         break;
// // // // // // // //     }
// // // // // // // //   }

// // // // // // // //   _rateApp() {}

// // // // // // // //   Future<void> _handleLogout(context) async {
// // // // // // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // // // // // //     await prefs.remove('token_key');
// // // // // // // //     await prefs.remove('matri_id');
// // // // // // // //     await prefs.setBool('isLoggedIn', false);
// // // // // // // //     Navigator.of(context).pushAndRemoveUntil(
// // // // // // // //       MaterialPageRoute(builder: (context) => LoginForm(onLoginSuccess: () {})),
// // // // // // // //       (Route<dynamic> route) => false,
// // // // // // // //     );
// // // // // // // //   }

// // // // // // // //   void _shareApp() {
// // // // // // // //     const String appLink = 'https://Instagram.com';
// // // // // // // //     const String message = 'Check out this awesome app: $appLink';
// // // // // // // //     Share.share(message);
// // // // // // // //   }

// // // // // // // //   void _showDeleteAccountConfirmation(context) {
// // // // // // // //     showDialog(
// // // // // // // //       context: context,
// // // // // // // //       builder: (BuildContext context) {
// // // // // // // //         return AlertDialog(
// // // // // // // //           title: const Text('Delete Account'),
// // // // // // // //           content: const Text(
// // // // // // // //               'Are you sure you want to delete your account? This action cannot be undone.'),
// // // // // // // //           actions: <Widget>[
// // // // // // // //             TextButton(
// // // // // // // //               child: const Text('Cancel'),
// // // // // // // //               onPressed: () {
// // // // // // // //                 Navigator.of(context).pop();
// // // // // // // //               },
// // // // // // // //             ),
// // // // // // // //             TextButton(
// // // // // // // //               child: const Text('Delete'),
// // // // // // // //               onPressed: () async {
// // // // // // // //                 Navigator.of(context).pop();
// // // // // // // //                 await _deleteAccount(context);
// // // // // // // //               },
// // // // // // // //             ),
// // // // // // // //           ],
// // // // // // // //         );
// // // // // // // //       },
// // // // // // // //     );
// // // // // // // //   }

// // // // // // // //   Future<void> _deleteAccount(context) async {
// // // // // // // //     final url = Uri.parse(
// // // // // // // //         'https://techfluxsolutions.com/royal_maratha/api/users/delete');

// // // // // // // //     try {
// // // // // // // //       final response = await http.delete(
// // // // // // // //         url,
// // // // // // // //         headers: {'Authorization': 'Bearer $_authToken'},
// // // // // // // //       );

// // // // // // // //       if (response.statusCode == 200) {
// // // // // // // //         final data = json.decode(response.body);
// // // // // // // //         bool success = data['success'] ?? false;

// // // // // // // //         if (success) {
// // // // // // // //           SharedPreferences prefs = await SharedPreferences.getInstance();
// // // // // // // //           await prefs.clear();
// // // // // // // //           Navigator.of(context).pushReplacementNamed('/login');
// // // // // // // //         } else {
// // // // // // // //           String message = data['message'] ?? 'Failed to delete account';
// // // // // // // //           ScaffoldMessenger.of(context)
// // // // // // // //               .showSnackBar(SnackBar(content: Text(message)));
// // // // // // // //         }
// // // // // // // //       } else {
// // // // // // // //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// // // // // // // //             content: Text('Failed to delete account: ${response.statusCode}')));
// // // // // // // //       }
// // // // // // // //     } catch (e) {
// // // // // // // //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// // // // // // // //           content: Text('An error occurred while deleting account')));
// // // // // // // //     }
// // // // // // // //   }

// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     return Scaffold(
// // // // // // // //       appBar: AppBar(
// // // // // // // //         title: const Text(
// // // // // // // //           'Biodata Maker',
// // // // // // // //           style: TextStyle(
// // // // // // // //               fontSize: 26.0, fontWeight: FontWeight.bold, color: Colors.white),
// // // // // // // //           textAlign: TextAlign.center,
// // // // // // // //         ),
// // // // // // // //         backgroundColor: const Color(0xFFFF5508),
// // // // // // // //         actions: [
// // // // // // // //           PopupMenuButton<String>(
// // // // // // // //             color: Colors.white,
// // // // // // // //             onSelected: _handleMenuItemClick,
// // // // // // // //             itemBuilder: (BuildContext context) {
// // // // // // // //               return [
// // // // // // // //                 const PopupMenuItem(value: 'share', child: Text('Share App')),
// // // // // // // //                 const PopupMenuItem(value: 'RateApp', child: Text('Rate App')),
// // // // // // // //                 const PopupMenuItem(
// // // // // // // //                     value: 'delete', child: Text('Delete Account')),
// // // // // // // //                 const PopupMenuItem(value: 'logout', child: Text('Logout')),
// // // // // // // //               ];
// // // // // // // //             },
// // // // // // // //             icon: const Icon(Icons.menu, color: Colors.white),
// // // // // // // //           ),
// // // // // // // //         ],
// // // // // // // //       ),
// // // // // // // //       body: Padding(
// // // // // // // //         padding: EdgeInsets.symmetric(horizontal: 10),
// // // // // // // //         child: SingleChildScrollView(
// // // // // // // //           // Wrap the entire content in SingleChildScrollView
// // // // // // // //           child: Column(
// // // // // // // //             crossAxisAlignment:
// // // // // // // //                 CrossAxisAlignment.start, // Align content to the start
// // // // // // // //             children: <Widget>[
// // // // // // // //               const SizedBox(height: 8),
// // // // // // // //               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
// // // // // // // //                 Expanded(
// // // // // // // //                   child: ElevatedButton.icon(
// // // // // // // //                     onPressed: () {
// // // // // // // //                       Navigator.push(
// // // // // // // //                         context,
// // // // // // // //                         MaterialPageRoute(
// // // // // // // //                             builder: (context) => AllDetailsPage()),
// // // // // // // //                       );
// // // // // // // //                     },
// // // // // // // //                     icon:
// // // // // // // //                         const Icon(Icons.brush, size: 18), // Decrease icon size
// // // // // // // //                     label: const Text(
// // // // // // // //                       'Create Biodata',
// // // // // // // //                       style: TextStyle(fontSize: 14), // Reduce font size
// // // // // // // //                     ),
// // // // // // // //                     style: ElevatedButton.styleFrom(
// // // // // // // //                       backgroundColor: Colors.red,
// // // // // // // //                       foregroundColor: Colors.white,
// // // // // // // //                       padding: const EdgeInsets.symmetric(
// // // // // // // //                           horizontal: 8, vertical: 10), // Reduce padding
// // // // // // // //                       shape: RoundedRectangleBorder(
// // // // // // // //                         borderRadius: BorderRadius.circular(
// // // // // // // //                             8), // Adjust border radius if needed
// // // // // // // //                       ),
// // // // // // // //                     ),
// // // // // // // //                   ),
// // // // // // // //                 ),
// // // // // // // //                 const SizedBox(width: 8),

// // // // // // // //                 Consumer<ShowbiodataController>(
// // // // // // // //                     builder: (context, controller, _) {
// // // // // // // //                   return Expanded(
// // // // // // // //                     child: ElevatedButton.icon(
// // // // // // // //                       onPressed: () {
// // // // // // // //                         // Add a dummy sample biodata to the controller's userData list
// // // // // // // //                         controller.addDummyBiodata();
// // // // // // // //                       },
// // // // // // // //                       icon: const Icon(Icons.add, size: 18),
// // // // // // // //                       label: const Text(
// // // // // // // //                         'Add Sample',
// // // // // // // //                         style: TextStyle(fontSize: 14),
// // // // // // // //                       ),
// // // // // // // //                       style: ElevatedButton.styleFrom(
// // // // // // // //                         backgroundColor: const Color(0xFFFF5507),
// // // // // // // //                         foregroundColor: Colors.white,
// // // // // // // //                         padding: const EdgeInsets.symmetric(
// // // // // // // //                             horizontal: 8, vertical: 10),
// // // // // // // //                         shape: RoundedRectangleBorder(
// // // // // // // //                             borderRadius: BorderRadius.circular(10)),
// // // // // // // //                       ),
// // // // // // // //                     ),
// // // // // // // //                   );
// // // // // // // //                 }),

// // // // // // // // // The ListView that displays biodata
// // // // // // // //                 const SizedBox(height: 15),
// // // // // // // //                 Consumer<ShowbiodataController>(
// // // // // // // //                   builder: (context, controller, _) {
// // // // // // // //                     // Show loading indicator while data is being fetched
// // // // // // // //                     if (controller.loading) {
// // // // // // // //                       return const Center(
// // // // // // // //                         child: CircularProgressIndicator(), // Loading indicator
// // // // // // // //                       );
// // // // // // // //                     }

// // // // // // // //                     // Check if userData or data is null
// // // // // // // //                     if (controller.userData == null ||
// // // // // // // //                         controller.userData!['data'] == null ||
// // // // // // // //                         controller.userData!['data'].isEmpty) {
// // // // // // // //                       return const Center(
// // // // // // // //                         child: Text('No data available'),
// // // // // // // //                       );
// // // // // // // //                     }

// // // // // // // //                     // Wrap ListView.builder in Expanded to constrain its height properly
// // // // // // // //                     return Expanded(
// // // // // // // //                       child: ListView.builder(
// // // // // // // //                         scrollDirection: Axis.vertical,
// // // // // // // //                         shrinkWrap:
// // // // // // // //                             true, // Ensure the ListView does not take infinite height
// // // // // // // //                         itemCount: controller.userData!['data'].length,
// // // // // // // //                         itemBuilder: (context, index) {
// // // // // // // //                           // Extract the individual biodata from the list
// // // // // // // //                           final biodata = controller.userData!['data'][index];

// // // // // // // //                           return Padding(
// // // // // // // //                             padding: const EdgeInsets.symmetric(vertical: 5),
// // // // // // // //                             child: _buildBiodataCard(context, biodata),
// // // // // // // //                           );
// // // // // // // //                         },
// // // // // // // //                       ),
// // // // // // // //                     );
// // // // // // // //                   },
// // // // // // // //                 ),
// // // // // // // //               ])
// // // // // // // //             ],
// // // // // // // //           ),
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }

// // // // // // // // Widget _buildBiodataCard(BuildContext context, Map<String, dynamic> biodata) {
// // // // // // // //   return Card(
// // // // // // // //     color: Colors.white,
// // // // // // // //     elevation: 5,
// // // // // // // //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// // // // // // // //     child: Padding(
// // // // // // // //       padding: const EdgeInsets.symmetric(
// // // // // // // //           vertical: 4.0, horizontal: 8.0), // Adjusted padding
// // // // // // // //       child: Column(
// // // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // // //         children: [
// // // // // // // //           ListTile(
// // // // // // // //             leading: CircleAvatar(
// // // // // // // //               // backgroundImage: biodata['photo1'] != null &&
// // // // // // // //               //         biodata['photo1'].isNotEmpty
// // // // // // // //               //     ? NetworkImage(
// // // // // // // //               //         biodata['photo1']) // Load from network if available
// // // // // // // //               //     : AssetImage(
// // // // // // // //               //         'assets/images/sample_image.jpg'), // Load from assets if not
// // // // // // // //               radius: 30,
// // // // // // // //             ),
// // // // // // // //             title: Text(
// // // // // // // //               '${biodata['username'] ?? 'John'}',
// // // // // // // //               style: const TextStyle(fontWeight: FontWeight.bold),
// // // // // // // //             ),
// // // // // // // //             subtitle: Text(
// // // // // // // //               'Caste: ${biodata['caste'] ?? 'Maratha'} \nHeight: ${biodata['dob'] ?? '01-01-1990'}',
// // // // // // // //             ),
// // // // // // // //           ),
// // // // // // // //           // Remove Divider and add grey background to the row
// // // // // // // //           Container(
// // // // // // // //             color: Colors.grey[200], // Set the background color for the row
// // // // // // // //             child: Row(
// // // // // // // //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // // // // // //               children: [
// // // // // // // //                 _buildBioOptionButton(Icons.edit, 'Edit', () {
// // // // // // // //                   // Navigate to edit page
// // // // // // // //                   // Navigator.push(
// // // // // // // //                   //   context,
// // // // // // // //                   //   MaterialPageRoute(
// // // // // // // //                   //     builder: (context) => AllDetailsPage(),
// // // // // // // //                   //   ),
// // // // // // // //                   // );
// // // // // // // //                 }),
// // // // // // // //                 _buildBioOptionButton(Icons.copy, 'Copy', () {
// // // // // // // //                   // Implement copy functionality
// // // // // // // //                 }),
// // // // // // // //                 _buildBioOptionButton(Icons.delete, 'Delete', () {
// // // // // // // //                   // Implement delete functionality
// // // // // // // //                 }),
// // // // // // // //                 _buildBioOptionButton(Icons.file_copy, 'Template', () {
// // // // // // // //                   // Implement template change functionality
// // // // // // // //                 }),
// // // // // // // //               ],
// // // // // // // //             ),
// // // // // // // //           ),
// // // // // // // //         ],
// // // // // // // //       ),
// // // // // // // //     ),
// // // // // // // //   );
// // // // // // // // }

// // // // // // // // Widget _buildBioOptionButton(
// // // // // // // //     IconData icon, String label, VoidCallback onPressed) {
// // // // // // // //   return Container(
// // // // // // // //     decoration: BoxDecoration(
// // // // // // // //       color: Colors.grey[200], // Set the background color to a light grey
// // // // // // // //       borderRadius:
// // // // // // // //           BorderRadius.circular(8), // Add border radius for rounded corners
// // // // // // // //     ),
// // // // // // // //     child: Column(
// // // // // // // //       children: [
// // // // // // // //         IconButton(
// // // // // // // //           icon: Icon(icon, color: Colors.grey[700]),
// // // // // // // //           onPressed: onPressed,
// // // // // // // //         ),
// // // // // // // //         Text(label, style: TextStyle(color: Colors.grey[700])),
// // // // // // // //       ],
// // // // // // // //     ),
// // // // // // // //   );
// // // // // // // // }

// // // // // // // import 'dart:convert';
// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:http/http.dart' as http;
// // // // // // // import 'package:provider/provider.dart';
// // // // // // // import 'package:share_plus/share_plus.dart';
// // // // // // // import 'package:shared_preferences/shared_preferences.dart';
// // // // // // // import '../../controller/showbiodata_controller.dart';
// // // // // // // import '../AllDetailsPage.dart';
// // // // // // // import '../login_form.dart';
// // // // // // // import '../template_selection_page.dart';

// // // // // // // class HomePage extends StatefulWidget {
// // // // // // //   const HomePage({super.key});

// // // // // // //   @override
// // // // // // //   _HomePageState createState() => _HomePageState();
// // // // // // // }

// // // // // // // class _HomePageState extends State<HomePage>
// // // // // // //     with SingleTickerProviderStateMixin {
// // // // // // //   late TabController _tabController;
// // // // // // //   String? _authToken;
// // // // // // //   String id = '';

// // // // // // //   Future<void> _getMatriIdAndFetchBiodata() async {
// // // // // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // // // // //     String? matriId =
// // // // // // //         prefs.getString('matri_id'); // Assuming 'matri_id' is stored

// // // // // // //     if (matriId != null) {
// // // // // // //       await _fetchBiodataInfo(matriId);
// // // // // // //     } else {
// // // // // // //       print('matriId is null. Unable to fetch biodata.');
// // // // // // //     }
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   void initState() {
// // // // // // //     super.initState();
// // // // // // //     _tabController = TabController(length: 6, vsync: this);
// // // // // // //     _getAuthToken();
// // // // // // //     _getMatriIdAndFetchBiodata();
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   void dispose() {
// // // // // // //     _tabController.dispose();
// // // // // // //     super.dispose();
// // // // // // //   }

// // // // // // //   Future<void> _getAuthToken() async {
// // // // // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // // // // //     setState(() {
// // // // // // //       _authToken = prefs.getString('token_key');
// // // // // // //     });
// // // // // // //   }

// // // // // // //   Future<void> _fetchBiodataInfo(String matriId) async {
// // // // // // //     final controller =
// // // // // // //         Provider.of<ShowbiodataController>(context, listen: false);
// // // // // // //     await controller.fetchBiodata(); // Fetch biodata using the controller
// // // // // // //   }

// // // // // // //   void _handleMenuItemClick(String value) {
// // // // // // //     switch (value) {
// // // // // // //       case 'share':
// // // // // // //         _shareApp();
// // // // // // //         break;
// // // // // // //       case 'RateApp':
// // // // // // //         _rateApp();
// // // // // // //         break;
// // // // // // //       case 'delete':
// // // // // // //         _showDeleteAccountConfirmation(context);
// // // // // // //         break;
// // // // // // //       case 'logout':
// // // // // // //         _handleLogout(context);
// // // // // // //         break;
// // // // // // //     }
// // // // // // //   }

// // // // // // //   _rateApp() {
// // // // // // //     // Functionality to rate the app
// // // // // // //   }

// // // // // // //   Future<void> _handleLogout(context) async {
// // // // // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // // // // //     await prefs.remove('token_key');
// // // // // // //     await prefs.remove('matri_id');
// // // // // // //     await prefs.setBool('isLoggedIn', false);
// // // // // // //     Navigator.of(context).pushAndRemoveUntil(
// // // // // // //       MaterialPageRoute(builder: (context) => LoginForm(onLoginSuccess: () {})),
// // // // // // //       (Route<dynamic> route) => false,
// // // // // // //     );
// // // // // // //   }

// // // // // // //   void _shareApp() {
// // // // // // //     const String appLink = 'https://Instagram.com';
// // // // // // //     const String message = 'Check out this awesome app: $appLink';
// // // // // // //     Share.share(message);
// // // // // // //   }

// // // // // // //   void _showDeleteAccountConfirmation(context) {
// // // // // // //     showDialog(
// // // // // // //       context: context,
// // // // // // //       builder: (BuildContext context) {
// // // // // // //         return AlertDialog(
// // // // // // //           title: const Text('Delete Account'),
// // // // // // //           content: const Text(
// // // // // // //               'Are you sure you want to delete your account? This action cannot be undone.'),
// // // // // // //           actions: <Widget>[
// // // // // // //             TextButton(
// // // // // // //               child: const Text('Cancel'),
// // // // // // //               onPressed: () {
// // // // // // //                 Navigator.of(context).pop();
// // // // // // //               },
// // // // // // //             ),
// // // // // // //             TextButton(
// // // // // // //               child: const Text('Delete'),
// // // // // // //               onPressed: () async {
// // // // // // //                 Navigator.of(context).pop();
// // // // // // //                 await _deleteAccount(context);
// // // // // // //               },
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         );
// // // // // // //       },
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Future<void> _deleteAccount(context) async {
// // // // // // //     final url = Uri.parse(
// // // // // // //         'https://techfluxsolutions.com/royal_maratha/api/users/delete');

// // // // // // //     try {
// // // // // // //       final response = await http.delete(
// // // // // // //         url,
// // // // // // //         headers: {'Authorization': 'Bearer $_authToken'},
// // // // // // //       );

// // // // // // //       if (response.statusCode == 200) {
// // // // // // //         final data = json.decode(response.body);
// // // // // // //         bool success = data['success'] ?? false;

// // // // // // //         if (success) {
// // // // // // //           SharedPreferences prefs = await SharedPreferences.getInstance();
// // // // // // //           await prefs.clear();
// // // // // // //           Navigator.of(context).pushReplacementNamed('/login');
// // // // // // //         } else {
// // // // // // //           String message = data['message'] ?? 'Failed to delete account';
// // // // // // //           ScaffoldMessenger.of(context)
// // // // // // //               .showSnackBar(SnackBar(content: Text(message)));
// // // // // // //         }
// // // // // // //       } else {
// // // // // // //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// // // // // // //             content: Text('Failed to delete account: ${response.statusCode}')));
// // // // // // //       }
// // // // // // //     } catch (e) {
// // // // // // //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// // // // // // //           content: Text('An error occurred while deleting account')));
// // // // // // //     }
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Scaffold(
// // // // // // //       appBar: AppBar(
// // // // // // //         title: const Text(
// // // // // // //           'Biodata Maker',
// // // // // // //           style: TextStyle(
// // // // // // //               fontSize: 26.0, fontWeight: FontWeight.bold, color: Colors.white),
// // // // // // //           textAlign: TextAlign.center,
// // // // // // //         ),
// // // // // // //         backgroundColor: const Color(0xFFFF5508),
// // // // // // //         actions: [
// // // // // // //           PopupMenuButton<String>(
// // // // // // //             color: Colors.white,
// // // // // // //             onSelected: _handleMenuItemClick,
// // // // // // //             itemBuilder: (BuildContext context) {
// // // // // // //               return [
// // // // // // //                 const PopupMenuItem(value: 'share', child: Text('Share App')),
// // // // // // //                 const PopupMenuItem(value: 'RateApp', child: Text('Rate App')),
// // // // // // //                 const PopupMenuItem(
// // // // // // //                     value: 'delete', child: Text('Delete Account')),
// // // // // // //                 const PopupMenuItem(value: 'logout', child: Text('Logout')),
// // // // // // //               ];
// // // // // // //             },
// // // // // // //             icon: const Icon(Icons.menu, color: Colors.white),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //       body: Padding(
// // // // // // //         padding: const EdgeInsets.symmetric(horizontal: 10),
// // // // // // //         child: Column(
// // // // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //           children: <Widget>[
// // // // // // //             const SizedBox(height: 8),
// // // // // // //             Row(
// // // // // // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // // //               children: [
// // // // // // //                 Expanded(
// // // // // // //                   child: ElevatedButton.icon(
// // // // // // //                     onPressed: () {
// // // // // // //                       Navigator.push(
// // // // // // //                         context,
// // // // // // //                         MaterialPageRoute(
// // // // // // //                             builder: (context) => AllDetailsPage()),
// // // // // // //                       );
// // // // // // //                     },
// // // // // // //                     icon: const Icon(Icons.brush, size: 18),
// // // // // // //                     label: const Text(
// // // // // // //                       'Create Biodata',
// // // // // // //                       style: TextStyle(fontSize: 14),
// // // // // // //                     ),
// // // // // // //                     style: ElevatedButton.styleFrom(
// // // // // // //                       backgroundColor: Colors.red,
// // // // // // //                       foregroundColor: Colors.white,
// // // // // // //                       padding: const EdgeInsets.symmetric(
// // // // // // //                           horizontal: 8, vertical: 10),
// // // // // // //                       shape: RoundedRectangleBorder(
// // // // // // //                         borderRadius: BorderRadius.circular(8),
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //                 const SizedBox(width: 8),
// // // // // // //                 Consumer<ShowbiodataController>(
// // // // // // //                     builder: (context, controller, _) {
// // // // // // //                   return Expanded(
// // // // // // //                     child: ElevatedButton.icon(
// // // // // // //                       onPressed: () {
// // // // // // //                         controller.addDummyBiodata();
// // // // // // //                       },
// // // // // // //                       icon: const Icon(Icons.add, size: 18),
// // // // // // //                       label: const Text(
// // // // // // //                         'Add Sample',
// // // // // // //                         style: TextStyle(fontSize: 14),
// // // // // // //                       ),
// // // // // // //                       style: ElevatedButton.styleFrom(
// // // // // // //                         backgroundColor: const Color(0xFFFF5507),
// // // // // // //                         foregroundColor: Colors.white,
// // // // // // //                         padding: const EdgeInsets.symmetric(
// // // // // // //                             horizontal: 8, vertical: 10),
// // // // // // //                         shape: RoundedRectangleBorder(
// // // // // // //                             borderRadius: BorderRadius.circular(10)),
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                   );
// // // // // // //                 }),
// // // // // // //               ],
// // // // // // //             ),
// // // // // // //             const SizedBox(height: 15),
// // // // // // //             Expanded(
// // // // // // //               child: Consumer<ShowbiodataController>(
// // // // // // //                 builder: (context, controller, _) {
// // // // // // //                   if (controller.loading) {
// // // // // // //                     return const Center(
// // // // // // //                       child: CircularProgressIndicator(),
// // // // // // //                     );
// // // // // // //                   }

// // // // // // //                   if (controller.userData == null ||
// // // // // // //                       controller.userData!['data'] == null ||
// // // // // // //                       controller.userData!['data'].isEmpty) {
// // // // // // //                     return const Center(
// // // // // // //                       child: Text('No data available'),
// // // // // // //                     );
// // // // // // //                   }

// // // // // // //                   return ListView.builder(
// // // // // // //                     itemCount: controller.userData!['data'].length,
// // // // // // //                     itemBuilder: (context, index) {
// // // // // // //                       final biodata = controller.userData!['data'][index];
// // // // // // //                       return Padding(
// // // // // // //                         padding: const EdgeInsets.symmetric(vertical: 5),
// // // // // // //                         child: _buildBiodataCard(context, biodata),
// // // // // // //                       );
// // // // // // //                     },
// // // // // // //                   );
// // // // // // //                 },
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // Widget _buildBiodataCard(BuildContext context, Map<String, dynamic> biodata) {
// // // // // // //   String id = '';

// // // // // // //   return Card(
// // // // // // //     color: Colors.white,
// // // // // // //     elevation: 5,
// // // // // // //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// // // // // // //     child: Padding(
// // // // // // //       padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
// // // // // // //       child: Column(
// // // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //         children: [
// // // // // // //           ListTile(
// // // // // // //             leading: CircleAvatar(
// // // // // // //               radius: 30,
// // // // // // //             ),
// // // // // // //             title: Text(
// // // // // // //               '${biodata['username'] ?? 'John'}',
// // // // // // //               style: const TextStyle(fontWeight: FontWeight.bold),
// // // // // // //             ),
// // // // // // //             subtitle: Text(
// // // // // // //               'Caste: ${biodata['caste'] ?? 'Maratha'} \nDOB: ${biodata['dob'] ?? '01-01-1990'}',
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           Container(
// // // // // // //             color: Colors.grey[200],
// // // // // // //             child: Row(
// // // // // // //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // // // // //               children: [
// // // // // // //                 _buildBioOptionButton(Icons.edit, 'Edit', () {
// // // // // // //                   // Implement edit functionality
// // // // // // //                 }),
// // // // // // //                 _buildBioOptionButton(Icons.copy, 'Copy', () {
// // // // // // //                   // Implement copy functionality
// // // // // // //                 }),
// // // // // // //                 _buildBioOptionButton(Icons.delete, 'Delete', () {
// // // // // // //                   // Implement delete functionality
// // // // // // //                 }),
// // // // // // //                 _buildBioOptionButton(Icons.file_copy, 'Template', () {
// // // // // // //                   // Implement template change functionality
// // // // // // //                   Navigator.push(
// // // // // // //                     context,
// // // // // // //                     MaterialPageRoute(
// // // // // // //                       builder: (context) => TemplateSelectionPage(
// // // // // // //                         id: id,
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                   );
// // // // // // //                 }),
// // // // // // //               ],
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     ),
// // // // // // //   );
// // // // // // // }

// // // // // // // Widget _buildBioOptionButton(
// // // // // // //     IconData icon, String label, VoidCallback onPressed) {
// // // // // // //   return Column(
// // // // // // //     children: [
// // // // // // //       IconButton(
// // // // // // //         icon: Icon(icon, color: Colors.grey[700]),
// // // // // // //         onPressed: onPressed,
// // // // // // //       ),
// // // // // // //       Text(label, style: TextStyle(color: Colors.grey[700])),
// // // // // // //     ],
// // // // // // //   );
// // // // // // // }

// // // import 'dart:convert';
// // // import 'package:flutter/material.dart';
// // // import 'package:http/http.dart' as http;
// // // import 'package:intl/intl.dart';
// // // import 'package:provider/provider.dart';
// // // import 'package:share_plus/share_plus.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';
// // // import '../../controller/showbiodata_controller.dart';
// // // import '../AllDetailsPage.dart';
// // // import '../login_form.dart';
// // // import '../template_selection_page.dart';

// // // class HomePage extends StatefulWidget {
// // //   const HomePage({super.key});

// // //   @override
// // //   _HomePageState createState() => _HomePageState();
// // // }

// // // class _HomePageState extends State<HomePage>
// // //     with SingleTickerProviderStateMixin {
// // //   late TabController _tabController;
// // //   String? _authToken;

// // //   Future<void> _getMatriIdAndFetchBiodata() async {
// // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // //     String? matriId =
// // //         prefs.getString('matri_id'); // Assuming 'matri_id' is stored

// // //     if (matriId != null) {
// // //       await _fetchBiodataInfo(matriId);
// // //     } else {
// // //       print('matriId is null. Unable to fetch biodata.');
// // //     }
// // //   }

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _tabController = TabController(length: 6, vsync: this);
// // //     _getAuthToken();
// // //     _getMatriIdAndFetchBiodata();
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _tabController.dispose();
// // //     super.dispose();
// // //   }

// // //   Future<void> _getAuthToken() async {
// // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // //     setState(() {
// // //       _authToken = prefs.getString('token_key');
// // //     });
// // //   }

// // //   Future<void> _fetchBiodataInfo(String matriId) async {
// // //     final controller =
// // //         Provider.of<ShowbiodataController>(context, listen: false);
// // //     await controller.fetchBiodata(); // Fetch biodata using the controller
// // //   }

// // //   void _handleMenuItemClick(String value) {
// // //     switch (value) {
// // //       case 'share':
// // //         _shareApp();
// // //         break;
// // //       case 'RateApp':
// // //         _rateApp();
// // //         break;
// // //       case 'delete':
// // //         _showDeleteAccountConfirmation(context);
// // //         break;
// // //       case 'logout':
// // //         _handleLogout(context);
// // //         break;
// // //     }
// // //   }

// // //   _rateApp() {
// // //     // Functionality to rate the app
// // //   }

// // //   Future<void> _handleLogout(context) async {
// // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // //     await prefs.remove('token_key');
// // //     await prefs.remove('matri_id');
// // //     await prefs.setBool('isLoggedIn', false);
// // //     Navigator.of(context).pushAndRemoveUntil(
// // //       MaterialPageRoute(builder: (context) => LoginForm(onLoginSuccess: () {})),
// // //       (Route<dynamic> route) => false,
// // //     );
// // //   }

// // //   void _shareApp() {
// // //     const String appLink = 'https://Instagram.com';
// // //     const String message = 'Check out this awesome app: $appLink';
// // //     Share.share(message);
// // //   }

// // //   void _showDeleteAccountConfirmation(context) {
// // //     showDialog(
// // //       context: context,
// // //       builder: (BuildContext context) {
// // //         return AlertDialog(
// // //           title: const Text('Delete Account'),
// // //           content: const Text(
// // //               'Are you sure you want to delete your account? This action cannot be undone.'),
// // //           actions: <Widget>[
// // //             TextButton(
// // //               child: const Text('Cancel'),
// // //               onPressed: () {
// // //                 Navigator.of(context).pop();
// // //               },
// // //             ),
// // //             TextButton(
// // //               child: const Text('Delete'),
// // //               onPressed: () async {
// // //                 Navigator.of(context).pop();
// // //                 await _deleteAccount(context);
// // //               },
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }

// // //   Future<void> _deleteAccount(context) async {
// // //     final url = Uri.parse(
// // //         'https://techfluxsolutions.com/royal_maratha/api/users/delete');

// // //     try {
// // //       final response = await http.delete(
// // //         url,
// // //         headers: {'Authorization': 'Bearer $_authToken'},
// // //       );

// // //       if (response.statusCode == 200) {
// // //         final data = json.decode(response.body);
// // //         bool success = data['success'] ?? false;

// // //         if (success) {
// // //           SharedPreferences prefs = await SharedPreferences.getInstance();
// // //           await prefs.clear();
// // //           Navigator.of(context).pushReplacementNamed('/login');
// // //         } else {
// // //           String message = data['message'] ?? 'Failed to delete account';
// // //           ScaffoldMessenger.of(context)
// // //               .showSnackBar(SnackBar(content: Text(message)));
// // //         }
// // //       } else {
// // //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// // //             content: Text('Failed to delete account: ${response.statusCode}')));
// // //       }
// // //     } catch (e) {
// // //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// // //           content: Text('An error occurred while deleting account')));
// // //     }
// // //   }

// // //   String formatDate(String? date) {
// // //     if (date == null) return ''; // Handle null case
// // //     try {
// // //       // Parse the incoming date in 'yyyy-MM-dd HH:mm:ss' format
// // //       DateTime parsedDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(date);
// // //       // Format it to 'dd-MM-yyyy' (e.g., 12-06-2000)
// // //       return DateFormat('dd-MM-yyyy').format(parsedDate);
// // //     } catch (e) {
// // //       return date; // Return original date if parsing fails
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text(
// // //           'Biodata Maker',
// // //           style: TextStyle(
// // //               fontSize: 26.0, fontWeight: FontWeight.bold, color: Colors.white),
// // //           textAlign: TextAlign.center,
// // //         ),
// // //         backgroundColor: const Color(0xFFFF5508),
// // //         actions: [
// // //           PopupMenuButton<String>(
// // //             color: Colors.white,
// // //             onSelected: _handleMenuItemClick,
// // //             itemBuilder: (BuildContext context) {
// // //               return [
// // //                 const PopupMenuItem(value: 'share', child: Text('Share App')),
// // //                 const PopupMenuItem(value: 'RateApp', child: Text('Rate App')),
// // //                 const PopupMenuItem(
// // //                     value: 'delete', child: Text('Delete Account')),
// // //                 const PopupMenuItem(value: 'logout', child: Text('Logout')),
// // //               ];
// // //             },
// // //             icon: const Icon(Icons.menu, color: Colors.white),
// // //           ),
// // //         ],
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.symmetric(horizontal: 10),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: <Widget>[
// // //             const SizedBox(height: 8),
// // //             Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //               children: [
// // //                 Expanded(
// // //                   child: ElevatedButton.icon(
// // //                     onPressed: () {
// // //                       Navigator.push(
// // //                         context,
// // //                         MaterialPageRoute(
// // //                             builder: (context) => AllDetailsPage()),
// // //                       );
// // //                     },
// // //                     icon: const Icon(Icons.brush, size: 18),
// // //                     label: const Text(
// // //                       'Create Biodata',
// // //                       style: TextStyle(fontSize: 14),
// // //                     ),
// // //                     style: ElevatedButton.styleFrom(
// // //                       backgroundColor: Colors.red,
// // //                       foregroundColor: Colors.white,
// // //                       padding: const EdgeInsets.symmetric(
// // //                           horizontal: 8, vertical: 10),
// // //                       shape: RoundedRectangleBorder(
// // //                         borderRadius: BorderRadius.circular(8),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 const SizedBox(width: 8),
// // //                 Consumer<ShowbiodataController>(
// // //                     builder: (context, controller, _) {
// // //                   return Expanded(
// // //                     child: ElevatedButton.icon(
// // //                       onPressed: () {
// // //                         controller.addDummyBiodata();
// // //                       },
// // //                       icon: const Icon(Icons.add, size: 18),
// // //                       label: const Text(
// // //                         'Add Sample',
// // //                         style: TextStyle(fontSize: 14),
// // //                       ),
// // //                       style: ElevatedButton.styleFrom(
// // //                         backgroundColor: const Color(0xFFFF5507),
// // //                         foregroundColor: Colors.white,
// // //                         padding: const EdgeInsets.symmetric(
// // //                             horizontal: 8, vertical: 10),
// // //                         shape: RoundedRectangleBorder(
// // //                             borderRadius: BorderRadius.circular(10)),
// // //                       ),
// // //                     ),
// // //                   );
// // //                 }),
// // //               ],
// // //             ),
// // //             const SizedBox(height: 15),
// // //             Expanded(
// // //               child: Consumer<ShowbiodataController>(
// // //                 builder: (context, controller, _) {
// // //                   if (controller.loading) {
// // //                     return const Center(
// // //                       child: CircularProgressIndicator(),
// // //                     );
// // //                   }

// // //                   if (controller.userData.isEmpty) {
// // //                     return const Center(
// // //                       child: Text('No data available'),
// // //                     );
// // //                   }

// // //                   return ListView.builder(
// // //                     itemCount: controller.userData.length,
// // //                     itemBuilder: (context, index) {
// // //                       final biodata = controller.userData[index];
// // //                       return Padding(
// // //                         padding: const EdgeInsets.symmetric(vertical: 5),
// // //                         child: _buildBiodataCard(context, biodata, controller),
// // //                       );
// // //                     },
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildBiodataCard(BuildContext context, Map<String, dynamic> biodata,
// // //       ShowbiodataController controller) {
// // //     return Card(
// // //       color: Colors.white,
// // //       elevation: 5,
// // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// // //       child: Padding(
// // //         padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             ListTile(
// // //               leading: CircleAvatar(
// // //                 radius: 30,
// // //                 backgroundImage: AssetImage("assets/images/profile.png"),
// // //               ),
// // //               title: Text(
// // //                 '${biodata['username'] ?? 'John'}',
// // //                 style: const TextStyle(fontWeight: FontWeight.bold),
// // //               ),
// // //               subtitle: Text(
// // //                 'Caste: ${biodata['caste'] ?? 'Maratha'} \nHeight: ${biodata['height'] ?? 'Height'}',
// // //               ),
// // //             ),
// // //             Container(
// // //               color: Colors.grey[200],
// // //               child: Row(
// // //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
// // //                 children: [
// // //                   _buildBioOptionButton(Icons.edit, 'Edit', () {
// // //                     // Implement edit functionality
// // //                     Navigator.push(
// // //                       context,
// // //                       MaterialPageRoute(
// // //                         builder: (context) => AllDetailsPage(),
// // //                       ),
// // //                     );
// // //                   }),
// // //                   _buildBioOptionButton(Icons.copy, 'Copy', () async {
// // //                     // Copy the biodata and add it to the list
// // //                     controller.copyBiodata(biodata);
// // //                   }),
// // //                   _buildBioOptionButton(Icons.delete, 'Delete', () {
// // //                     // Implement delete functionality
// // //                   }),
// // //                   _buildBioOptionButton(
// // //                     Icons.file_copy,
// // //                     'Template',
// // //                     () {
// // //                       // Implement template change functionality
// // //                       Navigator.push(
// // //                         context,
// // //                         MaterialPageRoute(
// // //                           builder: (context) => TemplateSelectionPage(
// // //                             id: (biodata['id'] ?? '').toString(),
// // //                           ),
// // //                         ),
// // //                       );
// // //                     },
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildBioOptionButton(
// // //       IconData icon, String label, VoidCallback onPressed) {
// // //     return Column(
// // //       children: [
// // //         IconButton(
// // //           icon: Icon(icon, color: Colors.grey[700]),
// // //           onPressed: onPressed,
// // //         ),
// // //         Text(label, style: TextStyle(color: Colors.grey[700])),
// // //       ],
// // //     );
// // //   }
// // // }

// // // // import 'dart:convert';
// // // // import 'package:bio_data/controller/home_screen_controller.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:http/http.dart' as http;
// // // // import 'package:intl/intl.dart';
// // // // import 'package:provider/provider.dart';
// // // // import 'package:share_plus/share_plus.dart';
// // // // import 'package:shared_preferences/shared_preferences.dart';
// // // // import '../../controller/delete_templet_controller.dart';
// // // // import '../../controller/showbiodata_controller.dart';
// // // // import '../../request/add_dummy_sample.dart';
// // // // import '../AllDetailsPage.dart';
// // // // import '../login_form.dart';
// // // // import '../template_selection_page.dart';

// // // // class HomePage extends StatefulWidget {
// // // //   const HomePage({super.key});

// // // //   @override
// // // //   _HomePageState createState() => _HomePageState();
// // // // }

// // // // class _HomePageState extends State<HomePage>
// // // //     with SingleTickerProviderStateMixin {
// // // //   late TabController _tabController;
// // // //   String? _authToken;

// // // //   Future<void> _getMatriIdAndFetchBiodata() async {
// // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // //     String? matriId =
// // // //         prefs.getString('matri_id'); // Assuming 'matri_id' is stored

// // // //     if (matriId != null) {
// // // //       await _fetchBiodataInfo(matriId);
// // // //     } else {
// // // //       print('matriId is null. Unable to fetch biodata.');
// // // //     }
// // // //   }

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _tabController = TabController(length: 6, vsync: this);
// // // //     _getAuthToken();
// // // //     _getMatriIdAndFetchBiodata();
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _tabController.dispose();
// // // //     super.dispose();
// // // //   }

// // // //   Future<void> _getAuthToken() async {
// // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // //     setState(() {
// // // //       _authToken = prefs.getString('token_key');
// // // //     });
// // // //   }

// // // //   Future<void> _fetchBiodataInfo(String matriId) async {
// // // //     final controller =
// // // //         Provider.of<ShowbiodataController>(context, listen: false);
// // // //     await controller.fetchBiodata(); // Fetch biodata using the controller
// // // //   }

// // // //   void _handleMenuItemClick(String value) {
// // // //     switch (value) {
// // // //       case 'share':
// // // //         _shareApp();
// // // //         break;
// // // //       case 'RateApp':
// // // //         _rateApp();
// // // //         break;
// // // //       case 'delete':
// // // //         _showDeleteAccountConfirmation(context);
// // // //         break;
// // // //       case 'logout':
// // // //         _handleLogout(context);
// // // //         break;
// // // //     }
// // // //   }

// // // //   _rateApp() {
// // // //     // Functionality to rate the app
// // // //   }

// // // //   Future<void> _handleLogout(context) async {
// // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // //     await prefs.remove('token_key');
// // // //     await prefs.remove('matri_id');
// // // //     await prefs.setBool('isLoggedIn', false);
// // // //     Navigator.of(context).pushAndRemoveUntil(
// // // //       MaterialPageRoute(builder: (context) => LoginForm(onLoginSuccess: () {})),
// // // //       (Route<dynamic> route) => false,
// // // //     );
// // // //   }

// // // //   void _shareApp() {
// // // //     const String appLink = 'https://Instagram.com';
// // // //     const String message = 'Check out this awesome app: $appLink';
// // // //     Share.share(message);
// // // //   }

// // // //   void _showDeleteAccountConfirmation(context) {
// // // //     showDialog(
// // // //       context: context,
// // // //       builder: (BuildContext context) {
// // // //         return AlertDialog(
// // // //           title: const Text('Delete Account'),
// // // //           content: const Text(
// // // //               'Are you sure you want to delete your account? This action cannot be undone.'),
// // // //           actions: <Widget>[
// // // //             TextButton(
// // // //               child: const Text('Cancel'),
// // // //               onPressed: () {
// // // //                 Navigator.of(context).pop();
// // // //               },
// // // //             ),
// // // //             TextButton(
// // // //               child: const Text('Delete'),
// // // //               onPressed: () async {
// // // //                 Navigator.of(context).pop();
// // // //                 await _deleteAccount(context);
// // // //               },
// // // //             ),
// // // //           ],
// // // //         );
// // // //       },
// // // //     );
// // // //   }

// // // //   Future<void> _deleteAccount(context) async {
// // // //     final url = Uri.parse(
// // // //         'https://techfluxsolutions.com/royal_maratha/api/users/delete');

// // // //     try {
// // // //       final response = await http.delete(
// // // //         url,
// // // //         headers: {'Authorization': 'Bearer $_authToken'},
// // // //       );

// // // //       if (response.statusCode == 200) {
// // // //         final data = json.decode(response.body);
// // // //         bool success = data['success'] ?? false;

// // // //         if (success) {
// // // //           SharedPreferences prefs = await SharedPreferences.getInstance();
// // // //           await prefs.clear();
// // // //           Navigator.of(context).pushReplacementNamed('/login');
// // // //         } else {
// // // //           String message = data['message'] ?? 'Failed to delete account';
// // // //           ScaffoldMessenger.of(context)
// // // //               .showSnackBar(SnackBar(content: Text(message)));
// // // //         }
// // // //       } else {
// // // //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// // // //             content: Text('Failed to delete account: ${response.statusCode}')));
// // // //       }
// // // //     } catch (e) {
// // // //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// // // //           content: Text('An error occurred while deleting account')));
// // // //     }
// // // //   }

// // // //   String formatDate(String? date) {
// // // //     if (date == null) return ''; // Handle null case
// // // //     try {
// // // //       // Parse the incoming date in 'yyyy-MM-dd HH:mm:ss' format
// // // //       DateTime parsedDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(date);
// // // //       // Format it to 'dd-MM-yyyy' (e.g., 12-06-2000)
// // // //       return DateFormat('dd-MM-yyyy').format(parsedDate);
// // // //     } catch (e) {
// // // //       return date; // Return original date if parsing fails
// // // //     }
// // // //   }

// // // //   // Future<void> _deleteBiodata(String? id) async {
// // // //   //   if (id == null) return; // Check if id is null before proceeding
// // // //   //   final controller =
// // // //   //       Provider.of<DeleteTemplateController>(context, listen: false);
// // // //   //   await controller.deleteBiodata(id, _authToken);

// // // //   //   if (controller.errorMessage != null) {
// // // //   //     ScaffoldMessenger.of(context).showSnackBar(
// // // //   //       SnackBar(content: Text(controller.errorMessage!)),
// // // //   //     );
// // // //   //   } else if (controller.successMessage != null) {
// // // //   //     ScaffoldMessenger.of(context).showSnackBar(
// // // //   //       SnackBar(content: Text(controller.successMessage!)),
// // // //   //     );

// // // //   //     // Optionally, refresh the biodata list after deletion
// // // //   //     final biodataController =
// // // //   //         Provider.of<ShowbiodataController>(context, listen: false);
// // // //   //     await biodataController.fetchBiodata();
// // // //   //   }
// // // //   // }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: const Text(
// // // //           'Biodata Maker',
// // // //           style: TextStyle(
// // // //               fontSize: 26.0, fontWeight: FontWeight.bold, color: Colors.white),
// // // //           textAlign: TextAlign.center,
// // // //         ),
// // // //         backgroundColor: const Color(0xFFFF5508),
// // // //         actions: [
// // // //           PopupMenuButton<String>(
// // // //             color: Colors.white,
// // // //             onSelected: _handleMenuItemClick,
// // // //             itemBuilder: (BuildContext context) {
// // // //               return [
// // // //                 const PopupMenuItem(value: 'share', child: Text('Share App')),
// // // //                 const PopupMenuItem(value: 'RateApp', child: Text('Rate App')),
// // // //                 const PopupMenuItem(
// // // //                     value: 'delete', child: Text('Delete Account')),
// // // //                 const PopupMenuItem(value: 'logout', child: Text('Logout')),
// // // //               ];
// // // //             },
// // // //             icon: const Icon(Icons.menu, color: Colors.white),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //       body: Padding(
// // // //         padding: const EdgeInsets.symmetric(horizontal: 10),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: <Widget>[
// // // //             const SizedBox(height: 8),
// // // //             Row(
// // // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //               children: [
// // // //                 Expanded(
// // // //                   child: ElevatedButton.icon(
// // // //                     onPressed: () {
// // // //                       Navigator.push(
// // // //                         context,
// // // //                         MaterialPageRoute(
// // // //                             builder: (context) => AllDetailsPage()),
// // // //                       );
// // // //                     },
// // // //                     icon: const Icon(Icons.brush, size: 18),
// // // //                     label: const Text(
// // // //                       'Create Biodata',
// // // //                       style: TextStyle(fontSize: 14),
// // // //                     ),
// // // //                     style: ElevatedButton.styleFrom(
// // // //                       backgroundColor: Colors.red,
// // // //                       foregroundColor: Colors.white,
// // // //                       padding: const EdgeInsets.symmetric(
// // // //                           horizontal: 8, vertical: 10),
// // // //                       shape: RoundedRectangleBorder(
// // // //                         borderRadius: BorderRadius.circular(8),
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //                 const SizedBox(width: 8),
// // // //                 Consumer<HomeScreenController>(
// // // //                     builder: (context, controller, _) {
// // // //                   return Expanded(
// // // //                     child: ElevatedButton.icon(
// // // //                       onPressed: () async {
// // // //                         // Call the addDummySampleApi when button is pressed
// // // //                         await controller.createBiodataApi();
// // // //                         ListView.builder(
// // // //                           itemCount: controller.userData.length,
// // // //                           itemBuilder: (context, index) {
// // // //                             final biodata = controller.userData[index];

// // // //                             return Card(
// // // //                               color: Colors.white,
// // // //                               elevation: 5,
// // // //                               shape: RoundedRectangleBorder(
// // // //                                   borderRadius: BorderRadius.circular(10)),
// // // //                               margin: const EdgeInsets.symmetric(
// // // //                                   vertical: 5, horizontal: 10),
// // // //                               child: Padding(
// // // //                                 padding: const EdgeInsets.symmetric(
// // // //                                     vertical: 8.0, horizontal: 10.0),
// // // //                                 child: Column(
// // // //                                   crossAxisAlignment: CrossAxisAlignment.start,
// // // //                                   children: [
// // // //                                     ListTile(
// // // //                                       leading: CircleAvatar(
// // // //                                         backgroundImage: AssetImage(
// // // //                                             "assets/images/profile.png"),
// // // //                                         radius: 30,
// // // //                                       ),
// // // //                                       title: Text(
// // // //                                         '${biodata.username}',
// // // //                                         style: const TextStyle(
// // // //                                             fontWeight: FontWeight.bold),
// // // //                                       ),
// // // //                                       subtitle: Text(
// // // //                                         'Caste: ${biodata.caste ?? 'Maratha'} \nHeight: ${biodata.height}',
// // // //                                       ),
// // // //                                     ),
// // // //                                     Container(
// // // //                                       color: Colors.grey[200],
// // // //                                       child: Row(
// // // //                                         mainAxisAlignment:
// // // //                                             MainAxisAlignment.spaceAround,
// // // //                                         children: [
// // // //                                           IconButton(
// // // //                                               icon: const Icon(Icons.edit,
// // // //                                                   color: Colors.grey),
// // // //                                               onPressed: () {}),
// // // //                                           IconButton(
// // // //                                             icon: const Icon(Icons.copy,
// // // //                                                 color: Colors.grey),
// // // //                                             onPressed: () {
// // // //                                               // Implement copy functionality if needed
// // // //                                             },
// // // //                                           ),
// // // //                                           IconButton(
// // // //                                             icon: const Icon(Icons.delete,
// // // //                                                 color: Colors.grey),
// // // //                                             onPressed: () {},
// // // //                                           ),
// // // //                                           IconButton(
// // // //                                             icon: const Icon(Icons.file_copy,
// // // //                                                 color: Colors.grey),
// // // //                                             onPressed: () {},
// // // //                                           ),
// // // //                                         ],
// // // //                                       ),
// // // //                                     ),
// // // //                                   ],
// // // //                                 ),
// // // //                               ),
// // // //                             );
// // // //                           },
// // // //                         );
// // // //                       },
// // // //                       icon: const Icon(Icons.add, size: 18),
// // // //                       label: const Text(
// // // //                         'Add Sample',
// // // //                         style: TextStyle(fontSize: 14),
// // // //                       ),
// // // //                       style: ElevatedButton.styleFrom(
// // // //                         backgroundColor: const Color(0xFFFF5507),
// // // //                         foregroundColor: Colors.white,
// // // //                         padding: const EdgeInsets.symmetric(
// // // //                             horizontal: 8, vertical: 10),
// // // //                         shape: RoundedRectangleBorder(
// // // //                             borderRadius: BorderRadius.circular(10)),
// // // //                       ),
// // // //                     ),
// // // //                   );
// // // //                 }),
// // // //               ],
// // // //             ),
// // // //             const SizedBox(height: 15),
// // // //             Expanded(
// // // //               child: Consumer<ShowbiodataController>(
// // // //                 builder: (context, controller, _) {
// // // //                   if (controller.loading) {
// // // //                     return const Center(
// // // //                       child: CircularProgressIndicator(),
// // // //                     );
// // // //                   }

// // // //                   if (controller.userData.isEmpty) {
// // // //                     return const Center(
// // // //                       child: Text('No data available'),
// // // //                     );
// // // //                   }

// // // //                   return ListView.builder(
// // // //                     itemCount: controller.userData.length,
// // // //                     itemBuilder: (context, index) {
// // // //                       final biodata = controller.userData[index];

// // // //                       return Card(
// // // //                         color: Colors.white,
// // // //                         elevation: 5,
// // // //                         shape: RoundedRectangleBorder(
// // // //                             borderRadius: BorderRadius.circular(10)),
// // // //                         margin: const EdgeInsets.symmetric(
// // // //                             vertical: 5, horizontal: 10),
// // // //                         child: Padding(
// // // //                           padding: const EdgeInsets.symmetric(
// // // //                               vertical: 8.0, horizontal: 10.0),
// // // //                           child: Column(
// // // //                             crossAxisAlignment: CrossAxisAlignment.start,
// // // //                             children: [
// // // //                               ListTile(
// // // //                                 leading: CircleAvatar(
// // // //                                   backgroundImage:
// // // //                                       AssetImage("assets/images/profile.png"),
// // // //                                   radius: 30,
// // // //                                 ),
// // // //                                 title: Text(
// // // //                                   '${biodata['username'] ?? 'John'}',
// // // //                                   style: const TextStyle(
// // // //                                       fontWeight: FontWeight.bold),
// // // //                                 ),
// // // //                                 subtitle: Text(
// // // //                                   'Caste: ${biodata['caste'] ?? 'Maratha'} \nHeight: ${biodata['height']}',
// // // //                                 ),
// // // //                               ),
// // // //                               Container(
// // // //                                 color: Colors.grey[200],
// // // //                                 child: Row(
// // // //                                   mainAxisAlignment:
// // // //                                       MainAxisAlignment.spaceAround,
// // // //                                   children: [
// // // //                                     IconButton(
// // // //                                       icon: const Icon(Icons.edit,
// // // //                                           color: Colors.grey),
// // // //                                       onPressed: () {
// // // //                                         // Implement edit functionality
// // // //                                         Navigator.push(
// // // //                                           context,
// // // //                                           MaterialPageRoute(
// // // //                                             builder: (context) =>
// // // //                                                 AllDetailsPage(),
// // // //                                           ),
// // // //                                         );
// // // //                                       },
// // // //                                     ),
// // // //                                     IconButton(
// // // //                                       icon: const Icon(Icons.copy,
// // // //                                           color: Colors.grey),
// // // //                                       onPressed: () {
// // // //                                         // Implement copy functionality if needed
// // // //                                       },
// // // //                                     ),
// // // //                                     IconButton(
// // // //                                       icon: const Icon(Icons.delete,
// // // //                                           color: Colors.grey),
// // // //                                       onPressed: () {
// // // //                                         // _showDeleteConfirmationDialog(
// // // //                                         //   context,
// // // //                                         //   biodata['id']?.toString(),
// // // //                                         // );
// // // //                                       },
// // // //                                     ),
// // // //                                     IconButton(
// // // //                                       icon: const Icon(Icons.file_copy,
// // // //                                           color: Colors.grey),
// // // //                                       onPressed: () {
// // // //                                         // Implement template change functionality
// // // //                                         Navigator.push(
// // // //                                           context,
// // // //                                           MaterialPageRoute(
// // // //                                             builder: (context) =>
// // // //                                                 TemplateSelectionPage(
// // // //                                                     id: (biodata['id'] ?? '')
// // // //                                                         .toString()),
// // // //                                           ),
// // // //                                         );
// // // //                                       },
// // // //                                     ),
// // // //                                   ],
// // // //                                 ),
// // // //                               ),
// // // //                             ],
// // // //                           ),
// // // //                         ),
// // // //                       );
// // // //                     },
// // // //                   );
// // // //                 },
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // // //     Expanded(
// // // // //       child: ElevatedButton.icon(
// // // // //         onPressed: () {
// // // // //           // Navigate to AllDetailsPage to create a new biodata
// // // // //           Navigator.push(
// // // // //             context,
// // // // //             MaterialPageRoute(
// // // // //               builder: (context) => AllDetailsPage(),
// // // // //             ),
// // // // //           );
// // // // //         },
// // // // //         icon: const Icon(Icons.brush, size: 18),
// // // // //         label: const Text(
// // // // //           'Create Biodata',
// // // // //           style: TextStyle(fontSize: 14),
// // // // //         ),
// // // // //         style: ElevatedButton.styleFrom(
// // // // //           backgroundColor: Colors.red,
// // // // //           foregroundColor: Colors.white,
// // // // //           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
// // // // //           shape: RoundedRectangleBorder(
// // // // //             borderRadius: BorderRadius.circular(8),
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     ),
// // // // //     const SizedBox(width: 8),

// // // // //     // Button to Add Sample and Update List
// // // // //     Consumer<HomeScreenController>(
// // // // //       builder: (context, controller, _) {
// // // // //         return Expanded(
// // // // //           child: ElevatedButton.icon(
// // // // //             onPressed: () async {
// // // // //               // Call the addDummySampleApi to create a new sample
// // // // //               await controller.createBiodataApi();

// // // // //               // After adding the new sample, fetch the updated biodata list
// // // // //               final biodataController = Provider.of<ShowbiodataController>(context, listen: false);
// // // // //               await biodataController.fetchBiodata();
// // // // //             },
// // // // //             icon: const Icon(Icons.add, size: 18),
// // // // //             label: const Text(
// // // // //               'Add Sample',
// // // // //               style: TextStyle(fontSize: 14),
// // // // //             ),
// // // // //             style: ElevatedButton.styleFrom(
// // // // //               backgroundColor: const Color(0xFFFF5507),
// // // // //               foregroundColor: Colors.white,
// // // // //               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
// // // // //               shape: RoundedRectangleBorder(
// // // // //                 borderRadius: BorderRadius.circular(10),
// // // // //               ),
// // // // //             ),
// // // // //           ),
// // // // //         );
// // // // //       },
// // // // //     ),
// // // // //   ],
// // // // // ),
// // // // // const SizedBox(height: 15),

// // // // // // Displaying the Biodata List
// // // // // Expanded(
// // // // //   child: Consumer<ShowbiodataController>(
// // // // //     builder: (context, controller, _) {
// // // // //       // Show loading indicator while data is being fetched
// // // // //       if (controller.loading) {
// // // // //         return const Center(
// // // // //           child: CircularProgressIndicator(),
// // // // //         );
// // // // //       }

// // // // //       // If no biodata is available, show a message
// // // // //       if (controller.userData.isEmpty) {
// // // // //         return const Center(
// // // // //           child: Text('No data available'),
// // // // //         );
// // // // //       }

// // // // //       // Show the biodata list
// // // // //       return ListView.builder(
// // // // //         itemCount: controller.userData.length,
// // // // //         itemBuilder: (context, index) {
// // // // //           final biodata = controller.userData[index];

// // // // //           return Card(
// // // // //             color: Colors.white,
// // // // //             elevation: 5,
// // // // //             shape: RoundedRectangleBorder(
// // // // //               borderRadius: BorderRadius.circular(10),
// // // // //             ),
// // // // //             margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
// // // // //             child: Padding(
// // // // //               padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
// // // // //               child: Column(
// // // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                 children: [
// // // // //                   ListTile(
// // // // //                     leading: CircleAvatar(
// // // // //                       backgroundImage: AssetImage("assets/images/profile.png"),
// // // // //                       radius: 30,
// // // // //                     ),
// // // // //                     title: Text(
// // // // //                       '${biodata['username'] ?? 'John'}',
// // // // //                       style: const TextStyle(fontWeight: FontWeight.bold),
// // // // //                     ),
// // // // //                     subtitle: Text(
// // // // //                       'Caste: ${biodata['caste'] ?? 'Maratha'} \nHeight: ${biodata['height']}',
// // // // //                     ),
// // // // //                   ),
// // // // //                   Container(
// // // // //                     color: Colors.grey[200],
// // // // //                     child: Row(
// // // // //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // // //                       children: [
// // // // //                         IconButton(
// // // // //                           icon: const Icon(Icons.edit, color: Colors.grey),
// // // // //                           onPressed: () {
// // // // //                             // Edit functionality
// // // // //                             Navigator.push(
// // // // //                               context,
// // // // //                               MaterialPageRoute(
// // // // //                                 builder: (context) => AllDetailsPage(),
// // // // //                               ),
// // // // //                             );
// // // // //                           },
// // // // //                         ),
// // // // //                         IconButton(
// // // // //                           icon: const Icon(Icons.copy, color: Colors.grey),
// // // // //                           onPressed: () {
// // // // //                             // Implement copy functionality
// // // // //                           },
// // // // //                         ),
// // // // //                         IconButton(
// // // // //                           icon: const Icon(Icons.delete, color: Colors.grey),
// // // // //                           onPressed: () {
// // // // //                             // _showDeleteConfirmationDialog(
// // // // //                             //   context,
// // // // //                             //   biodata['id']?.toString(),
// // // // //                             // );
// // // // //                           },
// // // // //                         ),
// // // // //                         IconButton(
// // // // //                           icon: const Icon(Icons.file_copy, color: Colors.grey),
// // // // //                           onPressed: () {
// // // // //                             // Template change functionality
// // // // //                             Navigator.push(
// // // // //                               context,
// // // // //                               MaterialPageRoute(
// // // // //                                 builder: (context) => TemplateSelectionPage(
// // // // //                                   id: (biodata['id'] ?? '').toString(),
// // // // //                                 ),
// // // // //                               ),
// // // // //                             );
// // // // //                           },
// // // // //                         ),
// // // // //                       ],
// // // // //                     ),
// // // // //                   );
// // // // //               )
// // // // //               );
// // // // //         }

// // // //   // Widget _buildBioOptionButton(
// // // //   //     IconData icon, String label, VoidCallback onPressed) {
// // // //   //   return Column(
// // // //   //     children: [
// // // //   //       IconButton(
// // // //   //         icon: Icon(icon, color: Colors.grey[700]),
// // // //   //         onPressed: onPressed,
// // // //   //       ),
// // // //   //       Text(label, style: TextStyle(color: Colors.grey[700])),
// // // //   //     ],
// // // //   //   );
// // // //   // }

// // // // // void _showDeleteConfirmationDialog(BuildContext context, String? id) {
// // // // //   showDialog(
// // // // //     context: context,
// // // // //     builder: (context) {
// // // // //       return AlertDialog(
// // // // //         title: const Text('Delete Biodata'),
// // // // //         content: const Text(
// // // // //             'Are you sure you want to delete this biodata? This action cannot be undone.'),
// // // // //         actions: [
// // // // //           TextButton(
// // // // //             onPressed: () {
// // // // //               Navigator.of(context).pop(); // Close the dialog
// // // // //             },
// // // // //             child: const Text('Cancel'),
// // // // //           ),
// // // // //           TextButton(
// // // // //             onPressed: () async {
// // // // //               // Confirm deletion
// // // // //               Navigator.of(context).pop(); // Close the dialog

// // // // //               // Check if id and authToken are valid
// // // // //               if (id != null && _authToken != null) {
// // // // //                 // Access the DeleteTemplateController
// // // // //                 final controller = Provider.of<Home>(
// // // // //                     context, listen: false);

// // // // //                 // Call the delete API method
// // // // //                 await controller.deleteBiodata(id, _authToken);

// // // // //                 // Ensure the widget is still mounted before proceeding
// // // // //                 if (!mounted) return;

// // // // //                 // Handle success or error messages from the controller
// // // // //                 if (controller.errorMessage != null) {
// // // // //                   ScaffoldMessenger.of(context).showSnackBar(
// // // // //                     SnackBar(content: Text(controller.errorMessage!)),
// // // // //                   );
// // // // //                 } else if (controller.successMessage != null) {
// // // // //                   ScaffoldMessenger.of(context).showSnackBar(
// // // // //                     SnackBar(content: Text(controller.successMessage!)),
// // // // //                   );

// // // // //                   // After successful deletion, refresh the biodata list
// // // // //                   final biodataController = Provider.of<ShowbiodataController>(
// // // // //                       context, listen: false);
// // // // //                   await biodataController.fetchBiodata();
// // // // //                 }
// // // // //               }
// // // // //             },
// // // // //             child: const Text('Delete'),
// // // // //           ),
// // // // //         ],
// // // // //       );
// // // // //     },
// // // // //   );
// // // // // }

// // // // // }

// // // // // import 'package:bio_data/controller/showbiodata_controller.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:provider/provider.dart';

// // // // // import '../../controller/home_screen_controller.dart';
// // // // // import '../AllDetailsPage.dart';
// // // // // import '../template_selection_page.dart';

// // // // // class HomePage extends StatefulWidget {
// // // // //   @override
// // // // //   _HomePageState createState() => _HomePageState();
// // // // // }

// // // // // class _HomePageState extends State<HomePage> {
// // // // //   @override
// // // // //   void initState() {
// // // // //     super.initState();

// // // // //     // Fetch biodata list when the screen loads
// // // // //     final showBiodataController =
// // // // //         Provider.of<ShowbiodataController>(context, listen: false);
// // // // //     showBiodataController.fetchBiodata();
// // // // //   }

// // // // //   bool sampleTrigger = false;

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         title: const Text('Biodata List'),
// // // // //       ),
// // // // //       body: Column(
// // // // //         children: [
// // // // //           // Buttons for creating and adding samples
// // // // //           Row(
// // // // //             children: [
// // // // //               Expanded(
// // // // //                 child: ElevatedButton.icon(
// // // // //                   onPressed: () {
// // // // //                     // Navigate to AllDetailsPage to create a new biodata
// // // // //                     Navigator.push(
// // // // //                       context,
// // // // //                       MaterialPageRoute(
// // // // //                         builder: (context) => AllDetailsPage(),
// // // // //                       ),
// // // // //                     );
// // // // //                   },
// // // // //                   icon: const Icon(Icons.brush, size: 18),
// // // // //                   label: const Text(
// // // // //                     'Create Biodata',
// // // // //                     style: TextStyle(fontSize: 14),
// // // // //                   ),
// // // // //                   style: ElevatedButton.styleFrom(
// // // // //                     backgroundColor: Colors.red,
// // // // //                     foregroundColor: Colors.white,
// // // // //                     padding:
// // // // //                         const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
// // // // //                     shape: RoundedRectangleBorder(
// // // // //                       borderRadius: BorderRadius.circular(8),
// // // // //                     ),
// // // // //                   ),
// // // // //                 ),
// // // // //               ),
// // // // //               const SizedBox(width: 8),

// // // // //               // Button to Add Sample and Update List
// // // // //               Consumer<HomeScreenController>(
// // // // //                 builder: (context, controller, _) {
// // // // //                   return Expanded(
// // // // //                     child: ElevatedButton.icon(
// // // // //                       onPressed: () async {
// // // // //                         setState(() {
// // // // //                           sampleTrigger = true;
// // // // //                         });
// // // // //                         // Call the createBiodataApi to create a new sample
// // // // //                         await controller.createBiodataApi();

// // // // //                         // After adding the new sample, fetch the updated biodata list
// // // // //                         final biodataController =
// // // // //                             Provider.of<ShowbiodataController>(context,
// // // // //                                 listen: false);
// // // // //                         await biodataController.fetchBiodata();
// // // // //                       },
// // // // //                       icon: const Icon(Icons.add, size: 18),
// // // // //                       label: const Text(
// // // // //                         'Add Sample',
// // // // //                         style: TextStyle(fontSize: 14),
// // // // //                       ),
// // // // //                       style: ElevatedButton.styleFrom(
// // // // //                         backgroundColor: const Color(0xFFFF5507),
// // // // //                         foregroundColor: Colors.white,
// // // // //                         padding: const EdgeInsets.symmetric(
// // // // //                             horizontal: 8, vertical: 10),
// // // // //                         shape: RoundedRectangleBorder(
// // // // //                           borderRadius: BorderRadius.circular(10),
// // // // //                         ),
// // // // //                       ),
// // // // //                     ),
// // // // //                   );
// // // // //                 },
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //           const SizedBox(height: 15),

// // // // //           // Displaying the Biodata List
// // // // //           Expanded(
// // // // //             child: Consumer<ShowbiodataController>(
// // // // //               builder: (context, controller, _) {
// // // // //                 // Show loading indicator while data is being fetched
// // // // //                 if (controller.loading) {
// // // // //                   return const Center(
// // // // //                     child: CircularProgressIndicator(),
// // // // //                   );
// // // // //                 }

// // // // //                 // If no biodata is available, show a message
// // // // //                 if (controller.userData.isEmpty) {
// // // // //                   return const Center(
// // // // //                     child: Text('No data available'),
// // // // //                   );
// // // // //                 }

// // // // //                 // Show the biodata list
// // // // //                 return ListView.builder(
// // // // //                   itemCount: controller.userData.length,
// // // // //                   itemBuilder: (context, index) {
// // // // //                     final biodata = controller.userData[index];

// // // // //                     return Card(
// // // // //                       color: Colors.white,
// // // // //                       elevation: 5,
// // // // //                       shape: RoundedRectangleBorder(
// // // // //                         borderRadius: BorderRadius.circular(10),
// // // // //                       ),
// // // // //                       margin: const EdgeInsets.symmetric(
// // // // //                           vertical: 5, horizontal: 10),
// // // // //                       child: Padding(
// // // // //                         padding: const EdgeInsets.symmetric(
// // // // //                             vertical: 8.0, horizontal: 10.0),
// // // // //                         child: Column(
// // // // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                           children: [
// // // // //                             ListTile(
// // // // //                               leading: CircleAvatar(
// // // // //                                 backgroundImage:
// // // // //                                     AssetImage("assets/images/profile.png"),
// // // // //                                 radius: 30,
// // // // //                               ),
// // // // //                               title: Text(
// // // // //                                 '${biodata['username'] ?? 'John'}',
// // // // //                                 style: const TextStyle(
// // // // //                                     fontWeight: FontWeight.bold),
// // // // //                               ),
// // // // //                               subtitle: Text(
// // // // //                                 'Caste: ${biodata['caste'] ?? 'Maratha'} \nHeight: ${biodata['height']}',
// // // // //                               ),
// // // // //                             ),
// // // // //                             Container(
// // // // //                               color: Colors.grey[200],
// // // // //                               child: Row(
// // // // //                                 mainAxisAlignment:
// // // // //                                     MainAxisAlignment.spaceAround,
// // // // //                                 children: [
// // // // //                                   IconButton(
// // // // //                                     icon: const Icon(Icons.edit,
// // // // //                                         color: Colors.grey),
// // // // //                                     onPressed: () {
// // // // //                                       // Edit functionality
// // // // //                                       Navigator.push(
// // // // //                                         context,
// // // // //                                         MaterialPageRoute(
// // // // //                                           builder: (context) =>
// // // // //                                               AllDetailsPage(),
// // // // //                                         ),
// // // // //                                       );
// // // // //                                     },
// // // // //                                   ),
// // // // //                                   IconButton(
// // // // //                                     icon: const Icon(Icons.copy,
// // // // //                                         color: Colors.grey),
// // // // //                                     onPressed: () {
// // // // //                                       // Implement copy functionality
// // // // //                                     },
// // // // //                                   ),
// // // // //                                   IconButton(
// // // // //                                     icon: const Icon(Icons.delete,
// // // // //                                         color: Colors.grey),
// // // // //                                     onPressed: () {
// // // // //                                       // Implement delete functionality
// // // // //                                       // _showDeleteConfirmationDialog(context, biodata['id']?.toString());
// // // // //                                     },
// // // // //                                   ),
// // // // //                                   IconButton(
// // // // //                                     icon: const Icon(Icons.file_copy,
// // // // //                                         color: Colors.grey),
// // // // //                                     onPressed: () {
// // // // //                                       // Template change functionality
// // // // //                                       Navigator.push(
// // // // //                                         context,
// // // // //                                         MaterialPageRoute(
// // // // //                                           builder: (context) =>
// // // // //                                               TemplateSelectionPage(
// // // // //                                             id: (biodata['id'] ?? '')
// // // // //                                                 .toString(),
// // // // //                                           ),
// // // // //                                         ),
// // // // //                                       );
// // // // //                                     },
// // // // //                                   ),
// // // // //                                 ],
// // // // //                               ),
// // // // //                             ),
// // // // //                           ],
// // // // //                         ),
// // // // //                       ),
// // // // //                     );
// // // // //                   },
// // // // //                 );
// // // // //               },
// // // // //             ),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   // Example function for showing a delete confirmation dialog
// // // // //   // void _showDeleteConfirmationDialog(BuildContext context, String? biodataId) {
// // // // //   //   showDialog(
// // // // //   //     context: context,
// // // // //   //     builder: (BuildContext context) {
// // // // //   //       return AlertDialog(
// // // // //   //         title: const Text('Confirm Delete'),
// // // // //   //         content: const Text('Are you sure you want to delete this biodata?'),
// // // // //   //         actions: [
// // // // //   //           TextButton(
// // // // //   //             onPressed: () {
// // // // //   //               Navigator.of(context).pop();
// // // // //   //             },
// // // // //   //             child: const Text('Cancel'),
// // // // //   //           ),
// // // // //   //           TextButton(
// // // // //   //             onPressed: () {
// // // // //   //               // Call the delete functionality and pass the biodataId
// // // // //   //               final controller = Provider.of<ShowbiodataController>(context, listen: false);
// // // // //   //               controller.deleteBiodata(biodataId);
// // // // //   //               Navigator.of(context).pop();
// // // // //   //             },
// // // // //   //             child: const Text('Delete'),
// // // // //   //           ),
// // // // //   //         ],
// // // // //   //       );
// // // // //   //     },
// // // // //   //   );
// // // // //   // }
// // // // // }
// // // // }

// // // // import 'dart:convert';
// // // // import 'package:bio_data/controller/home_screen_controller.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:http/http.dart' as http;
// // // // import 'package:intl/intl.dart';
// // // // import 'package:provider/provider.dart';
// // // // import 'package:share_plus/share_plus.dart';
// // // // import 'package:shared_preferences/shared_preferences.dart';
// // // // import '../../controller/delete_templet_controller.dart';
// // // // import '../../controller/showbiodata_controller.dart';
// // // // import '../../request/add_dummy_sample.dart';
// // // // import '../AllDetailsPage.dart';
// // // // import '../login_form.dart';
// // // // import '../template_selection_page.dart';

// // // // class HomePage extends StatefulWidget {
// // // //   const HomePage({super.key});

// // // //   @override
// // // //   _HomePageState createState() => _HomePageState();
// // // // }

// // // // class _HomePageState extends State<HomePage>
// // // //     with SingleTickerProviderStateMixin {
// // // //   late TabController _tabController;
// // // //   String? _authToken;

// // // //   Future<void> _getMatriIdAndFetchBiodata() async {
// // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // //     String? matriId =
// // // //         prefs.getString('matri_id'); // Assuming 'matri_id' is stored

// // // //     if (matriId != null) {
// // // //       await _fetchBiodataInfo(matriId);
// // // //     } else {
// // // //       print('matriId is null. Unable to fetch biodata.');
// // // //     }
// // // //   }

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _tabController = TabController(length: 6, vsync: this);
// // // //     _getAuthToken();
// // // //     _getMatriIdAndFetchBiodata();
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _tabController.dispose();
// // // //     super.dispose();
// // // //   }

// // // //   Future<void> _getAuthToken() async {
// // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // //     setState(() {
// // // //       _authToken = prefs.getString('token_key');
// // // //     });
// // // //   }

// // // //   Future<void> _fetchBiodataInfo(String matriId) async {
// // // //     final controller =
// // // //         Provider.of<ShowbiodataController>(context, listen: false);
// // // //     await controller.fetchBiodata(); // Fetch biodata using the controller
// // // //   }

// // // //   void _handleMenuItemClick(String value) {
// // // //     switch (value) {
// // // //       case 'share':
// // // //         _shareApp();
// // // //         break;
// // // //       case 'RateApp':
// // // //         _rateApp();
// // // //         break;
// // // //       case 'delete':
// // // //         _showDeleteAccountConfirmation(context);
// // // //         break;
// // // //       case 'logout':
// // // //         _handleLogout(context);
// // // //         break;
// // // //     }
// // // //   }

// // // //   _rateApp() {
// // // //     // Functionality to rate the app
// // // //   }

// // // //   Future<void> _handleLogout(context) async {
// // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // //     await prefs.remove('token_key');
// // // //     await prefs.remove('matri_id');
// // // //     await prefs.setBool('isLoggedIn', false);
// // // //     Navigator.of(context).pushAndRemoveUntil(
// // // //       MaterialPageRoute(builder: (context) => LoginForm(onLoginSuccess: () {})),
// // // //       (Route<dynamic> route) => false,
// // // //     );
// // // //   }

// // // //   void _shareApp() {
// // // //     const String appLink = 'https://Instagram.com';
// // // //     const String message = 'Check out this awesome app: $appLink';
// // // //     Share.share(message);
// // // //   }

// // // //   void _showDeleteAccountConfirmation(context) {
// // // //     showDialog(
// // // //       context: context,
// // // //       builder: (BuildContext context) {
// // // //         return AlertDialog(
// // // //           title: const Text('Delete Account'),
// // // //           content: const Text(
// // // //               'Are you sure you want to delete your account? This action cannot be undone.'),
// // // //           actions: <Widget>[
// // // //             TextButton(
// // // //               child: const Text('Cancel'),
// // // //               onPressed: () {
// // // //                 Navigator.of(context).pop();
// // // //               },
// // // //             ),
// // // //             TextButton(
// // // //               child: const Text('Delete'),
// // // //               onPressed: () async {
// // // //                 Navigator.of(context).pop();
// // // //                 await _deleteAccount(context);
// // // //               },
// // // //             ),
// // // //           ],
// // // //         );
// // // //       },
// // // //     );
// // // //   }

// // // //   Future<void> _deleteAccount(context) async {
// // // //     final url = Uri.parse(
// // // //         'https://techfluxsolutions.com/royal_maratha/api/users/delete');

// // // //     try {
// // // //       final response = await http.delete(
// // // //         url,
// // // //         headers: {'Authorization': 'Bearer $_authToken'},
// // // //       );

// // // //       if (response.statusCode == 200) {
// // // //         final data = json.decode(response.body);
// // // //         bool success = data['success'] ?? false;

// // // //         if (success) {
// // // //           SharedPreferences prefs = await SharedPreferences.getInstance();
// // // //           await prefs.clear();
// // // //           Navigator.of(context).pushReplacementNamed('/login');
// // // //         } else {
// // // //           String message = data['message'] ?? 'Failed to delete account';
// // // //           ScaffoldMessenger.of(context)
// // // //               .showSnackBar(SnackBar(content: Text(message)));
// // // //         }
// // // //       } else {
// // // //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// // // //             content: Text('Failed to delete account: ${response.statusCode}')));
// // // //       }
// // // //     } catch (e) {
// // // //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// // // //           content: Text('An error occurred while deleting account')));
// // // //     }
// // // //   }

// // // //   String formatDate(String? date) {
// // // //     if (date == null) return ''; // Handle null case
// // // //     try {
// // // //       // Parse the incoming date in 'yyyy-MM-dd HH:mm:ss' format
// // // //       DateTime parsedDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(date);
// // // //       // Format it to 'dd-MM-yyyy' (e.g., 12-06-2000)
// // // //       return DateFormat('dd-MM-yyyy').format(parsedDate);
// // // //     } catch (e) {
// // // //       return date; // Return original date if parsing fails
// // // //     }
// // // //   }

// // // //   // Future<void> _deleteBiodata(String? id) async {
// // // //   //   if (id == null) return; // Check if id is null before proceeding
// // // //   //   final controller =
// // // //   //       Provider.of<DeleteTemplateController>(context, listen: false);
// // // //   //   await controller.deleteBiodata(id, _authToken);

// // // //   //   if (controller.errorMessage != null) {
// // // //   //     ScaffoldMessenger.of(context).showSnackBar(
// // // //   //       SnackBar(content: Text(controller.errorMessage!)),
// // // //   //     );
// // // //   //   } else if (controller.successMessage != null) {
// // // //   //     ScaffoldMessenger.of(context).showSnackBar(
// // // //   //       SnackBar(content: Text(controller.successMessage!)),
// // // //   //     );

// // // //   //     // Optionally, refresh the biodata list after deletion
// // // //   //     final biodataController =
// // // //   //         Provider.of<ShowbiodataController>(context, listen: false);
// // // //   //     await biodataController.fetchBiodata();
// // // //   //   }
// // // //   // }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: const Text(
// // // //           'Biodata Maker',
// // // //           style: TextStyle(
// // // //               fontSize: 26.0, fontWeight: FontWeight.bold, color: Colors.white),
// // // //           textAlign: TextAlign.center,
// // // //         ),
// // // //         backgroundColor: const Color(0xFFFF5508),
// // // //         actions: [
// // // //           PopupMenuButton<String>(
// // // //             color: Colors.white,
// // // //             onSelected: _handleMenuItemClick,
// // // //             itemBuilder: (BuildContext context) {
// // // //               return [
// // // //                 const PopupMenuItem(value: 'share', child: Text('Share App')),
// // // //                 const PopupMenuItem(value: 'RateApp', child: Text('Rate App')),
// // // //                 const PopupMenuItem(
// // // //                     value: 'delete', child: Text('Delete Account')),
// // // //                 const PopupMenuItem(value: 'logout', child: Text('Logout')),
// // // //               ];
// // // //             },
// // // //             icon: const Icon(Icons.menu, color: Colors.white),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //       body: Padding(
// // // //         padding: const EdgeInsets.symmetric(horizontal: 10),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: <Widget>[
// // // //             const SizedBox(height: 8),
// // // //             Row(
// // // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //               children: [
// // // //                 Expanded(
// // // //                   child: ElevatedButton.icon(
// // // //                     onPressed: () {
// // // //                       Navigator.push(
// // // //                         context,
// // // //                         MaterialPageRoute(
// // // //                             builder: (context) => AllDetailsPage()),
// // // //                       );
// // // //                     },
// // // //                     icon: const Icon(Icons.brush, size: 18),
// // // //                     label: const Text(
// // // //                       'Create Biodata',
// // // //                       style: TextStyle(fontSize: 14),
// // // //                     ),
// // // //                     style: ElevatedButton.styleFrom(
// // // //                       backgroundColor: Colors.red,
// // // //                       foregroundColor: Colors.white,
// // // //                       padding: const EdgeInsets.symmetric(
// // // //                           horizontal: 8, vertical: 10),
// // // //                       shape: RoundedRectangleBorder(
// // // //                         borderRadius: BorderRadius.circular(8),
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //                 const SizedBox(width: 8),
// // // //                 Consumer<HomeScreenController>(
// // // //                     builder: (context, controller, _) {
// // // //                   return Expanded(
// // // //                     child: ElevatedButton.icon(
// // // //                       onPressed: () async {
// // // //                         // Call the addDummySampleApi when button is pressed
// // // //                         await controller.createBiodataApi();
// // // //                         ListView.builder(
// // // //                           itemCount: controller.userData.length,
// // // //                           itemBuilder: (context, index) {
// // // //                             final biodata = controller.userData[index];

// // // //                             return Card(
// // // //                               color: Colors.white,
// // // //                               elevation: 5,
// // // //                               shape: RoundedRectangleBorder(
// // // //                                   borderRadius: BorderRadius.circular(10)),
// // // //                               margin: const EdgeInsets.symmetric(
// // // //                                   vertical: 5, horizontal: 10),
// // // //                               child: Padding(
// // // //                                 padding: const EdgeInsets.symmetric(
// // // //                                     vertical: 8.0, horizontal: 10.0),
// // // //                                 child: Column(
// // // //                                   crossAxisAlignment: CrossAxisAlignment.start,
// // // //                                   children: [
// // // //                                     ListTile(
// // // //                                       leading: CircleAvatar(
// // // //                                         backgroundImage: AssetImage(
// // // //                                             "assets/images/profile.png"),
// // // //                                         radius: 30,
// // // //                                       ),
// // // //                                       title: Text(
// // // //                                         '${biodata.username}',
// // // //                                         style: const TextStyle(
// // // //                                             fontWeight: FontWeight.bold),
// // // //                                       ),
// // // //                                       subtitle: Text(
// // // //                                         'Caste: ${biodata.caste ?? 'Maratha'} \nHeight: ${biodata.height}',
// // // //                                       ),
// // // //                                     ),
// // // //                                     Container(
// // // //                                       color: Colors.grey[200],
// // // //                                       child: Row(
// // // //                                         mainAxisAlignment:
// // // //                                             MainAxisAlignment.spaceAround,
// // // //                                         children: [
// // // //                                           IconButton(
// // // //                                               icon: const Icon(Icons.edit,
// // // //                                                   color: Colors.grey),
// // // //                                               onPressed: () {}),
// // // //                                           IconButton(
// // // //                                             icon: const Icon(Icons.copy,
// // // //                                                 color: Colors.grey),
// // // //                                             onPressed: () {
// // // //                                               // Implement copy functionality if needed
// // // //                                             },
// // // //                                           ),
// // // //                                           IconButton(
// // // //                                             icon: const Icon(Icons.delete,
// // // //                                                 color: Colors.grey),
// // // //                                             onPressed: () {},
// // // //                                           ),
// // // //                                           IconButton(
// // // //                                             icon: const Icon(Icons.file_copy,
// // // //                                                 color: Colors.grey),
// // // //                                             onPressed: () {},
// // // //                                           ),
// // // //                                         ],
// // // //                                       ),
// // // //                                     ),
// // // //                                   ],
// // // //                                 ),
// // // //                               ),
// // // //                             );
// // // //                           },
// // // //                         );
// // // //                       },
// // // //                       icon: const Icon(Icons.add, size: 18),
// // // //                       label: const Text(
// // // //                         'Add Sample',
// // // //                         style: TextStyle(fontSize: 14),
// // // //                       ),
// // // //                       style: ElevatedButton.styleFrom(
// // // //                         backgroundColor: const Color(0xFFFF5507),
// // // //                         foregroundColor: Colors.white,
// // // //                         padding: const EdgeInsets.symmetric(
// // // //                             horizontal: 8, vertical: 10),
// // // //                         shape: RoundedRectangleBorder(
// // // //                             borderRadius: BorderRadius.circular(10)),
// // // //                       ),
// // // //                     ),
// // // //                   );
// // // //                 }),
// // // //               ],
// // // //             ),
// // // //             const SizedBox(height: 15),
// // // //             Expanded(
// // // //               child: Consumer<ShowbiodataController>(
// // // //                 builder: (context, controller, _) {
// // // //                   if (controller.loading) {
// // // //                     return const Center(
// // // //                       child: CircularProgressIndicator(),
// // // //                     );
// // // //                   }

// // // //                   if (controller.userData.isEmpty) {
// // // //                     return const Center(
// // // //                       child: Text('No data available'),
// // // //                     );
// // // //                   }

// // // //                   return ListView.builder(
// // // //                     itemCount: controller.userData.length,
// // // //                     itemBuilder: (context, index) {
// // // //                       final biodata = controller.userData[index];

// // // //                       return Card(
// // // //                         color: Colors.white,
// // // //                         elevation: 5,
// // // //                         shape: RoundedRectangleBorder(
// // // //                             borderRadius: BorderRadius.circular(10)),
// // // //                         margin: const EdgeInsets.symmetric(
// // // //                             vertical: 5, horizontal: 10),
// // // //                         child: Padding(
// // // //                           padding: const EdgeInsets.symmetric(
// // // //                               vertical: 8.0, horizontal: 10.0),
// // // //                           child: Column(
// // // //                             crossAxisAlignment: CrossAxisAlignment.start,
// // // //                             children: [
// // // //                               ListTile(
// // // //                                 leading: CircleAvatar(
// // // //                                   backgroundImage:
// // // //                                       AssetImage("assets/images/profile.png"),
// // // //                                   radius: 30,
// // // //                                 ),
// // // //                                 title: Text(
// // // //                                   '${biodata['username'] ?? 'John'}',
// // // //                                   style: const TextStyle(
// // // //                                       fontWeight: FontWeight.bold),
// // // //                                 ),
// // // //                                 subtitle: Text(
// // // //                                   'Caste: ${biodata['caste'] ?? 'Maratha'} \nHeight: ${biodata['height']}',
// // // //                                 ),
// // // //                               ),
// // // //                               Container(
// // // //                                 color: Colors.grey[200],
// // // //                                 child: Row(
// // // //                                   mainAxisAlignment:
// // // //                                       MainAxisAlignment.spaceAround,
// // // //                                   children: [
// // // //                                     IconButton(
// // // //                                       icon: const Icon(Icons.edit,
// // // //                                           color: Colors.grey),
// // // //                                       onPressed: () {
// // // //                                         // Implement edit functionality
// // // //                                         Navigator.push(
// // // //                                           context,
// // // //                                           MaterialPageRoute(
// // // //                                             builder: (context) =>
// // // //                                                 AllDetailsPage(),
// // // //                                           ),
// // // //                                         );
// // // //                                       },
// // // //                                     ),
// // // //                                     IconButton(
// // // //                                       icon: const Icon(Icons.copy,
// // // //                                           color: Colors.grey),
// // // //                                       onPressed: () {
// // // //                                         // Implement copy functionality if needed
// // // //                                       },
// // // //                                     ),
// // // //                                     IconButton(
// // // //                                       icon: const Icon(Icons.delete,
// // // //                                           color: Colors.grey),
// // // //                                       onPressed: () {
// // // //                                         // _showDeleteConfirmationDialog(
// // // //                                         //   context,
// // // //                                         //   biodata['id']?.toString(),
// // // //                                         // );
// // // //                                       },
// // // //                                     ),
// // // //                                     IconButton(
// // // //                                       icon: const Icon(Icons.file_copy,
// // // //                                           color: Colors.grey),
// // // //                                       onPressed: () {
// // // //                                         // Implement template change functionality
// // // //                                         Navigator.push(
// // // //                                           context,
// // // //                                           MaterialPageRoute(
// // // //                                             builder: (context) =>
// // // //                                                 TemplateSelectionPage(
// // // //                                                     id: (biodata['id'] ?? '')
// // // //                                                         .toString()),
// // // //                                           ),
// // // //                                         );
// // // //                                       },
// // // //                                     ),
// // // //                                   ],
// // // //                                 ),
// // // //                               ),
// // // //                             ],
// // // //                           ),
// // // //                         ),
// // // //                       );
// // // //                     },
// // // //                   );
// // // //                 },
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   // Widget _buildBioOptionButton(
// // // //   //     IconData icon, String label, VoidCallback onPressed) {
// // // //   //   return Column(
// // // //   //     children: [
// // // //   //       IconButton(
// // // //   //         icon: Icon(icon, color: Colors.grey[700]),
// // // //   //         onPressed: onPressed,
// // // //   //       ),
// // // //   //       Text(label, style: TextStyle(color: Colors.grey[700])),
// // // //   //     ],
// // // //   //   );
// // // //   // }

// // // //   // void _showDeleteConfirmationDialog(BuildContext context, String? id) {
// // // //   //   showDialog(
// // // //   //     context: context,
// // // //   //     builder: (context) {
// // // //   //       return AlertDialog(
// // // //   //         title: const Text('Delete Biodata'),
// // // //   //         content: const Text(
// // // //   //             'Are you sure you want to delete this biodata? This action cannot be undone.'),
// // // //   //         actions: [
// // // //   //           TextButton(
// // // //   //             onPressed: () {
// // // //   //               Navigator.of(context).pop(); // Close the dialog
// // // //   //             },
// // // //   //             child: const Text('Cancel'),
// // // //   //           ),
// // // //   //           TextButton(
// // // //   //             onPressed: () async {
// // // //   //               // Confirm deletion
// // // //   //               Navigator.of(context).pop(); // Close the dialog
// // // //   //               if (id != null && _authToken != null) {
// // // //   //                 final controller = Provider.of<DeleteTemplateController>(
// // // //   //                     context,
// // // //   //                     listen: false);
// // // //   //                 await controller.deleteBiodata(id, _authToken);

// // // //   //                 // Ensure the widget is still mounted
// // // //   //                 if (!mounted) return;

// // // //   //                 // Now you can safely access context
// // // //   //                 if (controller.errorMessage != null) {
// // // //   //                   ScaffoldMessenger.of(context).showSnackBar(
// // // //   //                     SnackBar(content: Text(controller.errorMessage!)),
// // // //   //                   );
// // // //   //                 } else if (controller.successMessage != null) {
// // // //   //                   ScaffoldMessenger.of(context).showSnackBar(
// // // //   //                     SnackBar(content: Text(controller.successMessage!)),
// // // //   //                   );

// // // //   //                   // Refresh the biodata list after deletion
// // // //   //                   final biodataController =
// // // //   //                       Provider.of<ShowbiodataController>(context,
// // // //   //                           listen: false);
// // // //   //                   await biodataController.fetchBiodata();
// // // //   //                 }
// // // //   //               }
// // // //   //             },
// // // //   //             child: const Text('Delete'),
// // // //   //           ),
// // // //   //         ],
// // // //   //       );
// // // //   //     },
// // // //   //   );
// // // //   // }
// // // // }

// // import 'dart:convert';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../controller/showbiodata_controller.dart';
// import '../AllDetailsPage.dart';
// import '../login_form.dart';
// import '../template_selection_page.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   String? _authToken;

//   Future<void> _getMatriIdAndFetchBiodata() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? matriId =
//         prefs.getString('matri_id'); // Assuming 'matri_id' is stored

//     if (matriId != null) {
//       await _fetchBiodataInfo(matriId);
//     } else {
//       print('matriId is null. Unable to fetch biodata.');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 6, vsync: this);
//     _getAuthToken();
//     _getMatriIdAndFetchBiodata();
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   Future<void> _getAuthToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _authToken = prefs.getString('token_key');
//     });
//   }

//   Future<void> _fetchBiodataInfo(String matriId) async {
//     final controller =
//         Provider.of<ShowbiodataController>(context, listen: false);
//     await controller.fetchBiodata(); // Fetch biodata using the controller
//   }

//   void _handleMenuItemClick(String value) {
//     switch (value) {
//       case 'share':
//         _shareApp();
//         break;
//       case 'RateApp':
//         _rateApp();
//         break;
//       case 'delete':
//         _showDeleteAccountConfirmation(context);
//         break;
//       case 'logout':
//         _handleLogout(context);
//         break;
//     }
//   }

//   _rateApp() {
//     // Functionality to rate the app
//   }

//   Future<void> _handleLogout(context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('token_key');
//     await prefs.remove('matri_id');
//     await prefs.setBool('isLoggedIn', false);
//     Navigator.of(context).pushAndRemoveUntil(
//       MaterialPageRoute(builder: (context) => LoginForm(onLoginSuccess: () {})),
//       (Route<dynamic> route) => false,
//     );
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
//         bool success = data['success'] ?? false;

//         if (success) {
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           await prefs.clear();
//           Navigator.of(context).pushReplacementNamed('/login');
//         } else {
//           String message = data['message'] ?? 'Failed to delete account';
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text(message)));
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text('Failed to delete account: ${response.statusCode}')));
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text('An error occurred while deleting account')));
//     }
//   }

//   String formatDate(String? date) {
//     if (date == null) return ''; // Handle null case
//     try {
//       // Parse the incoming date in 'yyyy-MM-dd HH:mm:ss' format
//       DateTime parsedDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(date);
//       // Format it to 'dd-MM-yyyy' (e.g., 12-06-2000)
//       return DateFormat('dd-MM-yyyy').format(parsedDate);
//     } catch (e) {
//       return date; // Return original date if parsing fails
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Biodata Maker',
//           style: TextStyle(
//               fontSize: 26.0, fontWeight: FontWeight.bold, color: Colors.white),
//           textAlign: TextAlign.center,
//         ),
//         backgroundColor: const Color(0xFFFF5508),
//         actions: [
//           PopupMenuButton<String>(
//             color: Colors.white,
//             onSelected: _handleMenuItemClick,
//             itemBuilder: (BuildContext context) {
//               return [
//                 const PopupMenuItem(value: 'share', child: Text('Share App')),
//                 const PopupMenuItem(value: 'RateApp', child: Text('Rate App')),
//                 const PopupMenuItem(
//                     value: 'delete', child: Text('Delete Account')),
//                 const PopupMenuItem(value: 'logout', child: Text('Logout')),
//               ];
//             },
//             icon: const Icon(Icons.menu, color: Colors.white),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: ElevatedButton.icon(
//                     onPressed: () {
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //     builder: (context) => AllDetailsPage(),
//                       //   ),
//                       // );
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(builder: (context) => DynamicForm()),
//                       // );
//                     },
//                     icon: const Icon(Icons.brush, size: 18),
//                     label: const Text(
//                       'Create Biodata',
//                       style: TextStyle(fontSize: 14),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red,
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 8, vertical: 10),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Consumer<ShowbiodataController>(
//                     builder: (context, controller, _) {
//                   return Expanded(
//                     child: ElevatedButton.icon(
//                       onPressed: () {
//                         controller.addDummyBiodata();
//                       },
//                       icon: const Icon(Icons.add, size: 18),
//                       label: const Text(
//                         'Add Sample',
//                         style: TextStyle(fontSize: 14),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFFFF5507),
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 8, vertical: 10),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                       ),
//                     ),
//                   );
//                 }),
//               ],
//             ),
//             const SizedBox(height: 15),
//             Expanded(
//               child: Consumer<ShowbiodataController>(
//                 builder: (context, controller, _) {
//                   if (controller.loading) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }

//                   if (controller.userData.isEmpty) {
//                     return const Center(
//                       child: Text('No data available'),
//                     );
//                   }

//                   return ListView.builder(
//                     itemCount: controller.userData.length,
//                     itemBuilder: (context, index) {
//                       final biodata = controller.userData[index];
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         child: _buildBiodataCard(context, biodata, controller),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildBiodataCard(BuildContext context, Map<String, dynamic> biodata,
//       ShowbiodataController controller) {
//     return Card(
//       color: Colors.white,
//       elevation: 5,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ListTile(
//               leading: CircleAvatar(
//                 radius: 30,
//                 backgroundImage: AssetImage("assets/images/profile.png"),
//               ),
//               title: Text(
//                 '${biodata['username'] ?? 'John'}',
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(
//                 'Caste: ${biodata['caste'] ?? 'Maratha'} \nHeight: ${biodata['height'] ?? 'Height'}',
//               ),
//             ),
//             Container(
//               color: Colors.grey[200],
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   _buildBioOptionButton(Icons.edit, 'Edit', () {
//                     // Implement edit functionality
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => AllDetailsPage(),
//                       ),
//                     );
//                   }),
//                   _buildBioOptionButton(Icons.copy, 'Copy', () async {
//                     // Copy the biodata and add it to the list
//                     controller.copyBiodata(biodata);
//                   }),
//                   // _buildBioOptionButton(Icons.delete, 'Delete', () async {
//                   //   // Delete the selected biodata
//                   //   // await controller.deleteBiodata(biodata);
//                   // }),
//                   // _buildBioOptionButton(
//                   //   Icons.delete,
//                   //   'Delete',
//                   //   () async {
//                   //     // Show confirmation dialog before deleting
//                   //     bool confirmDelete = await showDialog(
//                   //       context: context,
//                   //       builder: (BuildContext context) {
//                   //         return AlertDialog(
//                   //           backgroundColor: Colors.white,
//                   //           title: const Text('Delete Biodata'),
//                   //           content: const Text(
//                   //               'Are you sure you want to delete this ?'),
//                   //           actions: [
//                   //             TextButton(
//                   //               child: const Text('Cancel'),
//                   //               onPressed: () {
//                   //                 Navigator.of(context).pop(false);
//                   //               },
//                   //             ),
//                   //             TextButton(
//                   //               child: const Text('Delete'),
//                   //               onPressed: () {
//                   //                 Navigator.of(context).pop(true);
//                   //               },
//                   //             ),
//                   //           ],
//                   //         );
//                   //       },
//                   //     );

//                   //     // If the user confirms deletion, delete the biodata
//                   //     if (confirmDelete == true) {
//                   //       await controller.deleteBiodata(biodata);
//                   //     }
//                   //   },
//                   // ),
//                   _buildBioOptionButton(
//                     Icons.delete,
//                     'Delete',
//                     () async {
//                       // Show confirmation dialog before deleting
//                       bool confirmDelete = await showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             backgroundColor: Colors.white,
//                             title: const Text('Delete Biodata'),
//                             content: const Text(
//                                 'Are you sure you want to delete this?'),
//                             actions: [
//                               TextButton(
//                                 child: const Text('Cancel'),
//                                 onPressed: () {
//                                   Navigator.of(context).pop(
//                                       false); // Close the dialog, no delete
//                                 },
//                               ),
//                               TextButton(
//                                 child: const Text('Delete'),
//                                 onPressed: () {
//                                   Navigator.of(context)
//                                       .pop(true); // Close and confirm delete
//                                 },
//                               ),
//                             ],
//                           );
//                         },
//                       );

//                       // If the user confirms deletion, delete the biodata permanently
//                       if (confirmDelete == true) {
//                         await controller.deleteBiodata(
//                             biodata); // Delete from SharedPreferences and memory
//                       }
//                     },
//                   ),

//                   _buildBioOptionButton(
//                     Icons.file_copy,
//                     'Template',
//                     () {
//                       // Implement template change functionality
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => TemplateSelectionPage(
//                             id: (biodata['id'] ?? '').toString(),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildBioOptionButton(
//       IconData icon, String label, VoidCallback onPressed) {
//     return Column(
//       children: [
//         IconButton(
//           icon: Icon(icon, color: Colors.grey[700]),
//           onPressed: onPressed,
//         ),
//         Text(label, style: TextStyle(color: Colors.grey[700])),
//       ],
//     );
//   }
// }

import 'dart:convert';
import 'package:bio_data/consts/colors.dart';
import 'package:bio_data/screens/home_screen/privacy_policy_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/showbiodata_controller.dart';
import '../AllDetailsPage.dart';
import '../login_form.dart';
import '../template_selection_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? _authToken;

  Future<void> _getMatriIdAndFetchBiodata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? matriId =
        prefs.getString('matri_id'); // Assuming 'matri_id' is stored
    if (matriId != null) {
      await _fetchBiodataInfo(matriId);
    } else {
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
    await controller.fetchBiodata(); // Fetch biodata using the controller
  }

  void _handleMenuItemClick(String value) {
    switch (value) {
      case 'share':
        _shareApp();
        break;
      case 'RateApp':
        _rateApp();
      case 'Feedback':
        // _rateApp();
        _feedback();
      case 'PrivacyPolicy':
        _privacyPolicy();
      case 'CustomerCare':
        _customerCare();
        break;
      case 'delete':
        _showDeleteAccountConfirmation(context);
        break;
      case 'logout':
        _handleLogout(context);
        break;
    }
  }

  _feedback() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.all(16),
          title: Column(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.orangeColor,
                child: Icon(
                  Icons.email,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Submit Feedback',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: SizedBox(
            height: 200, // Fixed height for the dialog content
            width: 200,
            child: Column(
              children: [
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: "Tell us where we can improve",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Dismiss dialog
                      },
                      child: const Text('Maybe Later'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle submit feedback logic here
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: const Text('Submit'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orangeColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _privacyPolicy() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PrivacyPolicyScreen(),
      ),
    );
  }

  _customerCare() {}

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

  String formatDate(String? date) {
    if (date == null) return ''; // Handle null case
    try {
      DateTime parsedDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(date);
      return DateFormat('dd-MM-yyyy').format(parsedDate);
    } catch (e) {
      return date; // Return original date if parsing fails
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
                const PopupMenuItem(value: 'Feedback', child: Text('Feedback')),
                const PopupMenuItem(
                    value: 'PrivacyPolicy', child: Text('Privacy Policy')),
                const PopupMenuItem(
                    value: 'CustomerCare', child: Text('Customer Care')),
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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                          builder: (context) => AllDetailsPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.brush, size: 18),
                    label: const Text(
                      'Create Biodata',
                      style: TextStyle(fontSize: 14),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Consumer<ShowbiodataController>(
                  builder: (context, controller, _) {
                    return Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          controller.addDummyBiodata();
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
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Consumer<ShowbiodataController>(
                builder: (context, controller, _) {
                  if (controller.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.orangeColor,
                      ),
                    );
                  }
                  if (controller.userData.isEmpty) {
                    return const Center(
                      child: Text('No data available'),
                    );
                  }
                  return ListView.builder(
                    itemCount: controller.userData.length,
                    itemBuilder: (context, index) {
                      final biodata = controller.userData[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _buildBiodataCard(context, biodata, controller),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBiodataCard(BuildContext context, Map<String, dynamic> biodata,
      ShowbiodataController controller) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),
              title: Text(
                '${biodata['username'] ?? 'John'}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Caste: ${biodata['caste'] ?? 'Maratha'} \nHeight: ${biodata['height'] ?? 'Height'}',
              ),
            ),
            Container(
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBioOptionButton(Icons.edit, 'Edit', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllDetailsPage(),
                      ),
                    );
                  }),
                  _buildBioOptionButton(Icons.copy, 'Copy', () async {
                    controller.copyBiodata(biodata);
                  }),
                  _buildBioOptionButton(
                    Icons.delete,
                    'Delete',
                    () async {
                      bool confirmDelete = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: const Text('Delete Biodata'),
                            content: const Text(
                                'Are you sure you want to delete this?'),
                            actions: [
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                              ),
                              TextButton(
                                child: const Text('Delete'),
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                              ),
                            ],
                          );
                        },
                      );

                      if (confirmDelete == true) {
                        await controller.deleteBiodata(biodata);
                      }
                    },
                  ),
                  _buildBioOptionButton(
                    Icons.file_copy,
                    'Template',
                    () {
                      // Implement template change functionality
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TemplateSelectionPage(
                            id: (biodata['id'] ?? '').toString(),
                          ),
                        ),
                      );
                    },
                  ),
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
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, color: Colors.grey[700]),
          onPressed: onPressed,
        ),
        Text(label, style: TextStyle(color: Colors.grey[700])),
      ],
    );
  }
}
