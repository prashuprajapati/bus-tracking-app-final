import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSelectionPage extends StatefulWidget {
  @override
  _MapSelectionPageState createState() => _MapSelectionPageState();
}

class _MapSelectionPageState extends State<MapSelectionPage> {
  GoogleMapController? _mapController;
  LatLng? _sourceLocation;
  LatLng? _destinationLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Source and Destination'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: (controller) {
                setState(() {
                  _mapController = controller;
                });
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(37.7749, -122.4194), // Initial map location (San Francisco)
                zoom: 12,
              ),
              markers: _createMarkers(),
              onTap: (LatLng position) {
                _onMapTap(position);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _selectLocation(isSource: true);
                  },
                  child: Text('Select Source'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _selectLocation(isSource: false);
                  },
                  child: Text('Select Destination'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Set<Marker> _createMarkers() {
    Set<Marker> markers = Set();
    if (_sourceLocation != null) {
      markers.add(Marker(
        markerId: MarkerId('source'),
        position: _sourceLocation!,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: InfoWindow(title: 'Source'),
      ));
    }
    if (_destinationLocation != null) {
      markers.add(Marker(
        markerId: MarkerId('destination'),
        position: _destinationLocation!,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(title: 'Destination'),
      ));
    }
    return markers;
  }

  void _onMapTap(LatLng position) {
    // Handle map tap if needed
  }

  void _selectLocation({required bool isSource}) async {
    LatLng? selectedLocation = await _pickLocation();
    if (selectedLocation != null) {
      setState(() {
        if (isSource) {
          _sourceLocation = selectedLocation;
        } else {
          _destinationLocation = selectedLocation;
        }
      });
    }
  }

  Future<LatLng?> _pickLocation() async {
    // Implement a location picker (can use a package like location_picker)
    // and return the selected LatLng.
    return LatLng(37.7749, -122.4194); // Default to San Francisco if not implemented
  }
}

