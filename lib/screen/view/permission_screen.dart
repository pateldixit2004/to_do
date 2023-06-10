import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({Key? key}) : super(key: key);

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(

                onPressed: () async {


                  var status = await Permission.storage.status;
                  if(status.isDenied)
                    {
                      await Permission.storage.request();
                    }
                  else
                    {
                      Get.snackbar("Permission is Granted", "Storage");
                    }

                },
                child: Text("File access Permission"),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () async {
                    openAppSettings();
                },
                child: Text("OpenSettings"),
              ),
              ElevatedButton(
                onPressed: () async {
                  Map<Permission, PermissionStatus> statuses = await [
                    Permission.location,
                    Permission.storage,
                    Permission.camera,
                  ].request();
                },
                child: Text("MultiPermission"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
