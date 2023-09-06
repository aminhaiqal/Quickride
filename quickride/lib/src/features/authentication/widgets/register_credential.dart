import 'package:flutter/material.dart';
import 'package:quickride/src/widgets/input_field_variation.dart' as text_field;
import 'package:quickride/src/widgets/action_button.dart' as action_button;
import 'package:quickride/src/utils/input_validation.dart' as input_validation;
import 'package:quickride/src/utils/color_theme.dart' as color_theme;

import '../register/viewmodel/register_viewmodel.dart';

// ignore: must_be_immutable
class RegisterCredential extends StatefulWidget {
  final RegisterViewModel viewModel;
  RegisterCredential({Key? key, required this.viewModel}) : super(key: key);

  @override
  RegisterCredentialState createState() => RegisterCredentialState();
  String? emailErrorMessage;
  GlobalKey<FormState> usernameKey = GlobalKey<FormState>();
  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  GlobalKey<FormState> phoneNumberKey = GlobalKey<FormState>();
}

class RegisterCredentialState extends State<RegisterCredential> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: widget.usernameKey, // Assign the email field key
            child: text_field.TextField(
              label: 'Username',
              prefixIcon: const Icon(Icons.person_rounded),
              onTextChanged: (text) {
                RegisterViewModel().setUsername(text);
              },
              helperText: widget.emailErrorMessage,
            )),
        const SizedBox(height: 4),
        Form(
            key: widget.phoneNumberKey, // Assign the phone number field key
            child: text_field.PhoneNumber(
              label: 'Phone Number',
              onTextChanged: (text) {
                RegisterViewModel().setPhoneNumber(text);
              },
              helperText: widget.emailErrorMessage,
            )),
        Form(
            key: widget.emailKey, // Assign the phone number field key
            child: text_field.TextField(
              label: 'Email',
              prefixIcon: const Icon(Icons.email_rounded),
              onTextChanged: (text) {
                RegisterViewModel().setEmail(text);
              },
              helperText: widget.emailErrorMessage,
            )),
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
                RegisterViewModel().setPassword(text);
              },
            )),
        const SizedBox(height: 48),
        action_button.PrimaryButton(
            label: 'Sign Up',
            width: 380,
            onPressed: () {
              RegisterViewModel viewModel = widget.viewModel;
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
