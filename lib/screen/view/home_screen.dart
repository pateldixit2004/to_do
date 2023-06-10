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
        appBar: AppBar(

          leading: Text("TO DO LIST",style: TextStyle(color: Colors.orange.shade900),),
          actions: [
            IconButton(onPressed: () {

            }, icon: Icon(Icons.settings))
          ],
        ),
        body: Column(
          children: [
            ListTile(
              leading: Icon(Icons.menu_open,color: Colors.red,),
              title: Text('LIST OF TODO',style: TextStyle(color: Colors.redAccent),),
              trailing: Icon(Icons.call_split_sharp),
            ),
            Obx(
              () => Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisExtent: 100),
                    itemBuilder: (context, index) {

                      return GestureDetector(
                        onDoubleTap: () {
                          controller!.dataList.removeAt(index);

                        },
                        onLongPress: () {
                          Get.toNamed('/view',arguments: {'status':'0','data':controller!.dataList[index],'index':index});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            color: index%2==0?Colors.purpleAccent:Colors.yellow,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("${controller.dataList[index].title}"),
                                      // Text("${controller.dataList[index].time}."),
                                      Text("${controller.dataList[index].priolity}."),
                                    ],
                                  ),
                                  Text('${controller.dataList[index].note}'),
                                  Row(
                                    children: [
                                      Text("${controller.dataList[index].date}."),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );

                    },
                    itemCount: controller!.dataList.length,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Get.toNamed('/view',arguments: {'status':'1'});
        },child: Icon(Icons.add),),
      ),
    );
  }
}
