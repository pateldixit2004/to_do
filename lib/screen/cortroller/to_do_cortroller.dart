import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/screen/model/to.dart';
import 'package:intl/intl.dart';

class ToDoController extends GetxController
{

  RxList<DoModel> dataList=<DoModel>[
    DoModel(title: 'Design Logo',date: '3-3-23',note: 'dghsd',priolity: 'high',time: '10'),
    DoModel(title: 'TAsk',date: '3-3-23',note: 'dghsd',priolity: 'high',time: '10'),
    DoModel(title: 'TAsk',date: '3-3-23',note: 'dghsd',priolity: 'high',time: '10'),
    
  ].obs;


  List priorityList=['urgent','High','Medium','Low'];
  RxString selectPriority="urgent".obs;

  RxString dateTime = "${DateTime.now()}".obs;


  RxString postDate=''.obs;

  void post(String dataTime)
  {
    postDate=dataTime.obs;
  }

  String setDateFormat(DateTime dm)
  {
    var f = DateFormat("dd-MM-yyyy");
    return f.format(dm);
  }

 TimeOfDay timeOfDay=TimeOfDay.now();
  void changetime(TimeOfDay t1)
  {
    timeOfDay=t1;
    update();
  }
}