import 'package:get/get.dart';
import 'package:to_do/screen/model/to.dart';

class ToDoController extends GetxController
{

  RxList<DoModel> dataList=<DoModel>[
    DoModel(title: 'TAsk',date: '3-3-23',note: 'dghsd',priolity: 'high',time: '10'),
    DoModel(title: 'TAsk',date: '3-3-23',note: 'dghsd',priolity: 'high',time: '10'),
    DoModel(title: 'TAsk',date: '3-3-23',note: 'dghsd',priolity: 'high',time: '10'),
  ].obs;


}