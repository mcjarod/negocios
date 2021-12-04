import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Geolocalizacion extends StatefulWidget {
  final String geo;
  final String title;
  const Geolocalizacion({required this.geo, Key? key, required this.title}) : super(key: key);


  @override
  State<Geolocalizacion> createState() => _GeolocalizacionState();
}

class _GeolocalizacionState extends State<Geolocalizacion> {
  @override
  Widget build(BuildContext context) {
    String lylon = widget.geo;
    var divid = [];
    divid = lylon.split(",");
    final d = [
      divid[0],
      divid[1]
    ];
    double lat = double.parse(divid[0]);
    double lon = double.parse(divid[1]);
    LatLng lalon= LatLng(lat, lon);
    Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
    final markerId = MarkerId(_markers.length.toString());
    final marker = Marker(
        markerId: markerId,
        //position: LatLng(8.75, -75.873),
        position: LatLng(lalon.latitude, lalon.longitude),
        infoWindow: InfoWindow(title: "Tienda"));
    _markers[markerId] = marker;
    Set<Marker> get_marquers = _markers.values.toSet();

    final _initialCameraPosition = CameraPosition(target: lalon, zoom: 15);

    return Scaffold(
        appBar: AppBar(
         title: Text(widget.title),
        ),
        body: GoogleMap(
          initialCameraPosition: _initialCameraPosition,
          markers: get_marquers,
        ));
  }
}
