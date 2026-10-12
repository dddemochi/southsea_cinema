class SouthseaCinema {
  final String id;
  final String name;
  final String quantityoftickets;
  final int capacity;
  final double price;
  final String description;
  final String imagepath;
  final String time;
  final String location;
  final String agerating;

  const SouthseaCinema({
    required this.id,
    required this.name,
    required this.quantityoftickets,
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
}
