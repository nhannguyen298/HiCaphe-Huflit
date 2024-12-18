import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/page-1/QuanLyKH.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  Map payload = {};
  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    if (message is RemoteMessage)  {
      payload = message.data;
    }
    // if (message is NotificationResponse) {
    //   payload = jsonDecode(message.payload!);
    // }
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(child: Text(message.notification!.title.toString(), style: TextStyle(fontFamily: 'Quicksand', fontSize: 12)))),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text(message.notification!.body.toString(), style: TextStyle(fontFamily: 'Quicksand', fontSize: 12)),   // Chỉnh sửa dòng này
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => QuanLyKH()),
              );
            },
            child: const Text('Quay lại trang chủ', style: TextStyle(fontFamily: 'Quicksand', fontSize: 12)),
          ),
        ),
      );
  }
}
