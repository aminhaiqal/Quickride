import 'package:flutter/material.dart';
import 'package:quickride/src/features/authentication/utils/input_decoration.dart'
    as input_decoration;
import '../viewmodel/auth_viewmodel.dart' show AuthViewModel;
import 'package:quickride/src/widgets/action_button.dart' as action_button;

class RegisterCredential extends StatefulWidget {
  final AuthViewModel viewModel;
  const RegisterCredential({super.key, required this.viewModel});

  @override
  RegisterCredentialState createState() => RegisterCredentialState();
}

class RegisterCredentialState extends State<RegisterCredential> {
  bool _obscureText = true;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    String helperText = '',
    IconData? prefixIcon,
    IconData? suffixIcon,
    VoidCallback? onSuffixIconPressed,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: _obscureText && suffixIcon == Icons.visibility_off,
      decoration: input_decoration.buildInputDecoration(
        label: label,
        helperText: helperText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        onSuffixIconPressed: onSuffixIconPressed,
      ),
    );
  }

  Widget buildNameFields() {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: buildTextField(
            controller: _firstNameController,
            label: 'First Name',
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          flex: 1,
          child: buildTextField(
            controller: _lastNameController,
            label: 'Last Name',
          ),
        ),
      ],
    );
  }

  Widget buildPhoneNumberField() {
    return buildTextField(
      controller: _phoneNumberController,
      label: 'Phone Number',
      prefixIcon: Icons.phone_rounded,
    );
  }

  Widget buildEmailField() {
    return buildTextField(
      controller: _emailController,
      label: 'Email',
      prefixIcon: Icons.email_rounded,
    );
  }

  Widget buildPasswordField() {
    return buildTextField(
      controller: _passwordController,
      label: 'Password',
      helperText: 'Password must be at least 8 characters long',
      prefixIcon: Icons.lock_rounded,
      suffixIcon: _obscureText ? Icons.visibility : Icons.visibility_off,
      onSuffixIconPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }

  Widget buildSignUpButton() {
    return action_button.PrimaryButton(
      label: 'Sign Up',
      isLoading: widget.viewModel.isLoading,
      onPressed: _handleSignUp,
    );
  }

  void _handleSignUp() {
    setState(() {
      widget.viewModel.isLoading = true;
    });

    widget.viewModel.username = '${_firstNameController.text} ${_lastNameController.text}';
    widget.viewModel.phoneNumber = _phoneNumberController.text;
    widget.viewModel.password = _passwordController.text;
    widget.viewModel.email = _emailController.text;

    if (widget.viewModel.isSignUpFormValid) {
      widget.viewModel.signUp();
    } else {
      setState(() {
        widget.viewModel.isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        buildNameFields(),
        buildPhoneNumberField(),
        buildEmailField(),
        buildPasswordField(),
        buildSignUpButton(),
      ],
    );
  }
}
