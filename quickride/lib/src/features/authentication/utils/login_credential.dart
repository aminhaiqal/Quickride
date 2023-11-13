import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quickride/src/features/authentication/utils/input_decoration.dart' as input_decoration;
import '../../../utils/validator.dart';
import '../viewmodel/auth_viewmodel.dart' show AuthViewModel;
import 'package:quickride/src/widgets/action_button.dart' as action_button;
import 'package:quickride/src/utils/shared.dart' as shared;

class LoginCredential extends StatefulWidget {
  final AuthViewModel viewModel;
  const LoginCredential({super.key, required this.viewModel});

  @override
  LoginCredentialState createState() => LoginCredentialState();
}

class LoginCredentialState extends State<LoginCredential> {
  bool _obscureText = true;
  String errorMessage = '';
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
        Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      helperText: errorMessage,
                      prefixIcon: Icons.email_rounded),
                )),
              ],
            ),
          ),
      Container(
          margin: const EdgeInsets.only(bottom: 56),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Password',
                style: shared.TextTheme.description(null)
                    .copyWith(color: shared.GreyShader.greyAccent),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: Form(
                      child: TextFormField(
                          controller: _passwordController,
                          obscureText: _obscureText,
                          decoration:
                              input_decoration.buildPasswordInputDecoration(
                                  label: 'Password',
                                  prefixIcon: Icons.lock_rounded,
                                  obscureText: _obscureText,
                                  onSuffixIconPressed: () => setState(() {
                                        _obscureText = !_obscureText;
                                      }))))),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        widget.viewModel.resetPassword();
                      },
                    text: 'Forgot Password?',
                    style: shared.TextTheme.description(FontWeight.w500)
                        .copyWith(
                            color: shared.ColorTheme.mainTheme.colorScheme.primary))
              ]))
            ],
          )),

      action_button.PrimaryButton(
          label: 'Sign In',
          isLoading: widget.viewModel.isLoading,
          onPressed: () {
            errorMessage = '';
            setState(() {
              widget.viewModel.isLoading = true;
            });
            validateAndSetField(
              _emailController.text,
              () => ValidationException.validateEmail(_emailController.text),
              (value) => widget.viewModel.email = value,
              (error) => setState(() => errorMessage = error));

            widget.viewModel.isSignInFormValid
                ? widget.viewModel.signIn()
                : setState(() {
                    widget.viewModel.isLoading = false;
                  });
          })
    ]);
  }
}
