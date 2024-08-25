import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AuthenticatePassword extends StatelessWidget {
  const AuthenticatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Lottie.asset('assets/lottie/message_sent.json',
                  height: 200, fit: BoxFit.contain),
            ),
            Text("Message has sent to your email")
          ],
        ),
      ),
    );
  }
}
