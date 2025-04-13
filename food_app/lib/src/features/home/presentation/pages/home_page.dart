import 'package:flutter/material.dart';
import 'package:food_app/src/core/components/app_text_style.dart';
import 'package:food_app/src/core/resources/resource.dart';
import 'package:food_app/src/features/details/presentation/detail_page.dart';
import 'package:food_app/src/features/home/presentation/widgets/food_card_item.dart';
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
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
      child: SingleChildScrollView(
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
                (index) => InkWell(
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
            SizedBox(height: 25),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FoodCardItem(
                    imagePath: AppImage.salad2,
                    name: 'Veggie Taco Hash',
                    subtitle: 'Fresh and Healthy',
                    price: 50,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DetailPage(
                                name: 'Veggie Taco Hash',
                                description:
                                    '''A salad is a dish made primarily from mixed vegetables, fruits, or both, often served cold. Common ingredients include lettuce, tomatoes, cucumbers, carrots, and dressings. 
                        Salads can be light and refreshing or hearty with added proteins like chicken, beans, or cheese.''',
                                imagePath: AppImage.salad2,
                                deliveryTime: 30,
                                price: 50,
                              ),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 10),
                  FoodCardItem(
                    imagePath: AppImage.salad2,
                    name: 'Mix Veg Salad',
                    subtitle: 'Fresh and Healthy',
                    price: 80,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DetailPage(
                                name: 'Mix Veg Salad',
                                description:
                                    '''A salad is a dish made primarily from mixed vegetables, fruits, or both, often served cold. Common ingredients include lettuce, tomatoes, cucumbers, carrots, and dressings. 
                        Salads can be light and refreshing or hearty with added proteins like chicken, beans, or cheese.''',
                                imagePath: AppImage.salad2,
                                deliveryTime: 35,
                                price: 80,
                              ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        AppImage.salad4,
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              'Mediterranean Chickpea Salad',
                              style: AppTextStyle.subheading2(),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              'Healthy',
                              style: AppTextStyle.subheading(),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              'Rs.70',
                              style: AppTextStyle.subheading2(),
                            ),
                          ),
                        ],
                      ),
                    ],
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
