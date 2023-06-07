import 'dart:math';

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
  TextEditingController txtpro = TextEditingController();
  TextEditingController txttitle = TextEditingController();
  TextEditingController txtnote = TextEditingController();
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
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Select Date'),
                IconButton(
                    onPressed: () async {
                      DateTime? picker = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2040));

                      controller.dateTime.value = controller.setDateFormat(picker!);
                    },
                    icon: Icon(Icons.date_range)),
                Obx(
                  () =>  Text(
                      "${controller.dateTime}"),
                ),
              ],
            ),
            Obx(
              () =>  DropdownButton(
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
                    controller.selectPriority.value = value as String ;
                  },
                  value: controller.selectPriority.value,
                  isExpanded: true,

              ),
            ),
            TextField(
              controller: txtpro,
            ),
            TextField(
              controller: txttitle,
            ),
            TextField(
              controller: txtnote,
            ),
            ElevatedButton(
                onPressed: () {
                  if (m1['status'] == '0') {
                    DoModel d1 = DoModel(
                        title: txttitle.text,
                        priolity: txtpro.text,
                        note: txtnote.text);
                    controller!.dataList[m1['index']] = d1;
                  } else {
                    DoModel d1 = DoModel(
                        title: txttitle.text,
                        priolity: txtpro.text,
                        note: txtnote.text);
                    controller!.dataList.add(d1);
                  }
                  Get.back();
                },
                child: Text("Add"))
          ],
        ),
      ),
    );
  }
}
