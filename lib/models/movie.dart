class Movie {
  final String id;
  final String name;
  final String quantity;
  final int capacity;
  final double price;
  final String description;
  final String imagepath;
  final String time;
  final String location;
  final String agerating;

  const Movie({
    required this.id,
    required this.name,
    required this.quantity,
    required this.capacity,
    required this.description,
    required this.imagepath,
    required this.time,
    required this.location,
    required this.price,
    required this.agerating,
  });

  String get formattedPrice => '£${price.toStringAsFixed(2)}';

  bool get isChildFriendly => agerating == '(PG)' || agerating == '(U)';

  bool get isAdultOnly => agerating == '(18)';

  factory Movie.fromJson(Map<String, dynamic> json) {
    final String id = json['id'] as String;
    final String name = json['name'] as String;
    final String description = json['description'] as String;
    final num formattedPrice = json['price'] as num;
    final double price = formattedPrice.toDouble();
    final String imagepath = json['imagepath'] as String;
    final String quantity = json['quantity'] as String;
    final int capacity = json['capacity'] as int;
    final String time = json['time'] as String;
    final String location = json['location'] as String;
    final String agerating = json['agerating'] as String;

    return Movie(
      id: id,
      name: name,
      description: description,
      price: price,
      imagepath: imagepath,
      quantity: quantity,
      capacity: capacity,
      time: time,
      location: location,
      agerating: agerating,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imagepath': imagepath,
      'quantity': quantity,
      'capacity': capacity,
      'time': time,
      'location': location,
      'agerating': agerating,
    };
    return data;
  }
  

}
