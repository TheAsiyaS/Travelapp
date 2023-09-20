import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
late  GoogleMapController mapController;
  final places = GoogleMapsPlaces(apiKey: 'YOUR_API_KEY');
  List<Marker> markers = [];

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Partner App'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194), // Default map location (San Francisco)
          zoom: 12.0,
        ),
        markers: Set<Marker>.of(markers),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Perform a hotel search and display markers on the map
          _searchForHotels();
        },
        child: Icon(Icons.search),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  Future<void> _searchForHotels() async {
    // Define the search parameters
    final location = Location(lat: 37.7749,lng: -122.4194); // San Francisco coordinates
    final radius = 5000; // Search radius in meters
    final response = await places.searchNearbyWithRadius(
      location,
      radius,
      type: 'lodging', // Specify the type as 'lodging' for hotels
    );

    // Clear existing markers
    markers.clear();

    // Add markers for the found hotels
    for (PlacesSearchResult result in response.results) {
      final hotel = result.name;
      final lat = result.geometry!.location.lat;
      final lng = result.geometry!.location.lng;
      markers.add(
        Marker(
          markerId: MarkerId(hotel),
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(title: 'Hotel', snippet: hotel),
        ),
      );
    }
    setState(() {});
  }
}