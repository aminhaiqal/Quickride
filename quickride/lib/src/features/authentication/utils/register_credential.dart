import 'package:flutter/material.dart';
import 'package:quickride/src/features/authentication/utils/input_decoration.dart'
    as input_decoration;
import '../../../utils/validator.dart';
import '../viewmodel/auth_viewmodel.dart' show AuthViewModel;
import 'package:quickride/src/widgets/action_button.dart' as action_button;
import 'package:quickride/src/utils/shared.dart' as shared;

class RegisterCredential extends StatefulWidget {
  final AuthViewModel viewModel;
  const RegisterCredential({Key? key, required this.viewModel})
      : super(key: key);

  @override
  RegisterCredentialState createState() => RegisterCredentialState();
}

class RegisterCredentialState extends State<RegisterCredential> {
  bool _obscureText = true;
  String errorMessage = '';
  final TextEditingController _firstNameController = TextEditingController(),
      _lastNameController = TextEditingController(),
      _phoneNumberController = TextEditingController(),
      _emailController = TextEditingController(),
      _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Full Name',
                  style: shared.TextTheme.description(null)
                      .copyWith(color: shared.GreyShader.greyAccent),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Flexible(
                        flex: 1,
                        child: Form(
                            child: TextFormField(
                          controller: _firstNameController,
                          decoration: input_decoration.buildNameInputDecoration(
                              label: 'First Name'),
                        ))),
                    const SizedBox(width: 16),
                    Flexible(
                        flex: 1,
                        child: Form(
                            child: TextFormField(
                          controller: _lastNameController,
                          decoration: input_decoration.buildNameInputDecoration(
                              label: 'Last Name'),
                        ))),
                  ],
                )
              ],
            )),
        Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Phone Number',
                  style: shared.TextTheme.description(null)
                      .copyWith(color: shared.GreyShader.greyAccent),
                ),
                const SizedBox(height: 4),
                Form(
                    child: TextFormField(
                  controller: _phoneNumberController,
                  decoration: input_decoration.buildEmailInputDecoration(
                      label: 'Phone Number', prefixIcon: Icons.phone_rounded),
                )),
              ],
            )),
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
                      label: 'Email', prefixIcon: Icons.email_rounded),
                )),
              ],
            )),
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
                const SizedBox(height: 4),
                Form(
                    child: TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: input_decoration.buildPasswordInputDecoration(
                      label: 'Password',
                      prefixIcon: Icons.lock_rounded,
                      obscureText: _obscureText,
                      onSuffixIconPressed: () => setState(() {
                            _obscureText = !_obscureText;
                          })),
                )),
              ],
            )),
        action_button.PrimaryButton(
            label: 'Sign Up',
            isLoading: widget.viewModel.isLoading,
            onPressed: () {
              setState(() {
                widget.viewModel.isLoading = true;
              });
              widget.viewModel.username = '${_firstNameController.text} ${_lastNameController.text}';
              widget.viewModel.phoneNumber = _phoneNumberController.text;
              widget.viewModel.password = _passwordController.text;
              widget.viewModel.email = _emailController.text;

              widget.viewModel.isSignUpFormValid
                  ? widget.viewModel.signUp()
                  : widget.viewModel.isLoading = false;

              if (widget.viewModel.isSignUpFormValid) {
                Navigator.pushNamed(context, '/homepage');
              }
            }),
      ],
    );
  }
}
