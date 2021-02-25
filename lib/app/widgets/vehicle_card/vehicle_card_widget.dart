import 'package:fl_rastreio/app/shared/models/vehicle.dart';
import 'package:fl_rastreio/app/shared/utils/lf_colors.dart';
import 'package:flutter/material.dart';

class VehicleCardWidget extends StatelessWidget {
  final Vehicle vehicle;
  final Function onTap;

  VehicleCardWidget({
    @required this.vehicle,
    this.onTap,
  });

  Color _getColorFromType() {
    switch (vehicle.type) {
      case 'C':
        return LfColors.blue;
        break;
      case 'M':
        return LfColors.orange;
        break;
      case 'T':
        return LfColors.cyan;
        break;
      case 'B':
        return LfColors.purple;
        break;
      default:
        return LfColors.pink;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 72,
        decoration: BoxDecoration(
          color: LfColors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            SizedBox(width: 12),
            Container(
              height: 48,
              width: 4,
              decoration: BoxDecoration(
                color: _getColorFromType(),
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
                      color: LfColors.orange.withOpacity(0.9),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    vehicle.lastPosition.address,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
