import 'package:flutter/material.dart';
import 'package:quickride/src/widgets/action_button.dart' as action_button;
import 'package:quickride/src/utils/color_theme.dart' as color_theme;
import 'package:quickride/src/utils/text_style.dart' as text_style;
import '../data/repository/exception.dart' as exception;
import 'package:quickride/src/features/authentication/utils/input_decoration.dart' as input_decoration;
import '../register/viewmodel/register_viewmodel.dart';

class RegisterCredential extends StatefulWidget {
  final RegisterViewModel viewModel;
  const RegisterCredential({Key? key, required this.viewModel}) : super(key: key);

  @override
  RegisterCredentialState createState() => RegisterCredentialState();
}
  

class RegisterCredentialState extends State<RegisterCredential> {
  bool _obscureText = true;
  String usernameErrorMessage = '', phoneNumberErrorMessage = '', emailErrorMessage = '', passwordErrorMessage = '';
  final TextEditingController _usernameController = TextEditingController(),
      _phoneNumberController = TextEditingController(),
      _emailController = TextEditingController(),
      _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
        'Username',
        style: text_style.TextTheme.description(null)
            .copyWith(color: color_theme.GreyShader.greyAccent),
      ),
      const SizedBox(height: 4),
        Form(
            child: TextFormField(
          controller: _usernameController,
          decoration: input_decoration.buildEmailInputDecoration(
              label: 'Username',
              helperText: usernameErrorMessage,
              prefixIcon: Icons.person_rounded),
        )),
        const SizedBox(height: 4),
        Text(
          usernameErrorMessage,
          style: text_style.TextTheme.description(null).copyWith(
              color: color_theme.ColorTheme.mainTheme.colorScheme.error),
        ),
        const SizedBox(height: 24),
        Text(
          'Phone Number',
          style: text_style.TextTheme.description(null)
              .copyWith(color: color_theme.GreyShader.greyAccent),
        ),
      const SizedBox(height: 4),
        Form(
            child: TextFormField(
          controller: _phoneNumberController,
          decoration: input_decoration.buildEmailInputDecoration(
              label: 'Phone Number',
              helperText: phoneNumberErrorMessage),
        )),
        const SizedBox(height: 4),
        Text(
          phoneNumberErrorMessage,
          style: text_style.TextTheme.description(null).copyWith(
              color: color_theme.ColorTheme.mainTheme.colorScheme.error),
        ),
        const SizedBox(height: 24),
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
            label: 'Sign Up',
            width: 380,
            onPressed: () {
              RegisterViewModel viewModel = widget.viewModel;
            }),
      ],
    );
  }
}
