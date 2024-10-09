import 'package:flutter/material.dart';

import '../request/education_details_api.dart';
import '../screens/AppTheme.dart';
import 'dynamic_field.dart';

class FamilyDetailsSection extends StatefulWidget {
  final List<Map<String, dynamic>> fields;

  const FamilyDetailsSection({Key? key, required this.fields})
      : super(key: key);

  @override
  _FamilyDetailsSectionState createState() => _FamilyDetailsSectionState();
}

class _FamilyDetailsSectionState extends State<FamilyDetailsSection> {
  // Declare TextEditingControllers
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController fatherOccupationController =
      TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();
  final TextEditingController motherNameController = TextEditingController();
  final TextEditingController motherOccupationController =
      TextEditingController();
  final TextEditingController totalBrothersController = TextEditingController();
  final TextEditingController totalSistersController = TextEditingController();
  final TextEditingController residenceAddressController =
      TextEditingController();
  final TextEditingController maternalUncleNameController =
      TextEditingController();
  final TextEditingController nativePlaceController = TextEditingController();
  final TextEditingController relativeSurnameController =
      TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers
    fatherNameController.dispose();
    fatherOccupationController.dispose();
    mobileNoController.dispose();
    motherNameController.dispose();
    motherOccupationController.dispose();
    totalBrothersController.dispose();
    totalSistersController.dispose();
    residenceAddressController.dispose();
    maternalUncleNameController.dispose();
    nativePlaceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Family Details', style: TextStyle(fontSize: 18.0)),
        // Father's Name field
        Row(
          children: [
            SizedBox(
              width: 270,
              height: 60,
              child: TextFormField(
                controller: fatherNameController,
                decoration: const InputDecoration(
                  labelText: "Father's Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              size: 30,
              color: AppTheme.primaryColor,
            ),
            const Icon(
              Icons.delete,
              color: AppTheme.primaryColor,
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 270,
              height: 60,
              child: TextFormField(
                controller: fatherOccupationController,
                decoration: const InputDecoration(
                  labelText: "Father's Occp.",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Icon(
              Icons.unfold_more,
              size: 30,
              color: AppTheme.primaryColor,
            ),
            const Icon(
              Icons.delete,
              color: AppTheme.primaryColor,
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 270,
              height: 60,
              child: TextFormField(
                controller: mobileNoController,
                decoration: const InputDecoration(
                  labelText: 'Mobile No.',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Icon(
              Icons.unfold_more,
              size: 30,
              color: AppTheme.primaryColor,
            ),
            const Icon(
              Icons.delete,
              color: AppTheme.primaryColor,
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 270,
              height: 60,
              child: TextFormField(
                controller: motherNameController,
                decoration: const InputDecoration(
                  labelText: "Mother's Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Icon(
              Icons.unfold_more,
              size: 30,
              color: AppTheme.primaryColor,
            ),
            const Icon(
              Icons.delete,
              color: AppTheme.primaryColor,
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 270,
              height: 60,
              child: TextFormField(
                controller: motherOccupationController,
                decoration: const InputDecoration(
                  labelText: "Mother's Occp.",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Icon(
              Icons.unfold_more,
              size: 30,
              color: AppTheme.primaryColor,
            ),
            const Icon(
              Icons.delete,
              color: AppTheme.primaryColor,
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 270,
              height: 60,
              child: TextFormField(
                controller: totalBrothersController,
                decoration: const InputDecoration(
                  labelText: 'Total Brothers',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Icon(
              Icons.unfold_more,
              size: 30,
              color: AppTheme.primaryColor,
            ),
            const Icon(
              Icons.delete,
              color: AppTheme.primaryColor,
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 270,
              height: 60,
              child: TextFormField(
                controller: totalSistersController,
                decoration: const InputDecoration(
                  labelText: 'Total Sisters',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Icon(
              Icons.unfold_more,
              size: 30,
              color: AppTheme.primaryColor,
            ),
            const Icon(
              Icons.delete,
              color: AppTheme.primaryColor,
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 270,
              height: 60,
              child: TextFormField(
                controller: residenceAddressController,
                decoration: const InputDecoration(
                  labelText: 'Resi. address',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Icon(
              Icons.unfold_more,
              size: 30,
              color: AppTheme.primaryColor,
            ),
            const Icon(
              Icons.delete,
              color: AppTheme.primaryColor,
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 270,
              height: 60,
              child: TextFormField(
                controller: maternalUncleNameController,
                decoration: const InputDecoration(
                  labelText: 'Maternal Uncle Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Icon(
              Icons.unfold_more,
              size: 30,
              color: AppTheme.primaryColor,
            ),
            const Icon(
              Icons.delete,
              color: AppTheme.primaryColor,
            ),
          ],
        ),
        TextFormField(
          controller: relativeSurnameController,
          decoration: const InputDecoration(
            labelText: 'Relative Surname',
            border: OutlineInputBorder(),
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 270,
              height: 60,
              child: TextFormField(
                controller: nativePlaceController,
                decoration: const InputDecoration(
                  labelText: 'Native Place',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_up,
              size: 30,
              color: AppTheme.primaryColor,
            ),
            const Icon(
              Icons.delete,
              color: AppTheme.primaryColor,
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () async {
            // Get input data from controllers
            String fathersName = fatherNameController.text;
            String fatherOccupation = fatherOccupationController.text;
            String mobileNumber = mobileNoController.text;
            String mothersName = motherNameController.text;
            String motherOccupation = motherOccupationController.text;
            String totalBrothers = totalBrothersController.text;
            String totalSisters = totalSistersController.text;
            String residentialAddress = residenceAddressController.text;
            String maternalUncle = maternalUncleNameController.text;
            String nativePlace = nativePlaceController.text;
            String relativeSurname = relativeSurnameController.text;

            // Call the API
            await EducationDetailsRequest().familyDetailsApi(
              fathersName,
              fatherOccupation,
              mothersName,
              motherOccupation,
              mobileNumber,
              totalBrothers,
              totalSisters,
              residentialAddress,
              maternalUncle,
              nativePlace,
              relativeSurname,
            );
          },
          child: Text("Submit"),
        ),
        ...widget.fields.map((field) => DynamicField(field: field)),
      ],
    );
  }
}
