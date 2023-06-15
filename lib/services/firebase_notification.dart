import 'package:firebase_messaging/firebase_messaging.dart';

class Notifications{
  noteToken()async{
      final fcmToken=await FirebaseMessaging.instance.getAPNSToken();
      print("$fcmToken");    
  }
}