import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitat_app/common/gridlayout.dart';
import 'package:habitat_app/common/verticalcard.dart';
import 'package:habitat_app/datamodel/todocontroller.dart';
import 'package:habitat_app/datamodel/todogetdata.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(ItemController(firestoreService: FirestoreService()));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello,Soumya",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Iconsax.notification))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // habbits heading
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "HABITS",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Add more",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w600),
                      ),
                    ),
                    onTap: () {},
                  )
                ],
              ),
//Graphs
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (controller.items.isEmpty) {
                  return Center(child: Text('No items found'));
                }

                return GridLayout(
                  itemCount: controller.items.length,
                  itemBuilder: (_, index) => Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            controller.items[index].imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            controller.items[index].name,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //HVerticalcard(
                  //  index: controller.items.length,
                  //   )
                );
              }),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Habbit Completed Today",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LinearPercentIndicator(
                      lineHeight: 8.0,
                      percent: 0.9,
                      progressColor: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "3/4",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
