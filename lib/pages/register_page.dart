import 'package:animation/components/custom_button.dart';
import 'package:animation/components/data_field.dart';
import 'package:animation/components/password_field.dart';
import 'package:animation/components/wave_clip_path.dart';
import 'package:animation/pages/home_page.dart';
import 'package:animation/validators/confirm_password_validator.dart';
import 'package:animation/validators/email_validator.dart';
import 'package:animation/validators/name_validator.dart';
import 'package:animation/validators/password_validator.dart';
import 'package:animation/validators/phone_validator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  static String registerId = 'register page';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const WaveClipPath(title: 'Register'),
              const SizedBox(height: 100),
              const DataField(
                fieldLabel: 'Full name',
                fieldIcon: Icons.account_circle,
                keyboardType: TextInputType.name,
                validator: nameValidator,
              ),
              const DataField(
                fieldLabel: 'Email',
                fieldIcon: Icons.alternate_email,
                keyboardType: TextInputType.emailAddress,
                validator: emailValidator,
              ),
              PasswordField(
                fieldLabel: 'Password',
                controller: passwordController,
                validator: passwordValidator,
              ),
              PasswordField(
                fieldLabel: 'Confirm Password',
                validator: (value) {
                  return confirmPasswordValidator(
                      value, passwordController.text);
                },
              ),
              const DataField(
                fieldLabel: 'Phone',
                fieldIcon: Icons.phone_android,
                keyboardType: TextInputType.phone,
                validator: phoneValidator,
              ),
              const SizedBox(height: 50),
              CustomButton(
                width: width,
                title: 'Register',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    debugPrint('Done');
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('logged in', true);
                    if (!mounted) return;
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      Home.homeId,
                      (route) => false,
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: CustomButton(
                  width: width,
                  title: 'Log in',
                  backgroundColor: Colors.white,
                  titleColor: Colors.purple,
                  side: const BorderSide(
                    color: Colors.purple,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
