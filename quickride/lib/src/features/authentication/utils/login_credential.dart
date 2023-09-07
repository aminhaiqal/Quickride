import 'package:flutter/material.dart';
import 'package:quickride/src/features/authentication/utils/input_decoration.dart' as input_decoration;
import '../login/viewmodel/login_viewmodel.dart';
import 'package:quickride/src/widgets/action_button.dart' as action_button;
import 'package:quickride/src/utils/color_theme.dart' as color_theme;
import 'package:quickride/src/utils/text_style.dart' as text_style;
import '../data/repository/exception.dart';

class LoginCredential extends StatefulWidget {
  final LoginViewModel viewModel;
  const LoginCredential({Key? key, required this.viewModel}) : super(key: key);

  @override
  LoginCredentialState createState() => LoginCredentialState();
}

class LoginCredentialState extends State<LoginCredential> {
  bool _obscureText = true;
  String emailErrorMessage = '', passwordErrorMessage = '', helperText = '';
  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>(), _passwordKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController(), _passwordController = TextEditingController();

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
        key: _emailKey,
        child: TextFormField(
          controller: _emailController,
          decoration: input_decoration.buildEmailInputDecoration(
              label: 'Email',
              helperText: helperText,
              prefixIcon: Icons.email_rounded),
          )),
      const SizedBox(height: 24),
      Text(
        'Password',
        style: text_style.TextTheme.description(null)
            .copyWith(color: color_theme.GreyShader.greyAccent),
      ),
      const SizedBox(height: 4),
      Form(
        key: _passwordKey,
        child: TextFormField(
          controller: _passwordController,
          obscureText: _obscureText,
          decoration: input_decoration.buildPasswordInputDecoration(
              label: 'Password',
              helperText: helperText,
              prefixIcon: Icons.lock_rounded,
              obscureText: _obscureText,
              onSuffixIconPressed: () => setState(() {
                    _obscureText = !_obscureText;
                  })),
          )),
      const SizedBox(height: 48),
      action_button.PrimaryButton(
          label: 'Sign In',
          width: MediaQuery.of(context).size.width,
          onPressed: () {
            /*validateAndSetError(
              viewModel.email,
              validateEmail,
              widget._emailKey, // Global key for email field
              widget.emailErrorMessage,
              updateErrorMessage,
              context,
            );
            validateAndSetError(
              viewModel.password,
              validatePassword,
              widget.passwordKey,
              widget.passwordErrorMessage,
              setState,
              context,
            );*/

            // save email and password to viewmodel
            //widget.viewModel.email = _emailController.text;
            //widget.viewModel.password = _passwordController.text;
          })  
    ]);
  }
}
