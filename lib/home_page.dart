import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String text = "Stop service";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: const Text("Foreground service"),
                onPressed: () {
                  FlutterBackgroundService().invoke('setAsForeground');
                },
                ),

            ElevatedButton(
              child: const Text("Background service"),
              onPressed: () {
                FlutterBackgroundService().invoke('setAsBackground');
              },
            ),

            ElevatedButton(

              onPressed: () async {
                final service = FlutterBackgroundService();
                bool isRunning = await service.isRunning();

                if(isRunning){
                  service.invoke("stopService");
                  text = "service is started";
                }else{
                  service.startService();
                  text = "service is stopped";
                }

                setState(() {

                });


                FlutterBackgroundService().invoke('stopService');
              },
              child: Text("$text"),
            ),


          ],
        ),
      ),
    );
  }
}
