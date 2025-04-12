part of 'detail_bloc.dart';

class DetailState {
  final List<CartItem> cartItems;

  DetailState({required this.cartItems});

  factory DetailState.initial() {
    return DetailState(cartItems: []);
  }
}
