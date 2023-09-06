import 'package:flutter/material.dart';
import 'package:quickride/src/widgets/input_field_variation.dart' as text_field;
import '../login/viewmodel/login_viewmodel.dart';
import 'package:quickride/src/widgets/action_button.dart' as action_button;
import 'package:quickride/src/utils/color_theme.dart' as color_theme;
import '../data/repository/exception.dart';

// ignore: must_be_immutable
class LoginCredential extends StatefulWidget {
  final LoginViewModel viewModel;
  LoginCredential({Key? key, required this.viewModel}) : super(key: key);

  @override
  LoginCredentialState createState() => LoginCredentialState();
  String emailErrorMessage = '';
  String passwordErrorMessage = '';
  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
}

class LoginCredentialState extends State<LoginCredential> {
  void updateErrorMessage(String errorMessage) {
    setState(() {
      widget.emailErrorMessage = errorMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = widget.viewModel;

    return Column(children: [
      Form(
          key: widget.emailKey, // Assign the email field key
          child: text_field.TextField(
            label: 'Email',
            prefixIcon: const Icon(Icons.email_rounded),
            onChanged: (value) {
              viewModel.setEmail(value);
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
                    color: color_theme.ColorTheme.mainTheme.colorScheme.error)),
            onTextChanged: (text) {
              LoginViewModel().setPassword(text);
            },
          )),
      const SizedBox(height: 48),
      action_button.PrimaryButton(
          label: 'Sign In',
          width: 380,
          onPressed: () {
            validateAndSetError(
              viewModel.email,
              validateEmail,
              widget.emailKey, // Global key for email field
              widget.emailErrorMessage,
              updateErrorMessage,
              context,
            );
            /*validateAndSetError(
              viewModel.password,
              validatePassword,
              widget.passwordKey,
              widget.passwordErrorMessage,
              setState,
              context,
            );*/
          })
    ]);
  }
}
