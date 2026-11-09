import 'package:southsea_cinema/models/movie.dart';

class CartItem {
  final Movie movie;
  int quantity;

  CartItem({
    required this.movie,
    this.quantity = 1,
  });

  double get lineTotal => movie.price * quantity;

  double get totalPrice => lineTotal;
}
