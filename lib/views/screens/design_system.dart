import 'package:flutter/material.dart';
import 'package:template/views/widgets/custom_app_bar.dart';
import 'package:template/views/widgets/custom_button.dart';
import 'package:template/views/widgets/custom_text_field.dart';
import 'package:template/views/widgets/profile_picture.dart';

class DesignSystem extends StatelessWidget {
  const DesignSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Design System"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 16,
          children: [
            ProfilePicture(
              image: "https://picsum.photos/500/500",
              isEditable: true,
            ),
            CustomTextField(title: "Email", hintText: "Enter your email"),
            CustomTextField(
              title: "Password",
              hintText: "Enter your password",
              isPassword: true,
            ),
            CustomButton(text: "Button"),
          ],
        ),
      ),
    );
  }
}
