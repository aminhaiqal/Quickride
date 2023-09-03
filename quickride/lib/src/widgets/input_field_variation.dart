import 'package:flutter/material.dart';
import 'package:quickride/src/utils/text_style.dart' as text_style;
import 'package:quickride/src/widgets/input_field_variation.dart';
import 'package:quickride/src/utils/color_theme.dart' as color_theme;

class TextField extends StatefulWidget {
  final String label;
  final Icon? prefixIcon;
  final void Function(String)? onTextChanged;
  final String? helperText;

  const TextField(
      {required this.label,
      this.prefixIcon,
      this.onTextChanged,
      this.helperText,
      Key? key})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField> {
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 16)))),
      const SizedBox(height: 4),
      Text(
        widget.helperText ?? '',
        style: text_style.TextTheme.description(null)
            .copyWith(color: color_theme.ColorTheme.mainTheme.colorScheme.error),
      ),
    ]);
  }
}
