import 'dart:async';
import 'profile.dart';
import 'package:fluster/fluster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_clusters/profile.dart';
import 'map_helper.dart';
import 'map_marker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _mapController = Completer();

  /// Set of displayed markers and cluster markers on the map
  final Set<Marker> _markers = Set();

  /// Minimum zoom at which the markers will cluster
  final int _minClusterZoom = 0;

  /// Maximum zoom at which the markers will cluster
  final int _maxClusterZoom = 19;

  /// [Fluster] instance used to manage the clusters
  Fluster<MapMarker>? _clusterManager;

  /// Current map zoom. Initial zoom will be 15, street level
  double _currentZoom = 15;

  /// Map loading flag
  bool _isMapLoading = true;

  /// Markers loading flag
  bool _areMarkersLoading = true;

  /// Url image used on normal markers
  final String _markerImageUrl =
      'https://img.icons8.com/office/80/000000/marker.png';

  /// Color of the cluster circle
  final Color _clusterColor = Colors.blue;

  /// Color of the cluster text
  final Color _clusterTextColor = Colors.white;

  /// Example marker coordinates
  final List<LatLng> _markerLocations = [
    LatLng(11.117140067282367, 76.95623453823599),
    LatLng(13.14279465750004, 80.24040586619361),
    LatLng(12.81342526228009, 79.69032112965355),
    LatLng(14.895271690769194, 79.09575186224406),
    LatLng(28.62039829820944, 77.13307284864513),
    LatLng(10.56091540486144, 76.23335182750186),
    LatLng(23.461202869756097, 77.34919104550782),
    LatLng(19.576140358014666, 75.67578307370584),
    LatLng(26.896035041112256, 80.90585765987504),
    LatLng(20.506401972287602, 84.41008944870863),
  ];

  /// Called when the Google Map widget is created. Updates the map loading state
  /// and inits the markers.
  void _onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);

    setState(() {
      _isMapLoading = false;
    });

    _initMarkers();
  }

  /// Inits [Fluster] and all the markers with network images and updates the loading state.
  void _initMarkers() async {
    final List<MapMarker> markers = [];

    for (LatLng markerLocation in _markerLocations) {
      final BitmapDescriptor markerImage =
      await MapHelper.getMarkerImageFromUrl(_markerImageUrl);

      markers.add(
        MapMarker(
          id: _markerLocations.indexOf(markerLocation).toString(),
          position: markerLocation,
          icon: markerImage,
        ),
      );
    }

    _clusterManager = (await MapHelper.initClusterManager(
      markers,
      _minClusterZoom,
      _maxClusterZoom,
    ));

    await _updateMarkers();
  }

  /// Gets the markers and clusters to be displayed on the map for the current zoom level and
  /// updates state.
  Future<void> _updateMarkers([double? updatedZoom]) async {
    if (_clusterManager == null || updatedZoom == _currentZoom) return;

    if (updatedZoom != null) {
      _currentZoom = updatedZoom;
    }

    setState(() {
      _areMarkersLoading = true;
    });

    final updatedMarkers = await MapHelper.getClusterMarkers(
      _clusterManager,
      _currentZoom,
      _clusterColor,
      _clusterTextColor,
      80,
    );

    _markers
      ..clear()
      ..addAll(updatedMarkers);

    setState(() {
      _areMarkersLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VMAP',textAlign: TextAlign.center),
        backgroundColor: Color.fromRGBO(17, 25, 63, 1),
      ),
      body: Stack(
        children: <Widget>[
          // Google Map widget
          Opacity(
            opacity: _isMapLoading ? 0 : 1,
            child: GoogleMap(
              mapToolbarEnabled: true,
              zoomGesturesEnabled: true,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              zoomControlsEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(23.274426926935526, 79.86402527106432),
                zoom: _currentZoom,
              ),
              markers: _markers,
              onMapCreated: (controller) => _onMapCreated(controller),
              onCameraMove: (position) => _updateMarkers(position.zoom),
            ),
          ),

          // Map loading indicator
          Opacity(
            opacity: _isMapLoading ? 1 : 0,
            child: Center(child: CircularProgressIndicator()),
          ),
          Positioned(
            top:600,
            right:40,
            child:
          new Container(
            child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      },
                      child: Text('<'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(25,25),
                        primary: Color.fromRGBO(17, 25, 63, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)
                        ),
                      )
                  )]

            ),),
          ),

          // Map markers loading indicator
          if (_areMarkersLoading)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Card(
                  elevation: 2,
                  color: Colors.grey.withOpacity(0.9),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      'Loading',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}