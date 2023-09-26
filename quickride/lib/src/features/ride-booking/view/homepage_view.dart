import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickride/src/features/ride-booking/widgets/closest_driver.dart';
import '../viewmodel/booking_viewmodel.dart' show BookingViewModel;
import '../widgets/location_block.dart';
import 'package:quickride/src/utils/shared.dart' as shared;

import '../widgets/service_type.dart';

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
            Stack(
              children: [
                Container(
                    height: 157,
                    width: MediaQuery.of(context).size.width,
                    color: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.026, 1],
                      colors: [Color(0xFF222222), Color(0xFF121212)],
                    ).colors[0]),
                Padding(
                    padding: const EdgeInsets.only(top: 52.0),
                    child: Center(
                        child: Text('Quickride',
                            style: shared.TextTheme.headline2(null).copyWith(
                              color: shared
                                  .ColorTheme.mainTheme.colorScheme.surface,
                            )))),
                const LocationBlock(),
              ],
            ),
            const Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: ClosestDriver()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Column(
                children: [
                  Text('Services',
                  style: shared.TextTheme.body1(null).copyWith(
                    color: shared.ColorTheme.mainTheme.colorScheme.onSurface,
                  )),
                  const SizedBox(height: 16.0),
                  ServiceType()
                ]
              )
              )
          ],
        ))

            // Available Drivers
            );
      }),
    );
  }
}
