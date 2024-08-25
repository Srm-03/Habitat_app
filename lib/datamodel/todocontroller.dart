import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitat_app/datamodel/datamodel_atrributes.dart';
import 'package:uuid/uuid.dart';

class Todocontroller extends GetxController {
  int index = 0;
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();

  final uid = Uuid();
  final db = FirebaseFirestore.instance;
  RxList<Item> items = <Item>[].obs;

  @override
  void onInit() {
    fettodos();
    super.onInit();
  }

  Future<void> addtodo() async {
    String id = uid.v4();
    var newtodo = Item(id: id, name: name.text, mesurements: number.text);
    await db.collection("Items").doc(id).set(
          newtodo.toJson(),
        );
    Get.snackbar("ready", "Your Task");
    print("Todo Added");
    index++;
  }

  void fettodos() async {
    try {
      final product = await gettodo();
      items.assignAll(items);
    } catch (e) {}
  }

  Future<void> gettodo() async {
    await db.collection("Items").get().then(
      (alltodo) {
        for (var todo in alltodo.docs) {
          items.add(Item.fromJson(todo.data()));
        }
      },
    );
  }
}
