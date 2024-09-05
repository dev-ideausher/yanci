import 'package:dio/dio.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:open_file/open_file.dart';

import 'dart:io' show Directory, Platform;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart'; // Ensure this is imported
import 'package:dio/dio.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class DownloadManager {
  final Dio _dio = Dio();
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  DownloadManager(this._flutterLocalNotificationsPlugin);

  Future<void> downloadFile(String url, String fileName) async {
    // Check and request storage permissions
    if (await Permission.storage.request().isGranted) {
      String savePath = await _getFilePath(fileName);

      try {
        // Start downloading
        await _dio.download(url, savePath, onReceiveProgress: (received, total) {
          if (total != -1) {
            print("Downloading: ${(received / total * 100).toStringAsFixed(0)}%");
          }
        });

        // Show a notification when download is complete
        _showNotification(fileName, savePath);
      } catch (e) {
        print("Download failed: $e");
      }
    } else {
      print("Permission denied");
    }
  }

  Future<String> _getFilePath(String fileName) async {
    Directory? directory;
    if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      throw UnsupportedError('Platform not supported');
    }
    return "${directory?.path}/$fileName";
  }

  Future<void> _showNotification(String fileName, String filePath) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'download_channel',
      'File Download',
      importance: Importance.max,
      priority: Priority.high,
    );
    var darwinPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: darwinPlatformChannelSpecifics,
    );

    await _flutterLocalNotificationsPlugin.show(
      0,
      'Download Complete',
      '$fileName has been downloaded.',
      platformChannelSpecifics,
      payload: filePath,
    );
  }
}

