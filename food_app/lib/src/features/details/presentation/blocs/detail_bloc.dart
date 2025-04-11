import 'package:flutter_bloc/flutter_bloc.dart';
part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailState.initial()) {
    on<AddToCartEvent>((event, emit) {
      emit(
        DetailState(
          quantity: event.quantity,
          name: event.name,
          price: event.price,
          imagePath: event.imagePath,
        ),
      );
    });
  }
}
