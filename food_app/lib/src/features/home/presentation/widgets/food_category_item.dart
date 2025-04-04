import 'package:flutter/material.dart';

class FoodCategoryItem extends StatelessWidget {
  final String imagePath;
  final bool isSelected;
  const FoodCategoryItem({
    super.key,
    required this.imagePath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: isSelected ? const Color(0xFFFFFAE5) : Colors.white,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Image.asset(imagePath, height: 40, width: 40, fit: BoxFit.cover),
      ),
    );
  }
}
