import 'package:get/get.dart';
import 'package:to_do/screen/model/to.dart';
import 'package:intl/intl.dart';

class ToDoController extends GetxController
{

  RxList<DoModel> dataList=<DoModel>[
    DoModel(title: 'TAsk',date: '3-3-23',note: 'dghsd',priolity: 'high',time: '10'),
    DoModel(title: 'TAsk',date: '3-3-23',note: 'dghsd',priolity: 'high',time: '10'),
    DoModel(title: 'TAsk',date: '3-3-23',note: 'dghsd',priolity: 'high',time: '10'),
  ].obs;


  List priorityList=['urgent','High','Medium','Low'];
  RxString selectPriority="urgent".obs;

  RxString dateTime = "${DateTime.now()}".obs;

  String setDateFormat(DateTime dm)
  {
    var f = DateFormat("dd-MM-yyyy");
    return f.format(dm);
  }

}