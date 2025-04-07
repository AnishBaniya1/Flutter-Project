import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/core/components/app_text_style.dart';
import 'package:food_app/src/core/resources/resource.dart';
import 'package:food_app/src/core/services/firebase_service.dart';
import 'package:food_app/src/features/auth/presentation/pages/forgotpassword_page.dart';
import 'package:food_app/src/features/auth/presentation/pages/signup_page.dart';
import 'package:food_app/src/features/common/widgets/bottom_navwrapper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _useremailController;
  late final TextEditingController _userpassController;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _isPassHidden = true;
  final FirebaseService _firebaseService = FirebaseService();

  @override
  void initState() {
    _useremailController = TextEditingController();
    _userpassController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _useremailController.dispose();
    _userpassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 70),
                Image.asset(AppImage.logo),
                SizedBox(height: 40),
                const Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 18),

                SizedBox(
                  width: 350,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter a Email Address';
                      } else if (!RegExp(
                        r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
                      ).hasMatch(value)) {
                        return 'Please Enter a Valid Email Address';
                      } else {
                        return null;
                      }
                    },
                    controller: _useremailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter Your Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      } else {
                        return null;
                      }
                    },
                    controller: _userpassController,
                    obscureText: _isPassHidden,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Your Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPassHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPassHidden = !_isPassHidden;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 28),
                  child: Container(
                    alignment: Alignment.topRight,
                    child: RichText(
                      text: TextSpan(
                        text: "Forgot Password?",
                        style: AppTextStyle.subheading2(),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ForgotpasswordPage(),
                                  ),
                                );
                              },
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade400,
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      try {
                        await _firebaseService.signInWithEmailAndPassword(
                          emailAddress: _useremailController.text,
                          password: _userpassController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login Succesfully')),
                        );
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => BottomNavwrapper(),
                          ),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text('Login failed')));
                      }
                    }
                  },
                  child: const Text('LOGIN', style: TextStyle(fontSize: 18)),
                ),

                const SizedBox(height: 100),

                RichText(
                  text: TextSpan(
                    text: "Don't have an account?",
                    style: AppTextStyle.name(),
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.blueGrey,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SignupPage(),
                                  ),
                                );
                              },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
