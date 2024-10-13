import 'package:flutter/material.dart';
import '../request/education_details_api.dart';

class SwappingController extends ChangeNotifier {
  final EducationDetailsRequest _request = EducationDetailsRequest();
  bool _isLoading = false;
  String? _errorMessage;
  String? _successMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get successMessage => _successMessage;

  // Method to swap fields
  Future<void> swapField(String fieldTitle, int ordering) async {
    _isLoading = true;
    _errorMessage = null; // Reset the error message
    _successMessage = null; // Reset the success message
    notifyListeners(); // Notify listeners that loading state has changed

    try {
      await _request.swappingFieldApi(fieldTitle, ordering);
      _successMessage = 'Field swapped successfully.';
    } catch (e) {
      _errorMessage = 'Failed to swap field: $e';
    } finally {
      _isLoading = false; // Reset loading state
      notifyListeners(); // Notify listeners about loading state change
    }
  }
}
