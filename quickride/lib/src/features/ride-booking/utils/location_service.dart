import 'package:location/location.dart' hide PermissionStatus;
import 'package:permission_handler/permission_handler.dart';

// Request location permissions
Future<void> requestLocationPermission() async {
  PermissionStatus status = await Permission.location.request();

  if (status.isGranted) {
    // Location permission granted, proceed to use location services
  } else if (status.isDenied) {
    // Location permission denied
  } else if (status.isPermanentlyDenied) {
    // Location permission permanently denied, open settings
    openAppSettings();
  }
}
