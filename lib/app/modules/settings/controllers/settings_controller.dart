import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:health_care/app/data/local_%20storage/localdb.dart';
import 'package:health_care/app/modules/diet_control/controllers/diet_control_controller.dart';
import 'package:health_care/app/modules/medicine_disease_info/controllers/medicine_disease_info_controller.dart';
import 'package:health_care/app/routes/app_pages.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class SettingsController extends GetxController {
  final medicieDiseaseController = Get.put(MedicineDiseaseInfoController());
  final dietController = Get.put(DietControlController());
  late FlutterLocalNotificationsPlugin _notificationsPlugin;
  static final onNotifications = BehaviorSubject<String?>();
  int? timeHour, timeMinute;

  @override
  void onInit() {
    _notificationsPlugin = FlutterLocalNotificationsPlugin();
    init(initSchedule: true);
    listenNotifications();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void signOut() async {
    await FirebaseAuth.instance.signOut().whenComplete(() {           //Sign out button
      clearCacheData();
      Get.offAllNamed(Routes.LOGIN);
    });
  }

  clearCacheData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    LocalDatabase.saveLoginData(false);
    pref.remove(LocalDatabase.fNameKey);
    pref.remove(LocalDatabase.emailKey);
    pref.remove(LocalDatabase.genderKey);
    pref.remove(LocalDatabase.ageKey);                           //removing cached data of an user while loggin out
    pref.remove(LocalDatabase.heightKey);
    pref.remove(LocalDatabase.weightKey);
    pref.remove(LocalDatabase.pBarKey);
    pref.remove(LocalDatabase.waterKey);
    pref.remove(LocalDatabase.pBarKey2);
    pref.remove(LocalDatabase.foodKey);
  }

  Future<TimeOfDay?> showPicker(BuildContext context) async {
    TimeOfDay? timePicker = await showTimePicker(                               //Picking alarm time
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((val) {
      if (val != null) {
        timeHour = val.hour;
        timeMinute = val.minute;
      } else {
        Get.snackbar("Alarm Not Selected", "Pick your alarm",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.white,
            colorText: Colors.black);
        timeHour ?? 0;
        timeMinute ?? 0;
      }
    });
    return timePicker;
  }

  Future showScheduledNotificationMorning({                               //For showing scheduled notifications depending on time
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
          scheduleDaily(Time(
            timeHour ?? 0,
            timeMinute ?? 0,
          )),
          //   tz.TZDateTime.from(scheduleDate, tz.local),
          await _notificationDetails(id: id),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidAllowWhileIdle: true,
          payload: payload,
          matchDateTimeComponents: DateTimeComponents.time);

  Future _notificationDetails({int? id}) async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
          (id = id! + 1).toString(), (id).toString(),
          importance: Importance.max, icon: 'mipmap/ic_launcher'),
    );
  }

  tz.TZDateTime scheduleDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local);

    final scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,                    //Getting scheduled time picked by user
                                                                                                    // Same for all notification functions
        time.hour, time.minute, time.second);
    print(scheduleDate);
    return scheduleDate.isBefore(now)
        ? scheduleDate.add(const Duration(days: 1))
        : scheduleDate;
  }

  Future showScheduledNotificationNoon({
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
          scheduleDailyNoon(Time(
            timeHour ?? 0,
            timeMinute ?? 0,
          )),
          //   tz.TZDateTime.from(scheduleDate, tz.local),
          await _notificationDetailsNoon(id: id),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidAllowWhileIdle: true,
          payload: payload,
          matchDateTimeComponents: DateTimeComponents.time);

  Future _notificationDetailsNoon({int? id}) async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
          (id = id! + 1).toString(), (id).toString(),
          importance: Importance.max, icon: 'mipmap/ic_launcher'),
    );
  }

  tz.TZDateTime scheduleDailyNoon(Time time) {
    final now = tz.TZDateTime.now(tz.local);

    final scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);
    print(scheduleDate);
    return scheduleDate.isBefore(now)
        ? scheduleDate.add(const Duration(days: 1))
        : scheduleDate;
  }

  Future showScheduledNotificationNight({
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
          scheduleDailyNight(Time(
            timeHour ?? 0,
            timeMinute ?? 0,
          )),
          //   tz.TZDateTime.from(scheduleDate, tz.local),
          await _notificationDetailsNight(id: id),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidAllowWhileIdle: true,
          payload: payload,
          matchDateTimeComponents: DateTimeComponents.time);

  Future _notificationDetailsNight({int? id}) async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
          (id = id! + 1).toString(), (id).toString(),
          importance: Importance.max, icon: 'mipmap/ic_launcher'),
    );
  }

  tz.TZDateTime scheduleDailyNight(Time time) {
    final now = tz.TZDateTime.now(tz.local);

    final scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);
    print(scheduleDate);
    return scheduleDate.isBefore(now)
        ? scheduleDate.add(const Duration(days: 1))
        : scheduleDate;
  }

  Future showScheduledNotificationOne({
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
          scheduleDailyOne(Time(
            timeHour ?? 0,
            timeMinute ?? 0,
          )),
          //   tz.TZDateTime.from(scheduleDate, tz.local),
          await _notificationDetailsOne(id: id),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidAllowWhileIdle: true,
          payload: payload,
          matchDateTimeComponents: DateTimeComponents.time);

  Future _notificationDetailsOne({int? id}) async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
          (id = id! + 1).toString(), (id).toString(),
          importance: Importance.max, icon: 'mipmap/ic_launcher'),
    );
  }

  tz.TZDateTime scheduleDailyOne(Time time) {
    final now = tz.TZDateTime.now(tz.local);

    final scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);
    print(scheduleDate);
    return scheduleDate.isBefore(now)
        ? scheduleDate.add(const Duration(days: 1))
        : scheduleDate;
  }

  Future showScheduledNotificationTwo({
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
          scheduleDailyTwo(Time(
            timeHour ?? 0,
            timeMinute ?? 0,
          )),
          //   tz.TZDateTime.from(scheduleDate, tz.local),
          await _notificationDetailsTwo(id: id),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidAllowWhileIdle: true,
          payload: payload,
          matchDateTimeComponents: DateTimeComponents.time);

  Future _notificationDetailsTwo({int? id}) async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
          (id = id! + 1).toString(), (id).toString(),
          importance: Importance.max, icon: 'mipmap/ic_launcher'),
    );
  }

  tz.TZDateTime scheduleDailyTwo(Time time) {
    final now = tz.TZDateTime.now(tz.local);

    final scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);
    print(scheduleDate);
    return scheduleDate.isBefore(now)
        ? scheduleDate.add(const Duration(days: 1))
        : scheduleDate;
  }

  Future showScheduledNotificationThree({
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
          scheduleDailyTwo(Time(
            timeHour ?? 0,
            timeMinute ?? 0,
          )),
          //   tz.TZDateTime.from(scheduleDate, tz.local),
          await _notificationDetailsThree(id: id),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidAllowWhileIdle: true,
          payload: payload,
          matchDateTimeComponents: DateTimeComponents.time);

  Future _notificationDetailsThree({int? id}) async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
          (id = id! + 1).toString(), (id).toString(),
          importance: Importance.max, icon: 'mipmap/ic_launcher'),
    );
  }

  tz.TZDateTime scheduleDailyThree(Time time) {
    final now = tz.TZDateTime.now(tz.local);

    final scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);
    print(scheduleDate);
    return scheduleDate.isBefore(now)
        ? scheduleDate.add(const Duration(days: 1))
        : scheduleDate;
  }

  Future showScheduledNotificationFour({
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
          scheduleDailyFour(Time(
            timeHour ?? 0,
            timeMinute ?? 0,
          )),
          //   tz.TZDateTime.from(scheduleDate, tz.local),
          await _notificationDetailsFour(id: id),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidAllowWhileIdle: true,
          payload: payload,
          matchDateTimeComponents: DateTimeComponents.time);

  Future _notificationDetailsFour({int? id}) async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
          (id = id! + 1).toString(), (id).toString(),
          importance: Importance.max, icon: 'mipmap/ic_launcher'),
    );
  }

  tz.TZDateTime scheduleDailyFour(Time time) {
    final now = tz.TZDateTime.now(tz.local);

    final scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);
    print(scheduleDate);
    return scheduleDate.isBefore(now)
        ? scheduleDate.add(const Duration(days: 1))
        : scheduleDate;
  }

  Future showScheduledNotificationFive({
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
          scheduleDailyFive(Time(
            timeHour ?? 0,
            timeMinute ?? 0,
          )),
          //   tz.TZDateTime.from(scheduleDate, tz.local),
          await _notificationDetailsFive(id: id),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidAllowWhileIdle: true,
          payload: payload,
          matchDateTimeComponents: DateTimeComponents.time);

  Future _notificationDetailsFive({int? id}) async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
          (id = id! + 1).toString(), (id).toString(),
          importance: Importance.max, icon: 'mipmap/ic_launcher'),
    );
  }

  tz.TZDateTime scheduleDailyFive(Time time) {
    final now = tz.TZDateTime.now(tz.local);

    final scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);
    print(scheduleDate);
    return scheduleDate.isBefore(now)
        ? scheduleDate.add(const Duration(days: 1))
        : scheduleDate;
  }

  Future showScheduledNotificationSix({
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
          scheduleDailySix(Time(
            timeHour ?? 0,
            timeMinute ?? 0,
          )),
          //   tz.TZDateTime.from(scheduleDate, tz.local),
          await _notificationDetailsSix(id: id),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidAllowWhileIdle: true,
          payload: payload,
          matchDateTimeComponents: DateTimeComponents.time);

  Future _notificationDetailsSix({int? id}) async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
          (id = id! + 1).toString(), (id).toString(),
          importance: Importance.max, icon: 'mipmap/ic_launcher'),
    );
  }

  tz.TZDateTime scheduleDailySix(Time time) {
    final now = tz.TZDateTime.now(tz.local);

    final scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);
    print(scheduleDate);
    return scheduleDate.isBefore(now)
        ? scheduleDate.add(const Duration(days: 1))
        : scheduleDate;
  }

  Future showScheduledNotificationSeven({
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
          scheduleDailySeven(Time(
            timeHour ?? 0,
            timeMinute ?? 0,
          )),
          //   tz.TZDateTime.from(scheduleDate, tz.local),
          await _notificationDetailsSeven(id: id),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidAllowWhileIdle: true,
          payload: payload,
          matchDateTimeComponents: DateTimeComponents.time);

  Future _notificationDetailsSeven({int? id}) async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
          (id = id! + 1).toString(), (id).toString(),
          importance: Importance.max, icon: 'mipmap/ic_launcher'),
    );
  }

  tz.TZDateTime scheduleDailySeven(Time time) {
    final now = tz.TZDateTime.now(tz.local);

    final scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);
    print(scheduleDate);
    return scheduleDate.isBefore(now)
        ? scheduleDate.add(const Duration(days: 1))
        : scheduleDate;
  }

  Future showScheduledNotificationEight({
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
          scheduleDailyEight(Time(
            timeHour ?? 0,
            timeMinute ?? 0,
          )),
          //   tz.TZDateTime.from(scheduleDate, tz.local),
          await _notificationDetailsEight(id: id),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidAllowWhileIdle: true,
          payload: payload,
          matchDateTimeComponents: DateTimeComponents.time);

  Future _notificationDetailsEight({int? id}) async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
          (id = id! + 1).toString(), (id).toString(),
          importance: Importance.max, icon: 'mipmap/ic_launcher'),
    );
  }

  tz.TZDateTime scheduleDailyEight(Time time) {
    final now = tz.TZDateTime.now(tz.local);

    final scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);
    print(scheduleDate);
    return scheduleDate.isBefore(now)
        ? scheduleDate.add(const Duration(days: 1))
        : scheduleDate;
  }

  Future showScheduledNotificationNine({
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
          scheduleDailyNine(Time(
            timeHour ?? 0,
            timeMinute ?? 0,
          )),
          //   tz.TZDateTime.from(scheduleDate, tz.local),
          await _notificationDetailsNine(id: id),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidAllowWhileIdle: true,
          payload: payload,
          matchDateTimeComponents: DateTimeComponents.time);

  Future _notificationDetailsNine({int? id}) async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
          (id = id! + 1).toString(), (id).toString(),
          importance: Importance.max, icon: 'mipmap/ic_launcher'),
    );
  }

  tz.TZDateTime scheduleDailyNine(Time time) {
    final now = tz.TZDateTime.now(tz.local);

    final scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);
    print(scheduleDate);
    return scheduleDate.isBefore(now)
        ? scheduleDate.add(const Duration(days: 1))
        : scheduleDate;
  }

  Future showScheduledNotificationTen({
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
          scheduleDailyTen(Time(
            timeHour ?? 0,
            timeMinute ?? 0,
          )),
          //   tz.TZDateTime.from(scheduleDate, tz.local),
          await _notificationDetailsTen(id: id),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidAllowWhileIdle: true,
          payload: payload,
          matchDateTimeComponents: DateTimeComponents.time);

  Future _notificationDetailsTen({int? id}) async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
          (id = id! + 1).toString(), (id).toString(),
          importance: Importance.max, icon: 'mipmap/ic_launcher'),
    );
  }

  tz.TZDateTime scheduleDailyTen(Time time) {
    final now = tz.TZDateTime.now(tz.local);
     
    final scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,                  //Getting scheduled date and time
        time.hour, time.minute, time.second);
    print(scheduleDate);
    return scheduleDate.isBefore(now)
        ? scheduleDate.add(const Duration(days: 1))
        : scheduleDate;
  }

  Future init({bool initSchedule = false}) async {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = IOSInitializationSettings();
    final settings = InitializationSettings(android: android, iOS: iOS);                    //Initializing notifications
    await _notificationsPlugin.initialize(settings,
        onSelectNotification: (payload) async {
      onNotifications.add(payload);
    });
    if (initSchedule) {
      tz.initializeTimeZones();
      final locationName = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(locationName));
    }
  }

  cancelNotification(var title, var id) async {
    await _notificationsPlugin.cancel(id).whenComplete(() => Get.snackbar(
        title, "Canceled",
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black));
  }

  cancelAllNotification() async => await _notificationsPlugin
      .cancelAll()
      .whenComplete(() => Get.snackbar("All Alarm", "Canceled",                    //For canceling all notifications
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.black));

  void listenNotifications() => onNotifications.stream.listen((event) {
        onClickedNotification();
      });

  void onClickedNotification() => Get.offAllNamed(Routes.WELCOME);
}
