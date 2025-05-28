import 'dart:convert';

import 'package:food_app/src/core/local/secure_storage.dart';
import 'package:food_app/src/core/model/usermodel.dart';

class SessionController {
  final SecureStorageService storage = SecureStorageService();

  static final SessionController _session = SessionController._internal();
  factory SessionController() => _session;

  static bool? isLogin;
  static UserModel? user;

  SessionController._internal() {
    isLogin = false;
  }

  Future<void> saveUser(UserModel userData) async {
    await storage.setValue('user', jsonEncode(userData.toJson()));
    await storage.setValue('isLogin', 'true');
    user = userData;
    isLogin = true;
  }

  Future<void> getUser() async {
    final userDataString = await storage.readValue('user');
    final loginStatus = await storage.readValue('isLogin');

    if (userDataString != null && userDataString.isNotEmpty) {
      user = UserModel.fromJson(jsonDecode(userDataString));
    }

    isLogin = loginStatus == 'true';
  }

  Future<void> clearUser() async {
    await storage.clearValue('user');
    await storage.clearValue('isLogin');
    user = null;
    isLogin = false;
  }
}
