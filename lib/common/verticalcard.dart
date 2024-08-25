import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitat_app/datamodel/todocontroller.dart';
import 'package:habitat_app/datamodel/todogetdata.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HVerticalcard extends StatelessWidget {
  const HVerticalcard({
    super.key,
    required this.index,
  });
  @override
  final int index;
  Widget build(BuildContext context) {
    final controller =
        Get.put(ItemController(firestoreService: FirestoreService()));
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                controller.items[index].name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Iconsax.add5)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularPercentIndicator(
              radius: 50,
              percent: 0.7,
              progressColor: Color.fromARGB(255, 19, 127, 75),
              backgroundColor: Colors.grey,
            ),
          ),
          Text(
            "70/100",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
