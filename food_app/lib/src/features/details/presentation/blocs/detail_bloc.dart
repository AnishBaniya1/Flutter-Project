import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/src/features/details/data/model/cartitem.dart';
part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailState.initial()) {
    on<AddToCartEvent>((event, emit) {
      final newItem = CartItem(
        quantity: event.quantity,
        name: event.name,
        price: event.price,
        imagePath: event.imagePath,
      );
      final updatedCart = List<CartItem>.from(state.cartItems)..add(newItem);
      emit(DetailState(cartItems: updatedCart));
    });
  }
}
