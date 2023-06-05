import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/screen/cortroller/to_do_cortroller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ToDoController controller = Get.put(ToDoController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 150),
            itemBuilder: (context, index) {

              return GestureDetector(
                onDoubleTap: () {
                  controller!.dataList.removeAt(index);

                },
                onLongPress: () {
                  Get.toNamed('/view',arguments: {'status':'0','data':controller!.dataList[index],'index':index});
                },
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("${controller!.dataList[index].date}"),
                          Text("${controller!.dataList[index].priolity}."),
                        ],
                      ),
                      Row(
                        children: [
                          Text("${controller!.dataList[index].time}."),
                          Text("${controller!.dataList[index].title}."),
                        ],
                      ),
                    ],
                  ),
                ),
              );

            },
            itemCount: controller!.dataList.length,
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Get.toNamed('/view',arguments: {'status':'1'});
        },child: Icon(Icons.add),),
      ),
    );
  }
}
