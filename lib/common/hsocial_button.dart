import 'package:flutter/material.dart';

class HsocialButton extends StatelessWidget {
  const HsocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              // => controller.googleSignIn(),
              icon: const Image(
                  width: 20,
                  height: 20,
                  image: AssetImage("assets/icons/Google.png"))),
        ),
        SizedBox(
          width: 30,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              // => controller.googleSignIn(),
              icon: const Image(
                  width: 20,
                  height: 20,
                  image: AssetImage("assets/icons/apple_logo_.png"))),
        ),
      ],
    );
  }
}
