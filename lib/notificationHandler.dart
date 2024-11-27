import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handlerMessaging(RemoteMessage message) async
{
  print(message.data);
  print(message.from);
  print(message.messageId);
  print(message.notification);
}
class firebase_messaging_to_project
{
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> init() async
  {
    await _firebaseMessaging.requestPermission();
    final token = await _firebaseMessaging.getToken();
    print('token: $token');
    FirebaseMessaging.onBackgroundMessage(handlerMessaging);
  }
}