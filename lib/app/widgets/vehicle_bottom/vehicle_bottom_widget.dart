import 'package:fl_rastreio/app/shared/models/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart" as latLng;

class VehicleBottomWidget extends StatefulWidget {
  final Vehicle vehicle;

  VehicleBottomWidget({
    @required this.vehicle,
  });

  @override
  _VehicleBottomWidgetState createState() => _VehicleBottomWidgetState();
}

class _VehicleBottomWidgetState extends State<VehicleBottomWidget> {
  _getLatLng() {
    return latLng.LatLng(-25.435307, -49.304425);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 200,
            child: FlutterMap(
              options: MapOptions(
                center: _getLatLng(),
                zoom: 15.0,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      'https://www.google.com/maps/vt/pb=!1m4!1m3!1i{z}!2i{x}!3i{y}!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425',
                ),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: _getLatLng(),
                      builder: (_) => Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.vehicle.name} • ${widget.vehicle.licensePlate}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  widget.vehicle.lastPosition.address,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
