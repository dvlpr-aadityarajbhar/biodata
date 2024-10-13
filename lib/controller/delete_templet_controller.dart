// // // import 'package:flutter/material.dart';
// // // import '../request/delete_templet_request.dart'; // Update the import according to your file structure

// // // class DeleteTemplateController extends ChangeNotifier {
// // //   final DeleteTemplateRequest _request = DeleteTemplateRequest();
// // //   bool _isLoading = false;
// // //   String? _errorMessage;
// // //   String? _successMessage;

// // //   bool get isLoading => _isLoading;
// // //   String? get errorMessage => _errorMessage;
// // //   String? get successMessage => _successMessage;

// // //   // Method to delete a template
// // //   Future<void> deleteTemplate(int id) async {
// // //     _isLoading = true;
// // //     _errorMessage = null; // Reset the error message
// // //     _successMessage = null; // Reset the success message
// // //     notifyListeners(); // Notify listeners that loading state has changed

// // //     try {
// // //       await _request.deleteSampleTemplate(id);
// // //       _successMessage = 'Template deleted successfully.';
// // //     } catch (e) {
// // //       _errorMessage = 'Failed to delete template: $e';
// // //     } finally {
// // //       _isLoading = false; // Reset loading state
// // //       notifyListeners(); // Notify listeners about loading state change
// // //     }
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import '../request/delete_templet_request.dart';

// // class DeleteTemplateController extends ChangeNotifier {
// //   final DeleteTemplateRequest _request = DeleteTemplateRequest();
// //   bool _isLoading = false;
// //   String? _errorMessage;
// //   String? _successMessage;

// //   bool get isLoading => _isLoading;
// //   String? get errorMessage => _errorMessage;
// //   String? get successMessage => _successMessage;

// //   Future<void> deleteBiodata(String id, String? authToken) async {
// //     _isLoading = true;
// //     _errorMessage = null; // Reset the error message
// //     _successMessage = null; // Reset the success message
// //     notifyListeners(); // Notify listeners that loading state has changed

// //     try {
// //       await _request.deleteBiodata(id, authToken);
// //       _successMessage = 'Biodata deleted successfully.';
// //     } catch (e) {
// //       _errorMessage = 'Failed to delete biodata: $e';
// //     } finally {
// //       _isLoading = false; // Reset loading state
// //       notifyListeners(); // Notify listeners about loading state change
// //     }
// //   }
// // }

// import 'package:flutter/material.dart';

// import '../request/delete_templet_request.dart'; // Update with your actual import

// class DeleteTemplateController with ChangeNotifier {
//   final DeleteTemplateRequest _request = DeleteTemplateRequest();
//   String? errorMessage;
//   String? successMessage;

//   Future<void> deleteBiodata(String id, String? authToken) async {
//     errorMessage = null; // Clear previous messages
//     successMessage = null; // Clear previous messages

//     try {
//       await _request.deleteBiodata(id, authToken);
//       successMessage = 'Biodata deleted successfully';
//       notifyListeners(); // Notify listeners of success
//     } catch (error) {
//       errorMessage = error.toString();
//       notifyListeners(); // Notify listeners of error
//     }
//   }
// }
