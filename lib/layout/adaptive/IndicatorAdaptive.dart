import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/layout/_cubit/Cubit.dart';

class IndicatorAdaptive extends StatelessWidget {

  final String os;
   const IndicatorAdaptive({super.key, required this.os});

  @override
  Widget build(BuildContext context) {

    if(os == 'android' || os == 'windows'){

      return CircularProgressIndicator(
        color: AppCubit.get(context).isDark ? HexColor('2eb7c9') : HexColor('0571d5'),
      );

    }else {

      return CupertinoActivityIndicator(
        color: AppCubit.get(context).isDark ? HexColor('2eb7c9') : HexColor('0571d5'),
      );

    }

  }
}
