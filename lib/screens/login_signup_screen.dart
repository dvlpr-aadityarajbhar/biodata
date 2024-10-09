// import 'package:bio_data_maker/screens/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:url_launcher/url_launcher.dart';
// import 'login_form.dart';
// import 'signup_form.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginSignupScreen extends StatefulWidget {
//   const LoginSignupScreen({super.key});

//   @override
//   _LoginSignupScreenState createState() => _LoginSignupScreenState();
// }

// class _LoginSignupScreenState extends State<LoginSignupScreen> {
//   List<String> productImages = [];
//   List<String> productUrls = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchProductData();
//   }

//   Future<void> fetchProductData() async {
//     final url =
//         Uri.parse('https://techfluxsolutions.com/royal_maratha/api/products');

//     try {
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body)['data'];

//         // print(data);
//         // return;

//         setState(() {
//           productImages = data
//               .map<String>((item) => item['product_image'].toString())
//               .toList();
//           productUrls = data
//               .map<String>((item) => item['product_url'].toString())
//               .toList();
//         });
//       } else {
//         print('Failed to load products');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   Future<void> onLoginSuccess() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isLoggedIn', true);
//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(builder: (context) => const HomePage()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Biodata Maker',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: const Color(0xFFFF5507),
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             const SizedBox(height: 30), // Space from AppBar
//             Container(
//               height: 200,
//               decoration: BoxDecoration(
//                 border: Border.all(color: const Color(0xFFFF5507), width: 1.5),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Stack(
//                 children: [
//                   Center(
//                     child: Text(
//                       'Banner Image',
//                       style: TextStyle(
//                         color: Colors.grey[400], // Light grey color
//                       ),
//                     ),
//                   ),
//                   const Positioned(
//                     bottom: 10,
//                     left: 0,
//                     right: 0,
//                     child: Center(
//                       child: Text(
//                         'learn more  →',
//                         style: TextStyle(
//                           color: Color(0xFFFF5507),
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 40), // Space between banner and buttons
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>
//                           LoginForm(onLoginSuccess: onLoginSuccess)),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFFFF5507),
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(vertical: 10.0),
//                 minimumSize: const Size(240, 40),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//               ),
//               child: const Text('Login'),
//             ),
//             const SizedBox(height: 14), // Adjust spacing between buttons
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const SignupForm()),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white,
//                 foregroundColor: const Color(0xFFFF5507),
//                 side: const BorderSide(color: Color(0xFFFF5507), width: 1.5),
//                 padding: const EdgeInsets.symmetric(vertical: 10.0),
//                 minimumSize: const Size(240, 40),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//               ),
//               child: const Text('Signup'),
//             ),

//             const SizedBox(height: 150),
//             const Text(
//               'Our Product',
//               style: TextStyle(
//                 color: Color(0xFFFF5507),
//                 fontWeight: FontWeight.bold,
//                 fontSize: 22,
//               ),
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: productImages.isNotEmpty
//                     ? List.generate(productImages.length, (index) {
//                         return GestureDetector(
//                           onTap: () => _launchURL(productUrls[index]),
//                           child: _buildProductImage(productImages[index]),
//                         );
//                       })
//                     : List.generate(4, (index) {
//                         return _buildProductImage('assets/images/SVG.png');
//                       }),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildProductImage(String imagePath) {
//     return Container(
//       width: 60,
//       height: 60,
//       margin: const EdgeInsets.symmetric(horizontal: 5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         image: DecorationImage(
//           image: imagePath.startsWith('/uploads/')
//               ? NetworkImage(
//                   'https://techfluxsolutions.com/royal_maratha$imagePath')
//               : AssetImage(imagePath) as ImageProvider,
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }

//   void _launchURL(String url) async {
//     final Uri uri = Uri.parse(url);
//     if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
//       throw 'Could not launch $url';
//     }
//   }
// }
