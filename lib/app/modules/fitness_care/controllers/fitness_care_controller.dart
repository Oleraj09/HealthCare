import 'dart:async';
 
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
 
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:get/get.dart';
 

class FitnessCareController extends GetxController {
  
  late FlutterLocalNotificationsPlugin _notificationsPlugin;       //initializing local notification
  int? timeHour = 0;
  int? timeMinute = 0;

  @override
  void onInit() {
    _notificationsPlugin = FlutterLocalNotificationsPlugin();
    init(initSchedule: true);                                     //calling notfication initializer

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<TimeOfDay?> showPicker(BuildContext context) async {
    TimeOfDay? timePicker = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),                                          //Showing user a clock for selecting time
    ).then((val) {
      if (val != null) {
        timeHour = val.hour;
        timeMinute = val.minute;
      } else {
        Get.snackbar("Alarm Not Selected", "Pick your alarm",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.white,
            colorText: Colors.black);
      }
    });
    return timePicker;
  }

  @override
  void onClose() {}
  Future showScheduledNotification({
    int? id,
    String? title,
    String? body,
    String? payload,
    /*    required DateTime scheduleDate*/
  }) async =>
      _notificationsPlugin.zonedSchedule(
          id!,
          title,
          body,
          scheduleDaily(Time(                                       //Scheduled alarm method to display notification
            timeHour!,
            timeMinute!,
          )),
          //   tz.TZDateTime.from(scheduleDate, tz.local),
          await _notificationDetails(id: id),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidAllowWhileIdle: true,
          payload: payload,
          matchDateTimeComponents: DateTimeComponents.time);

  static Future _notificationDetails({int? id}) async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
          (id = id! + 1).toString(), (id).toString(),
          importance: Importance.max, icon: 'mipmap/ic_launcher'),                          
    );
  }

  static tz.TZDateTime scheduleDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local);

    final scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);                                             
    print(scheduleDate);                                                              //Scheduled time picked by alert clock
    return scheduleDate.isBefore(now)
        ? scheduleDate.add(Duration(days: 1))
        : scheduleDate;
  }

  Future init({bool initSchedule = false}) async {
    final android =   AndroidInitializationSettings('@mipmap/ic_launcher');
    final  iOS = IOSInitializationSettings();
    final settings = InitializationSettings(android: android, iOS: iOS);
    await _notificationsPlugin.initialize(
      settings,
      onSelectNotification: (payload) => Get.toNamed(payload.toString()),
    );
    if (initSchedule) {
      tz.initializeTimeZones();
      final locationName = await FlutterNativeTimezone.getLocalTimezone();                              //For getting location based time
      tz.setLocalLocation(tz.getLocation(locationName));
    }
  }
}
 
 
