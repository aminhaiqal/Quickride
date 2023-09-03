import 'package:flutter/material.dart';
import 'package:quickride/src/features/authentication/login/view/login_view.dart';
import 'package:quickride/src/widgets/input_field_variation.dart' as textField;
import '../login/viewmodel/login_viewmodel.dart';
import 'package:quickride/src/widgets/action_button.dart' as actionButton;
import 'package:quickride/src/utils/input_validation.dart' as inputValidation;

class UserCredential extends StatefulWidget {
  final LoginViewModel viewModel;
  UserCredential({Key? key, required this.viewModel}) : super(key: key);

  @override
  UserCredentialState createState() => UserCredentialState();
  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
}

class UserCredentialState extends State<UserCredential> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: widget.emailKey, // Assign the email field key
            child: textField.TextField(
              label: 'Email',
              prefixIcon: const Icon(Icons.lock),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
              onTextChanged: (text) {
                LoginViewModel().setUsername(text);
              },
            )),
        const SizedBox(height: 16),
        Form(
            key: widget.passwordKey, // Assign the password field key
            child: textField.PasswordTextField(
              label: 'Password',
              prefixIcon: const Icon(Icons.lock),
              onTextChanged: (text) {
                LoginViewModel().setPassword(text);
              },
            )),
        const SizedBox(height: 48),
        actionButton.PrimaryButton(
            label: 'Sign In',
            width: 380,
            onPressed: () {
              LoginViewModel viewModel = widget.viewModel;
              String? emailError =
                  inputValidation.validateEmail(viewModel.email);
              List<String?> passwordErrors =
                  inputValidation.validatePassword(viewModel.password);

              if (emailError != null || passwordErrors.isNotEmpty) {
                widget.emailKey.currentState?.validate();
                widget.passwordKey.currentState?.validate();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please fix the errors in the form.')),
                );
              } else {
                // Navigate to home page
                Navigator.pushNamed(context, Login.routeName);
              }
            }),
      ],
    );
  }
}
