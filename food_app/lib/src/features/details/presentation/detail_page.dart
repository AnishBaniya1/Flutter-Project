import 'package:flutter/material.dart';
import 'package:food_app/src/core/components/app_text_style.dart';
import 'package:food_app/src/core/resources/resource.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int a = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
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
                InkWell(
                  onTap: () {
                    if (a > 1) {
                      --a;
                      setState(() {});
                    }
                  },
                  child: Icon(Icons.remove_circle),
                ),
                SizedBox(width: 18),
                Text(a.toString(), style: AppTextStyle.name()),
                SizedBox(width: 18),
                InkWell(
                  onTap: () {
                    ++a;
                    setState(() {});
                  },
                  child: Icon(Icons.add_circle),
                ),
              ],
            ),
            SizedBox(height: 18),
            Text(
              '''A salad is a dish made primarily from mixed vegetables, fruits, or both, often served cold. Common ingredients include lettuce, tomatoes, cucumbers, carrots, and dressings. 
              Salads can be light and refreshing or hearty with added proteins like chicken, beans, or cheese.''',
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
                Text("30 min", style: AppTextStyle.subheading2()),
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
                      Text('Rs.50', style: AppTextStyle.heading()),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade400,
                      foregroundColor: Colors.white,
                      fixedSize: Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Add to Cart', style: TextStyle(fontSize: 17)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
