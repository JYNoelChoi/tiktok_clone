import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});
  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void onSubmitTap() {
    if (_formKey.currentState != null) {
      // triggers validator
      if (_formKey.currentState!.validate()) {
        // triggers onSave calleback
        _formKey.currentState!.save();
        // print(_formData);
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const InterestsScreen()),
        );
      }
    }
    // _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Loig in")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: "Email"),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Please write your email";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    _formData["email"] = newValue;
                  }
                },
              ),
              Gaps.v16,
              TextFormField(
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Please write your password";
                  }
                  return null;
                },
                onSaved: (newValue) => {
                  if (newValue != null) {_formData["password"] = newValue},
                },
                decoration: const InputDecoration(hintText: "Password"),
                obscureText: false,
              ),
              Gaps.v28,
              GestureDetector(
                onTap: onSubmitTap,
                child: const FormButton(disabled: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
