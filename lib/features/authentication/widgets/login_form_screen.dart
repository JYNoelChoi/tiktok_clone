import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

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
        print(_formData);
      }
    }
    // _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Loig in")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Email"),
                validator: (value) {
                  // return "i don't like your email";
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
                  // return "wrong password";
                  return null;
                },
                onSaved: (newValue) => {
                  if (newValue != null) {_formData["password"] = newValue},
                },
                decoration: InputDecoration(hintText: "Password"),
                obscureText: false,
              ),
              Gaps.v28,
              GestureDetector(
                onTap: onSubmitTap,
                child: FormButton(disabled: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
