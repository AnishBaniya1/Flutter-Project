import 'package:food_app/src/core/resources/resource.dart';
import 'package:food_app/src/features/splash/domain/splash_model.dart';

class SplashData {
  static final List<SplashModel> contents = [
    SplashModel(
      title: 'Discover Delicious Meals',
      image: AppImage.screen1,
      description:
          'Explore a variety of tasty dishes and find your favorite meals',
    ),
    SplashModel(
      title: 'Seamless & Secure Payments',
      image: AppImage.screen2,
      description:
          'Pay easily with cash on delivery or secure online payment options',
    ),
    SplashModel(
      title: 'Fast & Free Delivery',
      image: AppImage.screen3,
      description: 'Get your food delivered to your doorstep, hassle-free!',
    ),
  ];
}
