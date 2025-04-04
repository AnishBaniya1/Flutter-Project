import 'package:flutter/material.dart';
import 'package:food_app/src/core/components/app_text_style.dart';
import 'package:food_app/src/core/resources/resource.dart';
import 'package:food_app/src/features/home/presentation/widgets/food_category_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = -1;
  final List<String> images = [
    AppImage.ice,
    AppImage.pizza,
    AppImage.salad,
    AppImage.burger,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hello User,', style: AppTextStyle.name()),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Delicious Food', style: AppTextStyle.heading()),
            Text(
              'Discover and Get Great Food',
              style: AppTextStyle.subheading(),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                images.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: FoodCategoryItem(
                    imagePath: images[index],
                    isSelected: index == selectedIndex,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
