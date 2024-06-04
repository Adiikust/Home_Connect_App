import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vendor_app/AppLayer/Overseer.dart';
import 'package:vendor_app/Utils/Colors/app_color.dart';
import 'package:vendor_app/Utils/Screen_Size/screen_sizes.dart';
import 'package:vendor_app/Views/Widgets/Outline_small_text_button.dart';
import 'package:vendor_app/Views/Widgets/build_size_box.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

import 'area_view.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  TextEditingController addressController = TextEditingController();

  bool req_available = false;

  bool status6 = false;
  Timer? _timer;
  GoogleMapController? _controller;
  double latitude = 0.0;
  double longitude = 0.0;
  String titlee = '';
  LatLng _markerLocation = LatLng(33.5651, 73.0169);

  CameraPosition _currentCameraPosition = CameraPosition(
    target: LatLng(33.5651, 73.0169), // Default location
    zoom: 16.0,
  );

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
        _markerLocation = LatLng(latitude, longitude);
        print(position.latitude);
        print(position.longitude);
        print(position.heading);

        // Update camera position
        _currentCameraPosition = CameraPosition(
          target: _markerLocation,
          zoom: 16.0,
        );

        // Animate the camera to the new position
        _controller?.animateCamera(
            CameraUpdate.newCameraPosition(_currentCameraPosition));
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  void _onCameraMove(CameraPosition position) {
    setState(() {
      _markerLocation = position.target;
    });
  }

  getLocationName(double laaat, double lonnng) async {
    try {
      final List<Placemark> placemarks = await placemarkFromCoordinates(
          laaat, lonnng,
          localeIdentifier: 'en_US');
      if (placemarks.isNotEmpty) {
        final Placemark placemark = placemarks[0];
        // You can access various location details like name, street, city, etc.
        String locationName = placemark.name ?? '';
        setState(() {
          titlee = locationName;
        });
        return locationName;
      }
    } catch (e) {
      print('Error fetching location name: $e');
    }
    return 'Location not found'; // Return a default value in case of an error or no location found.
  }

  @override
  void initState() {
    getCurrentLocation().then((value) {});
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      getCurrentLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XffF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/small_appbar.png"),
                    fit: BoxFit.fill),
              ),
              child: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                        )),
                    BuildSizeBox(
                      weight: Get.width * ScreenSizes.SCREEN_SIZE_2,
                    ),
                    BuildText(
                      text: "Location",
                      color: AppColors.kWhiteColor,
                      fontWeight: FontWeight.bold,
                      family: "Montserrat-SemiBold",
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                  BuildText(
                    text: "Inquiry Form",
                    color: AppColors.kTextColor1,
                    fontWeight: FontWeight.bold,
                    family: "Montserrat-SemiBold",
                    size: 20,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  BuildText(
                    text: "Please Provide Correct Information",
                    color: AppColors.kTextColor2,
                    family: "Montserrat-Regular",
                    size: 14,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildSizeBox(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                      Container(
                        width: Get.width,
                        height: Get.height * 0.60,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(6)),
                        child: GoogleMap(
                          initialCameraPosition:
                              CameraPosition(target: _markerLocation),
                          onMapCreated: (GoogleMapController controller) {
                            _controller = controller;
                          },
                          markers: {
                            Marker(
                                markerId: MarkerId('marker_1'),
                                position: _markerLocation,
                                infoWindow: InfoWindow(
                                  title: titlee,
                                  snippet:
                                      '${_markerLocation.latitude}, ${_markerLocation.longitude}',
                                ),
                                onTap: () async {
                                  latitude = _markerLocation.latitude;
                                  longitude = _markerLocation.longitude;
                                  print(
                                      '---  0 - -- -- --- ${_markerLocation.latitude}, ${_markerLocation.longitude}');
                                  print(
                                      '---  1 - -- -- --- ${latitude}, ${longitude}');

                                  String locationName = await getLocationName(
                                      _markerLocation.latitude,
                                      _markerLocation.longitude);
                                  print('000))))00  9((()))   ${locationName}');
                                }),
                          },
                          minMaxZoomPreference: MinMaxZoomPreference(10, 1000),
                          zoomControlsEnabled: true,
                          zoomGesturesEnabled: true,
                          onCameraMove: _onCameraMove,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        child: Row(
          children: [
            Expanded(
              child: OutLineSmallTextButton(
                text: "Back",
                clickCallback: () {
                  Get.back();
                },
                textColor: AppColors.kGreenColor,
                buttonColor: AppColors.kWhiteColor,
              ),
            ),
            BuildSizeBox(weight: Get.width * ScreenSizes.SCREEN_SIZE_5),
            Expanded(
                child: OutLineSmallTextButton(
              text: "Next",
              clickCallback: () {
                Overseer.latitude = latitude;
                Overseer.longitude = longitude;
                print(
                    '-Overseer- -- -- --- ${Overseer.latitude}, ${Overseer.longitude}');
                Get.to(() => const AreaView());
              },
              textColor: AppColors.kWhiteColor,
              buttonColor: AppColors.kGreenColor,
            )),
          ],
        ),
      ),
    );
  }
}
