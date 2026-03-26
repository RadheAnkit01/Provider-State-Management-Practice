import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mgmt/providers/auth_provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController emailController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController userFullNameController = TextEditingController();
  // TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(hint: Text("Email")),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(hint: Text("Password")),
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  authProvider.login(
                    emailController.text.toString(),
                    passwordController.text.toString(),
                  );
                },
                child: authProvider.loading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
