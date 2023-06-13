import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/NewsApp.dart';
import 'package:news/layout/NewsDesktop.dart';
import 'package:news/layout/_cubit/Cubit.dart';
import 'package:news/layout/_cubit/States.dart';
import 'package:news/shared/cubit/Cubit.dart';
import 'package:news/shared/network/local/CacheHelper.dart';
import 'package:news/shared/network/remot/DioHelper.dart';
import 'package:news/shared/styles/styles.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if(Platform.isWindows){

    await DesktopWindow.setMinWindowSize(const Size(650, 650));

  }

  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(800, 600),
    center: true,
    // backgroundColor: Colors.transparent,
    skipTaskbar: false,
    // titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  DioHelper.init();
  await CacheHelper.init();


  bool? isDark = CacheHelper.getBolleen(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {

    final bool? isDark;

    const MyApp(this.isDark, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (BuildContext context) => NewsCubit()..getBusiness()..getSports()..getSciences()..listener()..checkConnection()),
        BlocProvider(
        create: (BuildContext context) => AppCubit()..changeMode(
            fromShared: isDark ?? false,
    )),
      ],
        child: BlocConsumer<AppCubit , AppStates>(
          listener: (context , state) {},
          builder: (context , state) {
            return OverlaySupport.global(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
                home: ScreenTypeLayout.builder(
                     mobile: (context) => Builder(
                       builder: (context) {
                         NewsCubit.get(context).desktop(false);
                         return const News();
                       }
                     ),
                     desktop: (context) => Builder(
                       builder: (context) {
                         NewsCubit.get(context).desktop(true);
                         return const NewsDesktop();
                       }
                     ),
                  breakpoints: const ScreenBreakpoints(
                      desktop: 700.0,
                      tablet: 450.0,
                      watch: 100.0),
                ),
              ),
            );
          },

        ),
    );
  }
}

