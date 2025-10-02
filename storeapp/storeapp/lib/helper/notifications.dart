import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';

class NotificationService {


  static void showSuccessNotification(BuildContext context, String title, String description) {
    ElegantNotification.success(
      title: Text(title),
      description: Text(description),
      toastDuration: const Duration(seconds: 3),
        animation : AnimationType.fromRight
    ).show(context);
  }
  static void showErrorNotification(BuildContext context, String title, String description) {
    ElegantNotification.error(
      title: Text(title),
      description: Text(description),
      toastDuration: const Duration(seconds: 3),
      animation: AnimationType.fromTop,
    ).show(context);
  }
  static void showInfoNotification(BuildContext context, String title, String description) {
    ElegantNotification.info(
      title: Text(title),
      description: Text(description),
      toastDuration: const Duration(seconds: 3),
      animation: AnimationType.fromTop,
    ).show(context);
  }
}