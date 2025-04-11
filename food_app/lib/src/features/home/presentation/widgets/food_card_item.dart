import 'package:flutter/material.dart';
import 'package:food_app/src/core/components/app_text_style.dart';

class FoodCardItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String subtitle;
  final int price;
  final VoidCallback? onTap;

  const FoodCardItem({
    super.key,
    required this.imagePath,
    required this.name,
    required this.subtitle,
    required this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: InkWell(
        onTap: onTap,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  imagePath,
                  height: 140,
                  width: 140,
                  fit: BoxFit.cover,
                ),
                Text(name, style: AppTextStyle.subheading2()),
                Text(subtitle, style: AppTextStyle.subheading()),
                const SizedBox(height: 5),
                Text('Rs.$price', style: AppTextStyle.subheading2()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
