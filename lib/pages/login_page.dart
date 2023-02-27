import 'package:animation/components/custom_button.dart';
import 'package:animation/components/data_field.dart';
import 'package:animation/components/password_field.dart';
import 'package:animation/components/wave_clip_path.dart';
import 'package:animation/pages/home_page.dart';
import 'package:animation/pages/register_page.dart';
import 'package:animation/validators/email_validator.dart';
import 'package:animation/validators/password_validator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  static String logInId = 'log in page';

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const WaveClipPath(title: 'Log in'),
              const SizedBox(
                height: 100,
              ),
              const DataField(
                fieldLabel: 'Email',
                fieldIcon: Icons.alternate_email,
                keyboardType: TextInputType.emailAddress,
                validator: emailValidator,
              ),
              const PasswordField(
                fieldLabel: 'Password',
                validator: passwordValidator,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                width: width,
                title: 'Log in',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    debugPrint('Done');
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('logged in', true);
                    if (!mounted) return;
                    Navigator.of(context).pushReplacementNamed(Home.homeId);
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: CustomButton(
                  width: width,
                  title: 'Register',
                  backgroundColor: Colors.white,
                  titleColor: Colors.purple,
                  side: const BorderSide(color: Colors.purple),
                  onPressed: () {
                    Navigator.of(context).pushNamed(Register.registerId);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
