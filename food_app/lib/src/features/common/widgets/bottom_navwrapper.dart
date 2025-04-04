import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/features/home/presentation/pages/home_page.dart';
import 'package:food_app/src/features/profile/presentation/pages/profile_page.dart';
import 'package:food_app/src/features/shopping/presentation/order_page.dart';
import 'package:food_app/src/features/wallet/presentation/wallet_page.dart';

class BottomNavwrapper extends StatefulWidget {
  const BottomNavwrapper({super.key});

  @override
  State<BottomNavwrapper> createState() => _BottomNavwrapperState();
}

class _BottomNavwrapperState extends State<BottomNavwrapper> {
  int currentIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late HomePage homepage;
  late OrderPage order;
  late WalletPage wallet;
  late ProfilePage profile;
  @override
  void initState() {
    homepage = HomePage();
    order = OrderPage();
    wallet = WalletPage();
    profile = ProfilePage();
    pages = [homepage, order, wallet, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          Icon(Icons.home_outlined, color: Colors.white),
          Icon(Icons.shopping_bag_outlined, color: Colors.white),
          Icon(Icons.wallet_outlined, color: Colors.white),
          Icon(Icons.person_outline, color: Colors.white),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
