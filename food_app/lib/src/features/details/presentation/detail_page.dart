import 'package:flutter/material.dart';
import 'package:food_app/src/core/components/app_text_style.dart';
import 'package:food_app/src/core/resources/resource.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Column(
        children: [
          Image.asset(
            AppImage.salad2,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Veggie Taco Hash', style: AppTextStyle.name()),
                ],
              ),
              Spacer(),
              Icon(Icons.remove_circle),
              SizedBox(width: 18),
              Text('1', style: AppTextStyle.name()),
              SizedBox(width: 18),
              Icon(Icons.add_circle),
            ],
          ),
        ],
      ),
    );
  }
}
