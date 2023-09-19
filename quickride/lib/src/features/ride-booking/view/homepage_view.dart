import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/booking_viewmodel.dart' show BookingViewModel;
import '../widgets/location_search.dart' show LocationSearch;

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
                LocationSearch(),
                // Closest Driver
                // Service Type
                // Available Drivers
              ],
            ),
          ),
        );
      }),
    );
  }
}
