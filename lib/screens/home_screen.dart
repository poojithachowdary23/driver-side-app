import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi, ${user.email ?? "User"}'),
      ),
      body: kIsWeb
          ? const Center(
        child: Text(
          'Google Maps is not supported on Web in this setup.',
          style: TextStyle(fontSize: 16),
        ),
      )
          : GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(12.9716, 77.5946), // Bengaluru
          zoom: 14,
        ),
        mapType: MapType.normal,
      ),
    );
  }
}
