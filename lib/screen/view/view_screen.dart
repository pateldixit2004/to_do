import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/screen/cortroller/to_do_cortroller.dart';
import 'package:to_do/screen/model/to.dart';

class viewScreen extends StatefulWidget {
  const viewScreen({Key? key}) : super(key: key);

  @override
  State<viewScreen> createState() => _viewScreenState();
}

class _viewScreenState extends State<viewScreen> {
  TextEditingController txttitle = TextEditingController();
  TextEditingController txtdate = TextEditingController();
  TextEditingController txtnote = TextEditingController();

  TextEditingController txtpro = TextEditingController();
  TextEditingController txttime = TextEditingController();
  ToDoController controller = Get.put(ToDoController());
  Map m1 = {};

  @override
  void initState() {
    m1 = Get.arguments;

    controller.dateTime.value = controller.setDateFormat(DateTime.now());

    if (m1['status'] == '0') {
      DoModel d1 = m1['data'];
      txttitle = TextEditingController(text: d1.title);
      txtnote = TextEditingController(text: d1.note);
      txtpro = TextEditingController(text: d1.priolity);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  DateTime? picker = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2050));
                  controller.dateTime.value = controller.setDateFormat(picker!);
                },
                icon: Icon(Icons.calendar_month))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [


              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text('Select Date'),
              //     // IconButton(
              //     //     onPressed: () async {
              //     //       DateTime? picker = await showDatePicker(
              //     //           context: context,
              //     //           initialDate: DateTime.now(),
              //     //           firstDate: DateTime(2000),
              //     //           lastDate: DateTime(2040));
              //     //
              //     //       controller.dateTime.value =
              //     //           controller.setDateFormat(picker!);
              //     //     },
              //     //     icon: Icon(Icons.date_range)),
              //     Obx(
              //       () => Text("${controller.dateTime}"),
              //     ),
              //   ],
              // ),

              //DropDrownMenu
              Obx(
                () => DropdownButton(
                  items: controller.priorityList
                      .map((e) => DropdownMenuItem(
                            child: Center(
                              child: Text("$e"),
                            ),
                            value: e,
                          ))
                      .toList(),
                  hint: Text('hyyy'),
                  onChanged: (value) {
                    controller.selectPriority.value = value as String;
                  },
                  value: controller.selectPriority.value,
                  isExpanded: true,
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: txttitle,
                decoration: InputDecoration(hintText: 'title',
                    labelText: 'Title',
                    labelStyle: TextStyle(color: Colors.deepOrange),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))

                ),

              ),
              SizedBox(height: 10,),
              TextField(
                controller: txtpro,
                style: TextStyle(),
                decoration: InputDecoration(hintText: 'priority',
                    labelText: 'priority',
                    labelStyle: TextStyle(color: Colors.deepOrange),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                ),

              ),
              SizedBox(height: 10,),
              TextField(
                controller: txtnote,
                decoration: InputDecoration(hintText: 'note',
                    labelText: 'Note',
                    labelStyle: TextStyle(color: Colors.deepOrange),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))

                ),
                maxLines: 5,
              ),
              SizedBox(height: 10,),
             Container(
               height: 100,
                width: 100,
               color: Colors.red,
               child: ElevatedButton(onPressed: () async {
                 // DoModel d1 =DoModel(date:'${controller.postDate}' );

                 DateTime? picker = await showDatePicker(
                     context: context,
                     initialDate: DateTime.now(),
                     firstDate: DateTime(2000),
                     lastDate: DateTime(2050));
                 controller.dateTime.value = controller.setDateFormat(picker!);
               }, child: Obx(() =>  Text('${controller.dateTime}'))),
             ),
//data
              // Obx(
              //   () => TextField(
              //     controller: txtdate,
              //     style: TextStyle(),
              //     decoration: InputDecoration(hintText: '${controller.dateTime}',
              //       labelText: 'Date',
              //       labelStyle: TextStyle(color: Colors.deepOrange),
              //       prefixIcon: IconButton(
              //           onPressed: () async {
              //             DateTime? picker = await showDatePicker(
              //                 context: context,
              //                 initialDate: DateTime.now(),
              //                 firstDate: DateTime(2000),
              //                 lastDate: DateTime(2050));
              //             controller.dateTime.value = controller.setDateFormat(picker!);
              //
              //           },
              //           icon: Icon(Icons.calendar_month)),
              //     ),
              //
              //   ),
              // ),

              //Time
              GestureDetector(
                onTap: () async {

                  TimeOfDay? t1=await showTimePicker(context: context, initialTime: TimeOfDay.now());
                  controller.changetime(t1!);
                },
                child: Text('${controller.timeOfDay}'),
              ),


              ElevatedButton(
                  onPressed: () {
                    if (m1['status'] == '0') {
                      DoModel d1 = DoModel(
                          title: txttitle.text,
                          priolity: txtpro.text,
                          note: txtnote.text);
                      controller.dataList[m1['index']] = d1;
                    }
                    else {
                      DoModel d1 = DoModel(
                        date: '${controller.postDate}',
                        // date: txtdate.text,
                          title: txttitle.text,
                          priolity: txtpro.text,
                          note: txtnote.text,
                         );
                      controller.dataList.add(d1);
                    }
                    Get.back();
                  },
                  child: m1['status'] == '0'?Text("Update"):Text('Add'))
            ],
          ),
        ),
      ),
    );
  }
}
