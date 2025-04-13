import 'package:food_app/src/core/local/secure_storage.dart';
import 'package:food_app/src/core/model/usermodel.dart';

class SessionController {
  final SecureStorageService storage = SecureStorageService();

  static final SessionController _session = SessionController._internal();
  factory SessionController() => _session;

  static bool? isLogin;
  static UserModel user = UserModel(id: '', name: '', email: '');

  SessionController._internal();
}
