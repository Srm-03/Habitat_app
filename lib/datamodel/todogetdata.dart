import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:habitat_app/datamodel/datamodel_atrributes.dart';

class FirestoreService {
  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('items');

  Future<List<Items>> getItems() async {
    QuerySnapshot querySnapshot = await _collectionRef.get();
    return querySnapshot.docs.map((doc) {
      return Items.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }
}

class ItemController extends GetxController {
  var items = <Items>[].obs;
  var isLoading = true.obs;

  final FirestoreService firestoreService;

  ItemController({required this.firestoreService});

  @override
  void onInit() {
    fetchItems();
    super.onInit();
  }

  void fetchItems() async {
    try {
      isLoading(true);
      var fetchedItems = await firestoreService.getItems();
      if (fetchedItems.isNotEmpty) {
        items.assignAll(fetchedItems);
      }
    } finally {
      isLoading(false);
    }
  }
}
