import 'package:flutter/material.dart';
import 'package:quickride/src/widgets/input_field_variation.dart' as text_field;
import '../login/viewmodel/login_viewmodel.dart';
import 'package:quickride/src/widgets/action_button.dart' as action_button;
import 'package:quickride/src/utils/input_validation.dart' as input_validation;
import 'package:quickride/src/utils/color_theme.dart' as color_theme;

// ignore: must_be_immutable
class LoginCredential extends StatefulWidget {
  final LoginViewModel viewModel;
  LoginCredential({Key? key, required this.viewModel}) : super(key: key);

  @override
  LoginCredentialState createState() => LoginCredentialState();
  String? emailErrorMessage;
  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
}

class LoginCredentialState extends State<LoginCredential> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: widget.emailKey, // Assign the email field key
            child: text_field.TextField(
              label: 'Email',
              prefixIcon: const Icon(Icons.email_rounded),
              onTextChanged: (text) {
                LoginViewModel().setUsername(text);
              },
              helperText: widget.emailErrorMessage,
            )),
        const SizedBox(height: 4),
        Form(
            key: widget.passwordKey, // Assign the password field key
            child: text_field.PasswordTextField(
              label: 'Password',
              prefixIcon: const Icon(Icons.lock),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          color_theme.ColorTheme.mainTheme.colorScheme.error)),
              onTextChanged: (text) {
                LoginViewModel().setPassword(text);
              },
            )),
        const SizedBox(height: 48),
        action_button.PrimaryButton(
            label: 'Sign In',
            width: 380,
            onPressed: () {
              LoginViewModel viewModel = widget.viewModel;
              String? emailError =
                  input_validation.validateEmail(viewModel.email);
              List<String?> passwordErrors =
                  input_validation.validatePassword(viewModel.password);

              if (emailError != null || passwordErrors.isNotEmpty) {
                setState(() {
                  widget.emailErrorMessage = emailError;
                });
                widget.emailKey.currentState?.validate();
                widget.passwordKey.currentState?.validate();
              } else {
                // Navigate to home page
                print('Login success');
                //Navigator.pushNamed(context, Login.routeName);
              }
            }),
      ],
    );
  }
}
