import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickride/src/utils/shared.dart' as shared;
import '../viewmodel/booking_viewmodel.dart' show BookingViewModel;

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  static String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookingViewModel>(
      create: (_) => BookingViewModel(),
      child: Consumer<BookingViewModel>(builder: (context, viewModel, _) {
        return SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                
              ],
            ),
          ),
        );
      }),
    );
  }
}
