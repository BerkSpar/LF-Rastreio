import 'package:fl_rastreio/app/shared/models/vehicle.dart';
import 'package:flutter/material.dart';

class VehicleCardWidget extends StatelessWidget {
  final Vehicle vehicle;

  VehicleCardWidget({
    @required this.vehicle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SizedBox(width: 12),
          Container(
            height: 48,
            width: 4,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  vehicle.name,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  vehicle.lastPosition.address,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          Icon(
            Icons.location_on_outlined,
            color: Colors.white30,
          ),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}
