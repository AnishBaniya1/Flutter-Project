part of 'detail_bloc.dart';

class DetailState {
  final int quantity;
  final String name;
  final int price;
  final String imagePath;
  DetailState({
    required this.quantity,
    required this.name,
    required this.price,
    required this.imagePath,
  });

  factory DetailState.initial() {
    return DetailState(quantity: 0, name: "", price: 0, imagePath: "");
  }
}
