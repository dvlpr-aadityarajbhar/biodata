import 'package:bio_data/models/fetch_biodata_details_model.dart' as fetch;
// import 'package:biodata';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/fetch_biodata_details_model.dart';
import '../models/show_biodata_model.dart';
import '../request/showbiodatabybiodata_id.dart';

class FetchbiodatadetailsController with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  FetchBiodataDetailsModel? fetchData;

  Future fetchBiodatabyIdwise() async {
    _loading = true;
    notifyListeners();

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      int? biodata_id = pref.getInt("biodata_id");

      if (biodata_id != null) {
        ShowBiodataModel? biodata =
            await ShowbiodatabybiodataId.fetchBiodata(biodata_id);
        print("Biodata fetched for biodata_id: $biodata_id");
        print(
            "Biodata details: ${biodata?.data}"); // Add this line to log the fetched data

        if (biodata != null) {
          fetchData = _convertToFetchBiodataDetailsModel(biodata);
          print(
              "fetchData: ${fetchData?.data}"); // Add this line to log the converted data
        }
      } else {
        print("No biodata_id found");
      }
    } catch (e, t) {
      print("Error fetching biodata: $e");
    }
  }

  // Method to convert ShowBiodataModel to FetchBiodataDetailsModel
  FetchBiodataDetailsModel _convertToFetchBiodataDetailsModel(
      ShowBiodataModel biodata) {
    if (biodata.data != null && biodata.data!.isNotEmpty) {
      // Access the first item in the list, or loop through it
      var firstItem = biodata.data!.first; // Assuming you want the first item

      return FetchBiodataDetailsModel(
        data: fetch.Data(
          title: firstItem.title, // Access fields from the first item
          username: firstItem.username,
          height: firstItem.height,
          birthtime: firstItem.birthtime,
          birthplace: firstItem.birthplace,
          caste: firstItem.caste,
          subcaste: firstItem.subcaste,
          complexion: firstItem.complexion,
          email: firstItem.email,
          contact: firstItem.contact,
        ),
      );
    } else {
      // Return null if there's no data or the list is empty
      return FetchBiodataDetailsModel(data: null);
    }
  }
}
