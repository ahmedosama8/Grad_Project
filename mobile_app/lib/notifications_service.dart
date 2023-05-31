import 'dart:ffi';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class NotficationService {
  static Future<void> initializeNotification() async {

    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: 'high_importance_channel',
          channelKey: 'high_importance_channel',
          channelName: 'Basic notifications',
          channelDescription: 'channelDescription',
          defaultColor: Colors.black,
          ledColor: Colors.amber,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          onlyAlertOnce: true,
          playSound: true,
          criticalAlerts: true
          )


      ],
      channelGroups: [
        NotificationChannelGroup(
         channelGroupKey: 'high_importance_channel_group',
         channelGroupName: 'Group 1'
         )
      ],
      debug: true,
    );

    await AwesomeNotifications().isNotificationAllowed().then((isAllowed) async {

      if (!isAllowed) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
        
      }

    } 
    


    
    
    
    );


    await AwesomeNotifications().setListeners(
      
      onActionReceivedMethod: onActionReceivedMethod ,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
      
      );

  }
    static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async{

        debugPrint('OnNotficationCreateMethod');
      }
    static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async{

        debugPrint('OnNotficationDisplayedMethod');
      }


   static Future<void> onDismissActionReceivedMethod(
      ReceivedNotification receivedAction) async{

        debugPrint('OnDismissMethod');
      }

    static Future<void> onActionReceivedMethod(
      ReceivedNotification receivedAction) async{

        debugPrint('onActionRecived');
      }


static Future<void> showNotification({
  required final String title,
  required final String body,
  final String? summary,
  final Map<String, String>? payload,
  final ActionType actionType = ActionType.Default,
  final NotificationLayout notificationLayout = NotificationLayout.Default,
  final NotificationCategory? category,
  final String? bigPicture,
  final List<NotificationActionButton>? actionButtons,
  final bool scheduled = false,
  final int? interval,
  final String? scheduledTime, // New parameter for specifying the scheduled time
  final String? scheduledDate, // New parameter for specifying the scheduled date
}) async {
  assert(!scheduled || (scheduled && interval != null));

  DateTime? scheduledDateTime;

  if (scheduledDate != null && scheduledTime != null) {
    final parsedDate = DateFormat('yyyy-MM-dd').parse(scheduledDate);
    final parsedTime = DateFormat('hh:mm a').parse(scheduledTime);
    scheduledDateTime = DateTime(
      parsedDate.year,
      parsedDate.month,
      parsedDate.day,
      parsedTime.hour,
      parsedTime.minute,
    );
  }

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: -1,
      channelKey: 'high_importance_channel',
      title: title,
      body: body,
      actionType: actionType,
      notificationLayout: notificationLayout,
      summary: summary,
      category: category,
      payload: payload,
      bigPicture: bigPicture,
    ),
    actionButtons: actionButtons,
    schedule: scheduledDateTime != null
        ? NotificationCalendar.fromDate(
            date: scheduledDateTime,
            allowWhileIdle: true,
          )
        : (scheduled
            ? NotificationInterval(
                interval: interval!,
                timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
                preciseAlarm: true,
              )
            : null),
  );
}

}

