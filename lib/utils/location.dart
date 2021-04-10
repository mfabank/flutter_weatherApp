import 'package:location/location.dart';

class LocationHelper {
  double latitude;
  double longitude;

  Future <void> getCurrentLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    //Location için servis kontrolü (Aktif mi ?)
    _serviceEnabled = await location.serviceEnabled();
    if(!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if(!_serviceEnabled) {
        return;
      }
    }

    //Kullanıcı izin verdi mi ?
    _permissionGranted = await location.hasPermission();
    if(_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if(_permissionGranted == PermissionStatus.granted) {
        return;
      }
    }

    //Eğer servis artık ayakta ise
    _locationData = await location.getLocation();
    latitude = _locationData.latitude;
    longitude = _locationData.longitude;
  }
}