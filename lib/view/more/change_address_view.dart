import 'package:ahaar_project/common_widget/round_textfiled.dart';
import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../common/color_extension.dart';

class ChangeAddressView extends StatefulWidget {
  const ChangeAddressView({super.key});

  @override
  State<ChangeAddressView> createState() => _ChangeAddressViewState();
}

class _ChangeAddressViewState extends State<ChangeAddressView> {
  GoogleMapController? _controller;
  TextEditingController txtSearch = TextEditingController();

  final locations = const [
    LatLng(37.42796133580664, -122.085749655962),
  ];

  late List<MarkerData> _customMarkers;

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.151926040649414,
  );

  @override
  void initState() {
    super.initState();
    _customMarkers = [
      MarkerData(
        marker: Marker(
          markerId: const MarkerId('id-1'),
          position: locations[0],
        ),
        child: _customMarker('Everywhere\nis a Widgets', Colors.blue),
      ),
    ];
    fetchSavedAddresses();
  }

  // Fetch saved addresses from Firebase Firestore
  Future<void> fetchSavedAddresses() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      final snapshot = await FirebaseFirestore.instance
          .collection('addresses')
          .where('userId', isEqualTo: user.uid)
          .get();

      if (snapshot.docs.isNotEmpty) {
        // Example: Update the map with the first saved address
        final address = snapshot.docs.first.data();
        LatLng savedLocation = LatLng(
          address['latitude'] ?? 37.42796133580664,
          address['longitude'] ?? -122.085749655962,
        );

        setState(() {
          _customMarkers = [
            MarkerData(
              marker: Marker(
                markerId: const MarkerId('saved-location'),
                position: savedLocation,
              ),
              child: _customMarker('Saved Location', Colors.green),
            ),
          ];
          _controller?.animateCamera(
            CameraUpdate.newLatLng(savedLocation),
          );
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to fetch saved addresses: $e")),
      );
    }
  }

  // Save a new address to Firebase Firestore
  Future<void> saveAddress(LatLng location) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please log in to save an address.")),
        );
        return;
      }

      await FirebaseFirestore.instance.collection('addresses').add({
        'userId': user.uid,
        'latitude': location.latitude,
        'longitude': location.longitude,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Address saved successfully!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to save address: $e")),
      );
    }
  }

  _customMarker(String symbol, Color color) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Image.asset(
            'assets/img/map_pin.png',
            width: 35,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset("assets/img/btn_back.png", width: 20, height: 20),
        ),
        centerTitle: false,
        title: Text(
          "Change Address",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: CustomGoogleMapMarkerBuilder(
        customMarkers: _customMarkers,
        builder: (BuildContext context, Set<Marker>? markers) {
          if (markers == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kLake,
            compassEnabled: false,
            gestureRecognizers: Set()
              ..add(Factory<PanGestureRecognizer>(
                () => PanGestureRecognizer(),
              )),
            markers: markers,
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
            },
            onTap: (LatLng location) {
              saveAddress(location);
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: RoundTextfield(
                  hintText: "Search Address",
                  left: Icon(Icons.search, color: TColor.primaryText),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Image.asset('assets/img/fav_icon.png',
                        width: 35, height: 35),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Choose a saved place",
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/img/btn_next.png',
                      width: 15,
                      height: 15,
                      color: TColor.primaryText,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}