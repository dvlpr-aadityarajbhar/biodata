// import 'package:flutter/material.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// class PaymentScreen extends StatefulWidget {
//   PaymentScreen({super.key});

//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   late Razorpay _razorpay;
//   int selectedAmount = 50; // Default amount

//   @override
//   void initState() {
//     super.initState();
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }

//   @override
//   void dispose() {
//     _razorpay.clear();
//     super.dispose();
//   }

//   void openCheckOut() async {
//     var options = {
//       'key': 'rzp_test_VOjnMgP0TwVBT6', // Test key
//       'amount': selectedAmount * 100, // Convert to smallest currency unit
//       'name': 'Biodata',
//       'prefill': {
//         'contact': '1234567890',
//         'email': 'test@gmail.com',
//       },
//       'external': {
//         'wallet': ['paytm'],
//       }
//     };

//     try {
//       print("Opening Razorpay Checkout");
//       _razorpay.open(options);
//     } catch (e) {
//       print("Error opening Razorpay: $e");
//     }
//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     showAlertDialog(
//         context, "Payment Successful", "Payment ID: ${response.paymentId}");
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     showAlertDialog(context, "Payment Failed", "");
//     // "Code: ${response.code}\nDescription: ${response.message}\nMetadata: ${response.error.toString()}");
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     showAlertDialog(
//       context,
//       "External Wallet Selected",
//       response.walletName.toString(),
//     );
//   }

//   void showAlertDialog(BuildContext context, String title, String message) {
//     Widget continueButton = ElevatedButton(
//       child: const Text(
//         "Continue",
//         style: TextStyle(
//           color: Colors.white,
//         ),
//       ),
//       onPressed: () {
//         Navigator.of(context).pop(); // Close the dialog
//       },
//     );

//     AlertDialog alert = AlertDialog(
//       title: Text(title),
//       content: Text(message),
//       actions: [continueButton],
//     );

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Subscription",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'Choose an amount to pay:',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 20),
//             // Container layout for payment options
//             Wrap(
//               spacing: 20,
//               runSpacing: 10, // Additional space between rows if needed
//               children: <Widget>[
//                 _buildPaymentOption("1 Month", "₹49", 49),
//                 _buildPaymentOption("3 Months", "₹99", 99),
//                 _buildPaymentOption("6 Months", "₹149", 149),
//                 _buildPaymentOption("1 year", "₹499", 499),
//               ],
//             ),
//             SizedBox(height: 40),
//             // ElevatedButton(
//             //   onPressed: () {
//             //     openCheckOut();
//             //   },
//             //   child: const Text(
//             //     "Pay with Razorpay",
//             //     style: TextStyle(
//             //       color: Colors.white,
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPaymentOption(String duration, String amount, int value) {
//     return Container(
//       width: 160, // Adjust width as needed
//       decoration: BoxDecoration(
//         color: Colors.white, // Background color
//         border: Border.all(color: Colors.orange, width: 2), // Orange border
//         borderRadius: BorderRadius.circular(12), // Rounded corners
//       ),
//       padding: const EdgeInsets.all(16), // Padding inside the container
//       child: Column(
//         mainAxisSize: MainAxisSize.min, // Size the column to fit its content
//         children: [
//           Text(
//             duration, // Display the duration
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 10), // Space between text and amount
//           Text(
//             amount, // Display the amount
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.deepOrange,
//             ),
//           ),
//           const SizedBox(height: 10), // Space between amount and button
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 selectedAmount = value; // Update selected amount
//               });
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.deepOrange, // Button color
//               shape: RoundedRectangleBorder(
//                 borderRadius:
//                     BorderRadius.circular(12), // Rounded corners for button
//               ),
//             ),
//             child: const Text(
//               "Pay Now",
//               style: TextStyle(color: Colors.white), // Text color for button
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late Razorpay _razorpay;
  int selectedAmount = 0; // Default amount

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void openCheckOut() async {
    // Check if selectedAmount is not zero
    if (selectedAmount > 0) {
      var options = {
        'key': 'rzp_test_VOjnMgP0TwVBT6', // Test key
        'amount': selectedAmount * 100, // Convert to smallest currency unit
        'name': 'Biodata',
        'prefill': {
          'contact': '1234567890',
          'email': 'test@gmail.com',
        },
        'external': {
          'wallet': ['paytm'],
        }
      };

      try {
        print("Opening Razorpay Checkout");
        _razorpay.open(options);
      } catch (e) {
        print("Error opening Razorpay: $e");
      }
    } else {
      showAlertDialog(
          context, "No Amount Selected", "Please select an amount to proceed.");
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    showAlertDialog(context, "Payment Failed", "");
    // "Code: ${response.code}\nDescription: ${response.message}\nMetadata: ${response.error.toString()}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    showAlertDialog(
      context,
      "External Wallet Selected",
      response.walletName.toString(),
    );
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    Widget continueButton = ElevatedButton(
      child: const Text(
        "Continue",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop(); // Close the dialog
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [continueButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Subscription",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const Text(
            //   'Choose an amount to pay:',
            //   style: TextStyle(fontSize: 18),
            // ),
            SizedBox(height: 5),
            // Container layout for payment options
            Wrap(
              spacing: 20,
              runSpacing: 10, // Additional space between rows if needed
              children: <Widget>[
                _buildPaymentOption("1 Month", "₹49", 49),
                _buildPaymentOption("3 Months", "₹99", 99),
                _buildPaymentOption("6 Months", "₹149", 149),
                _buildPaymentOption("1 Year", "₹499", 499),
              ],
            ),
            SizedBox(height: 40),
            // ElevatedButton(
            //   onPressed: () {
            //     openCheckOut();
            //   },
            //   child: const Text(
            //     "Pay with Razorpay",
            //     style: TextStyle(
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String duration, String amount, int value) {
    return Container(
      width: 160, // Adjust width as needed
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        border: Border.all(color: Colors.orange, width: 2), // Orange border
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      padding: const EdgeInsets.all(16), // Padding inside the container
      child: Column(
        mainAxisSize: MainAxisSize.min, // Size the column to fit its content
        children: [
          Text(
            duration, // Display the duration
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10), // Space between text and amount
          Text(
            amount, // Display the amount
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
          ),
          const SizedBox(height: 10), // Space between amount and button
          ElevatedButton(
            onPressed: () {
              setState(() {
                selectedAmount = value; // Update selected amount
              });
              openCheckOut(); // Open Razorpay immediately after selecting amount
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange, // Button color
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12), // Rounded corners for button
              ),
            ),
            child: const Text(
              "Pay Now",
              style: TextStyle(color: Colors.white), // Text color for button
            ),
          ),
        ],
      ),
    );
  }
}
