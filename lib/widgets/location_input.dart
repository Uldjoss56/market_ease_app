import 'dart:convert';

import 'package:e_com_app/const/colors.dart';
import 'package:e_com_app/models/user_location.dart';
import 'package:e_com_app/services/maps_service.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  UserLocation? _pickedLocation;
  var _isGettingLocation = false;
  final MapsService _mapsService = MapsService();
  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    setState(() {
      _isGettingLocation = true;
    });
    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final long = locationData.longitude;
    if (lat == null || long == null) {
      return;
    }

    final addr = await _mapsService.getPosition(lat: lat, long: long);
    final url = Uri.parse(
      '''https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=AIzaSyBO54uguC9CWHZxlcC6pSbuoYll3EPtdSM''',
    );
    final response = await http.get(url);
    final resData = json.decode(response.body);
    final add = resData['results'][0]['formatted_address'];
    print(add);
    setState(() {
      _pickedLocation = UserLocation(
        latitude: lat,
        longtitude: long,
        address: addr,
      );
      _isGettingLocation = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget previouContent = const Text("No location chosen");
    String locationImage;

    if (_pickedLocation != null) {
      locationImage = _mapsService.getLocationImage(
        long: _pickedLocation!.longtitude,
        lat: _pickedLocation!.latitude,
      );
      previouContent = Image.network(
        locationImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }
    if (_isGettingLocation) {
      previouContent = const CircularProgressIndicator();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: myOrange.withOpacity(0.2)),
          ),
          alignment: Alignment.center,
          height: 170,
          width: double.infinity,
          child: previouContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: const Icon(Icons.location_on),
              label: const Text("Get Current Location"),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: const Text("Select on Map"),
            ),
          ],
        ),
      ],
    );
  }
}
