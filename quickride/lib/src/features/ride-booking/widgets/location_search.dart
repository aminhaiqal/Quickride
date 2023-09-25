import 'package:flutter/material.dart';
import 'package:quickride/src/utils/shared.dart' as shared;

class LocationSearch extends StatelessWidget {
  const LocationSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Container(
            margin: const EdgeInsets.fromLTRB(24.0, 114.0, 24.0, 0.0),
            height: 228,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xFFFFFFFF),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  offset: Offset(0, 4),
                  blurRadius: 17,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Column(
                children: [
                  Container(
                    height: 48.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: const Color(0xFF6B737A),
                        width: 1.0,
                      ),
                      color: const Color(0xFFFFFFFF),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                            Icons.search,
                            color: Color(0xFF6B737A),
                          ),
                        Container(
                          width: 250,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Where to?',
                              hintStyle: shared.TextTheme.headline3(null)
                                  .copyWith(
                                      color: shared.GreyShader.greyAccent),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ])
      ],
    );
  }
}
