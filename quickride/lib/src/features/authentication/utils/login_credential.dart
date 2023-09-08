import 'package:flutter/material.dart';
import 'package:quickride/src/features/authentication/utils/input_decoration.dart' as input_decoration;
import '../login/viewmodel/login_viewmodel.dart';
import 'package:quickride/src/widgets/action_button.dart' as action_button;
import 'package:quickride/src/utils/color_theme.dart' as color_theme;
import 'package:quickride/src/utils/text_style.dart' as text_style;
import '../data/repository/exception.dart' as exception;

class LoginCredential extends StatefulWidget {
  final LoginViewModel viewModel;
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
        style: text_style.TextTheme.description(null)
            .copyWith(color: color_theme.GreyShader.greyAccent),
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
        style: text_style.TextTheme.description(null)
            .copyWith(color: color_theme.ColorTheme.mainTheme.colorScheme.error),
      ),
      const SizedBox(height: 24),
      Text(
        'Password',
        style: text_style.TextTheme.description(null)
            .copyWith(color: color_theme.GreyShader.greyAccent),
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
        style: text_style.TextTheme.description(null)
            .copyWith(color: color_theme.ColorTheme.mainTheme.colorScheme.error),
      ),
      const SizedBox(height: 48),
      action_button.PrimaryButton(
          label: 'Sign In',
          width: MediaQuery.of(context).size.width,
          onPressed: () {
            try {
              exception.validateEmail(_emailController.text);
              widget.viewModel.email = _emailController.text;
            } catch (e) {
             setState(() {
                emailErrorMessage = e.toString();
              });
            }
            try {
              exception.validatePassword(_passwordController.text);
              widget.viewModel.password = _passwordController.text;
            } catch (e) {
             setState(() {
                passwordErrorMessage = e.toString();
              });
            }
          })
    ]);
  }
}
