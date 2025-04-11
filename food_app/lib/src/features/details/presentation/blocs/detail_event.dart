part of "detail_bloc.dart";

abstract class DetailEvent {}

class AddToCartEvent extends DetailEvent {
  final int quantity;
  final String name;
  final int price;
  final String imagePath;

  AddToCartEvent({
    required this.quantity,
    required this.name,
    required this.price,
    required this.imagePath,
  });
}
