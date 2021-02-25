import 'package:fl_rastreio/app/widgets/vehicle_bottom/vehicle_bottom_widget.dart';
import 'package:fl_rastreio/app/widgets/vehicle_card/vehicle_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    controller.onRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LF Rastreio'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: controller.about,
            itemBuilder: (BuildContext context) {
              return controller.urls.map((Map url) {
                return PopupMenuItem<String>(
                  value: url['link'],
                  child: Text(url['description']),
                );
              }).toList();
            },
          )
        ],
      ),
      body: Observer(
        builder: (context) {
          return SmartRefresher(
            controller: controller.refreshController,
            enablePullDown: true,
            onRefresh: controller.onRefresh,
            child: ListView.separated(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
              separatorBuilder: (_, index) {
                return SizedBox(height: 8);
              },
              itemCount: controller.vehicles.length,
              itemBuilder: (_, index) {
                final vehicle = controller.vehicles[index];

                return VehicleCardWidget(
                  vehicle: vehicle,
                  onTap: () => showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    builder: (_) {
                      return VehicleBottomWidget(
                        vehicle: vehicle,
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
