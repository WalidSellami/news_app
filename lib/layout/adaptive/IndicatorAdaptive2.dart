import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/layout/_cubit/Cubit.dart';

class IndicatorAdaptive2 extends StatelessWidget {

  final String os;
  const IndicatorAdaptive2({super.key, required this.os});

  @override
  Widget build(BuildContext context) {

    if(os == 'android' || os == 'windows'){

      return SpinKitRing(
        color: AppCubit.get(context).isDark ? HexColor('2eb7c9') : HexColor('0571d5'),
        size: 30.0,
        lineWidth: 3.0,
      );

    } else {

      return SpinKitFadingCircle(
        color: AppCubit.get(context).isDark ? HexColor('2eb7c9') : HexColor('0571d5'),
        size: 30.0,
      );

    }
  }
}
