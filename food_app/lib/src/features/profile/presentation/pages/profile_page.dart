import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/core/components/app_text_style.dart';
import 'package:food_app/src/core/resources/resource.dart';
import 'package:food_app/src/core/services/session_controller.dart';
import 'package:food_app/src/features/auth/presentation/pages/login_page.dart';
import 'package:food_app/src/features/profile/presentation/widgets/custom_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = '';
  String email = '';
  final SessionController _sessionController = SessionController();
  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    await _sessionController.getUser();
    setState(() {
      name = SessionController.user?.name ?? 'User';
      email = SessionController.user?.email ?? 'Email';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 35),
            Material(
              elevation: 2,
              child: Center(
                child: Text('Profile', style: AppTextStyle.heading()),
              ),
            ),
            SizedBox(height: 20),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(60),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  AppImage.logo1,
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            CustomCard(
              children: [
                Icon(Icons.person),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name', style: AppTextStyle.subheading()),
                    Text(name, style: AppTextStyle.name()),
                  ],
                ),
              ],
            ),
            SizedBox(height: 17),
            CustomCard(
              children: [
                Icon(Icons.email),
                SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email', style: AppTextStyle.subheading()),
                    Text(email, style: AppTextStyle.subheading2()),
                  ],
                ),
              ],
            ),
            SizedBox(height: 17),
            CustomCard(
              children: [
                Icon(Icons.description),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Terms and Condition', style: AppTextStyle.name()),
                  ],
                ),
              ],
            ),
            SizedBox(height: 17),
            CustomCard(
              children: [
                Icon(Icons.delete),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Delete Account', style: AppTextStyle.name()),
                  ],
                ),
              ],
            ),
            SizedBox(height: 17),
            CustomCard(
              children: [
                Icon(Icons.logout),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'LogOut',
                        style: AppTextStyle.name(),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () async {
                                await _sessionController.clearUser();
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
