import 'package:flutter/material.dart';
import 'package:quickride/screens/profile/widgets/DriverInfo.dart' show DriverInfo;
import 'package:quickride/screens/profile/widgets/VehicleInfo.dart' show VehicleInfo;
import 'package:quickride/screens/profile/widgets/DriverLocation.dart' show DriverLocation;
import 'package:quickride/screens/profile/widgets/DriverReview.dart' show DriverReview;
import 'package:quickride/screens/profile/widgets/ActionButton.dart' show ActionButton;

class DriverProfile extends StatelessWidget {
  const DriverProfile({Key? key}) : super(key: key);
  static const routeName = '/driver-profile';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 50.0, 24.0, 0.0),
          child: Column(
            children: const [
              DriverInfo(),
              SizedBox(height: 16.0),
              VehicleInfo(),
              SizedBox(height: 16.0),
              DriverLocation(),
              SizedBox(height: 32.0),
              DriverReview(),
              SizedBox(height: 56.0),
              ActionButton(),
            ],
          )
          ),
      ),
    );
  }
}
