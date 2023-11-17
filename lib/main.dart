import 'package:flutter/material.dart';
import 'package:notification/background_service.dart';
import 'package:notification/constant/strings.dart';
import 'package:notification/home_page.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized;

  await Permission.notification.isDenied.then((value){
    if(value){
      Permission.notification.request();
    }
  });

  await initializeService();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {




  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage()
    );
  }
}

