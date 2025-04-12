import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/src/core/components/app_text_style.dart';
import 'package:food_app/src/features/details/presentation/blocs/detail_bloc.dart';

class DetailPage extends StatefulWidget {
  final String name;
  final String description;
  final String imagePath;
  final int deliveryTime;
  final int price;
  const DetailPage({
    super.key,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.deliveryTime,
    required this.price,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text('Details')),
        body: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            children: [
              Image.asset(
                widget.imagePath,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(widget.name, style: AppTextStyle.name())],
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      if (quantity > 1) {
                        --quantity;
                        setState(() {});
                      }
                    },
                    child: Icon(Icons.remove_circle),
                  ),
                  SizedBox(width: 18),
                  Text(quantity.toString(), style: AppTextStyle.name()),
                  SizedBox(width: 18),
                  InkWell(
                    onTap: () {
                      ++quantity;
                      setState(() {});
                    },
                    child: Icon(Icons.add_circle),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Text(
                widget.description,
                maxLines: 3,
                style: AppTextStyle.subheading(),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Text("Delivery Time", style: AppTextStyle.subheading2()),
                  SizedBox(width: 25.0),
                  Icon(Icons.alarm, color: Colors.black54),
                  SizedBox(width: 5.0),
                  Text(
                    "${widget.deliveryTime}min",
                    style: AppTextStyle.subheading2(),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 30, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total Price', style: AppTextStyle.subheading2()),
                        Text(
                          'Rs.${quantity * widget.price}',
                          style: AppTextStyle.heading(),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: Text(
                            'Item added to the cart!',
                            style: AppTextStyle.name(),
                          ),
                          backgroundColor: Colors.amber,
                        );

                        // Display the SnackBar using ScaffoldMessenger
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        context.read<DetailBloc>().add(
                          AddToCartEvent(
                            quantity: quantity,
                            name: widget.name,
                            price: quantity * widget.price,
                            imagePath: widget.imagePath,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade400,
                        foregroundColor: Colors.white,
                        fixedSize: Size(150, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
