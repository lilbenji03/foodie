import 'package:flutter/material.dart';
import 'package:foodie/pages/Auth/login_screen.dart';
import 'package:foodie/service/auth_service.dart';
import 'package:foodie/widgets/my_button.dart';
import 'package:foodie/widgets/snack_bar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool isLoading = false;
  bool isPasswordHidden = true;

  void _signUp() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    //validate email format
    if (!email.contains(".com")) {
      showSnackBar(context, "Invalid email it must contain .com");
    }
    setState(() {
      isLoading = true;
    });
    final result = await _authService.signup(email, password);
    if (result == null) {
      // success case
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, "Signup successful! proceding to login");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    } else {
      // error case
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, "Signup failed: $result");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Image.asset(
                  "assets/sinup.png",
                  width: double.maxFinite,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                // Add a text field for email
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),

                // Add a password field
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                      icon: Icon(
                        isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  obscureText: isPasswordHidden,
                ),
                SizedBox(height: 20),
                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : SizedBox(
                      width: double.maxFinite,
                      child: MyButton(onTap: _signUp, buttontext: "Signup"),
                    ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LoginScreen()),
                        );
                      },
                      child: Text(
                        "Login here",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
