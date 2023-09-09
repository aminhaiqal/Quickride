import 'package:flutter/material.dart';
import 'package:quickride/src/features/authentication/utils/input_decoration.dart'
    as input_decoration;
import '../../../utils/validator.dart';
import '../viewmodel/auth_viewmodel.dart'
    show AuthViewModel, ValidationException;
import 'package:quickride/src/widgets/action_button.dart' as action_button;
import 'package:quickride/src/utils/shared.dart' as shared;

class LoginCredential extends StatefulWidget {
  final AuthViewModel viewModel;
  const LoginCredential({Key? key, required this.viewModel}) : super(key: key);

  @override
  LoginCredentialState createState() => LoginCredentialState();
}

class LoginCredentialState extends State<LoginCredential> {
  bool _obscureText = true;
  String emailErrorMessage = '', passwordErrorMessage = '';
  final TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Email',
        style: shared.TextTheme.description(null)
            .copyWith(color: shared.GreyShader.greyAccent),
      ),
      const SizedBox(height: 4),
      Form(
          child: TextFormField(
        controller: _emailController,
        decoration: input_decoration.buildEmailInputDecoration(
            label: 'Email',
            helperText: emailErrorMessage,
            prefixIcon: Icons.email_rounded),
      )),
      const SizedBox(height: 4),
      Text(
        emailErrorMessage,
        style: shared.TextTheme.description(null)
            .copyWith(color: shared.ColorTheme.mainTheme.colorScheme.error),
      ),
      const SizedBox(height: 24),
      Text(
        'Password',
        style: shared.TextTheme.description(null)
            .copyWith(color: shared.GreyShader.greyAccent),
      ),
      const SizedBox(height: 4),
      Form(
          child: TextFormField(
        controller: _passwordController,
        obscureText: _obscureText,
        decoration: input_decoration.buildPasswordInputDecoration(
            label: 'Password',
            helperText: passwordErrorMessage,
            prefixIcon: Icons.lock_rounded,
            obscureText: _obscureText,
            onSuffixIconPressed: () => setState(() {
                  _obscureText = !_obscureText;
                })),
      )),
      const SizedBox(height: 4),
      Text(
        passwordErrorMessage,
        style: shared.TextTheme.description(null)
            .copyWith(color: shared.ColorTheme.mainTheme.colorScheme.error),
      ),
      const SizedBox(height: 48),
      action_button.PrimaryButton(
          label: 'Sign In',
          width: MediaQuery.of(context).size.width,
          onPressed: () {
            validateAndSetField(
              _emailController.text,
              () => ValidationException.validateEmail(_emailController.text),
              (value) => widget.viewModel.email = value,
              (error) => setState(() => emailErrorMessage = error),
            );
            validateAndSetField(
              _passwordController.text,
              () => ValidationException.validatePassword(_passwordController.text),
              (value) => widget.viewModel.password = value,
              (error) => setState(() => passwordErrorMessage = error),
            );
            //print('email: ${widget.viewModel.email}');
            //print('password: ${widget.viewModel.password}');
            
            if (emailErrorMessage == '' && passwordErrorMessage == '') {
              widget.viewModel.signIn();
            }
          })
    ]);
  }
}
