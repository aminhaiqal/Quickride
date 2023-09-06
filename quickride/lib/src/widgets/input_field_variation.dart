import 'package:flutter/material.dart';
import 'package:quickride/src/utils/text_style.dart' as text_style;
import 'package:quickride/src/utils/color_theme.dart' as color_theme;

// Normal textfield
class TextField extends StatefulWidget {
  final String label;
  final Icon? prefixIcon;
  final void Function(String)? onTextChanged;
  final String? helperText;
  final OutlineInputBorder? errorBorder;

  const TextField(
      {required this.label,
      this.prefixIcon,
      this.onTextChanged,
      this.helperText,
      Key? key,
      this.errorBorder})
      : super(key: key);

  @override
  TextFieldState createState() => TextFieldState();
}

class TextFieldState extends State<TextField> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.text = '';
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        widget.label,
        style: text_style.TextTheme.description(null)
            .copyWith(color: color_theme.GreyShader.greyAccent),
      ),
      const SizedBox(height: 4),
      SizedBox(
          width: MediaQuery.of(context).size.width - 24 * 2,
          height: 48, //adjust height of textfield
          child: TextFormField(
              controller: _textEditingController,
              onChanged: (text) {
                widget.onTextChanged?.call(text);
              },
              decoration: InputDecoration(
                  hintText: 'Enter your ${widget.label.toLowerCase()}',
                  prefixIcon: widget.prefixIcon,
                  labelStyle: text_style.TextTheme.body1(FontWeight.w400),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: (widget.helperText != null)
                          ? color_theme.ColorTheme.mainTheme.colorScheme.error
                          : color_theme.GreyShader.greyAccentLight,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 16)))),
      const SizedBox(height: 4),
      Text(
        widget.helperText ?? '',
        style: text_style.TextTheme.description(null).copyWith(
            color: color_theme.ColorTheme.mainTheme.colorScheme.error),
      ),
    ]);
  }
}

// Password textfield
class PasswordTextField extends StatefulWidget {
  final String label;
  final Icon? prefixIcon;
  final void Function(String)? onTextChanged;

  const PasswordTextField(
      {required this.label,
      this.prefixIcon,
      this.onTextChanged,
      Key? key,
      required OutlineInputBorder errorBorder})
      : super(key: key);

  @override
  PasswordTextFieldState createState() => PasswordTextFieldState();
}

class PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.text = '';
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Password',
        style: text_style.TextTheme.description(null)
            .copyWith(color: color_theme.GreyShader.greyAccent),
      ),
      const SizedBox(height: 4),
      SizedBox(
          width: MediaQuery.of(context).size.width - 24 * 2,
          height: 48, //adjust height of textfield
          child: TextFormField(
            controller: _textEditingController,
            onChanged: (text) {
              widget.onTextChanged?.call(text);
            },
            decoration: InputDecoration(
                hintText: 'Enter your ${widget.label.toLowerCase()}',
                labelStyle: text_style.TextTheme.body1(FontWeight.w400),
                prefixIcon: widget.prefixIcon,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
            obscureText: _obscureText,
          )),
      TextButton(
          onPressed: () {},
          child: Text('Forgot Password?',
              style: text_style.TextTheme.description(null).copyWith(
                  color: color_theme.ColorTheme.mainTheme.colorScheme.primary)))
    ]);
  }
}

// Phone number textfield