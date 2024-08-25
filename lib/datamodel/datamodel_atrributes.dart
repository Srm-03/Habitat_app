class Item {
  String? id;
  String? number;
  String? name;

  Item({this.id, this.number, this.name, required String mesurements});

  // Create an object from a JSON map (deserialization)
  Item.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    number = json["number"];
    name = json["name"];
  }

  // Convert the object to a JSON map (serialization)
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["number"] = number;
    _data["name"] = name;
    return _data;
  }

  // Override toString for easy printing
  @override
  String toString() {
    return 'Item{id: $id, number: $number, name: $name}';
  }
}

class Items {
  final String id;
  final String name;
  final String imageUrl;

  Items({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory Items.fromMap(Map<String, dynamic> data, String documentId) {
    return Items(
      id: data['id'],
      name: data['name'],
      imageUrl: data['number'],
    );
  }
}
