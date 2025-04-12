import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/src/core/components/app_text_style.dart';
import 'package:food_app/src/features/details/presentation/blocs/detail_bloc.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if (state.cartItems.isEmpty) {
            return Center(child: Text('No items in cart.'));
          }
          return Column(
            children: [
              SizedBox(height: 50),
              Material(
                elevation: 2,

                child: Center(
                  child: Text('Food Cart', style: AppTextStyle.heading()),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: state.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = state.cartItems[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                      ),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: 10,
                                top: 5,
                                bottom: 5,
                              ),
                              height: 90,
                              width: 40,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(item.quantity.toString()),
                              ),
                            ),
                            SizedBox(width: 30),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                item.imagePath,
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 20),
                            Column(
                              children: [
                                Text(
                                  item.name,
                                  style: AppTextStyle.subheading2(),
                                ),
                                Text(
                                  'Rs.${item.price}',
                                  style: AppTextStyle.subheading2(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Price', style: AppTextStyle.name()),
                    Text(
                      'Rs.${state.cartItems.fold<int>(0, (sum, item) => sum + item.price)}',
                      style: AppTextStyle.subheading2(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Material(
                color: Colors.transparent,

                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0xFF008080),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'CheckOut',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
