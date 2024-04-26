import 'package:flutter/material.dart';
import 'package:yanci/app/modules/notifications/views/widgets/notification_tile.dart';
import 'package:yanci/app/services/responsive_size.dart';

class MarketUpdates extends StatelessWidget {
  const MarketUpdates({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.kh),
          child: const Column(
            children: [
              NotificationsTile(),
              NotificationsTile(),
              NotificationsTile(),
              NotificationsTile(),
              NotificationsTile(),
            ],
          ),
        ),
      ),
    );
  }
}
