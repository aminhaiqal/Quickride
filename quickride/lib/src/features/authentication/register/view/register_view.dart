import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickride/src/utils/text_style.dart' as textStyle;
import 'package:quickride/src/widgets/image_retriever.dart';
import 'package:quickride/src/widgets/input_field_variation.dart' as textField;
import 'package:quickride/src/utils/color_theme.dart' as theme;
import 'package:quickride/src/widgets/action_button.dart' as actionButton;
import 'package:quickride/src/utils/firebase_repository.dart' as firebase;
import '../viewmodel/register_viewmodel.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);
  static String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<RegisterViewModel>(
            create: (_) => RegisterViewModel(),
            child: Consumer(builder: (context, viewModel, _) {
              return Center(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Column(
                        children: <Widget>[
                          
                        ],
                      )));
            })));
  }
}
