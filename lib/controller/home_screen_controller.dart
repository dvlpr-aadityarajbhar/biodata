import 'package:flutter/material.dart';
import '../models/dummy_sample_model.dart';
import '../request/home_screen_apis.dart';

class HomeScreenController extends ChangeNotifier {
  List<Data> userData = [];
  bool isLoading = false;

  // Create Biodata API - Adding Sample
  Future<void> createBiodataApi() async {
    setLoading(true);

    DummySampleModel? responseModel =
        await HomeScreenApis().addDummySampleApi();
    if (responseModel != null && responseModel.data != null) {
      userData.add(responseModel.data!);
      notifyListeners(); // Notify listeners after updating the data list
    }

    setLoading(false);
  }

  // Delete Biodata API - Deleting Sample
  Future<void> deleteBiodataApi(String id) async {
    setLoading(true);

    bool isDeleted = await HomeScreenApis().deleteSampleApi(id);
    if (isDeleted) {
      // Remove the item from the list after successful deletion
      userData.removeWhere((element) => element.id == id);
      notifyListeners(); // Notify listeners after updating the data list
    }

    setLoading(false);
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners(); // Notify listeners when loading state changes
  }
}
