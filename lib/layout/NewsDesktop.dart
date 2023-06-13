import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/layout/_cubit/Cubit.dart';
import 'package:news/layout/_cubit/States.dart';
import 'package:news/modules/search/SearchScreen.dart';
import 'package:news/shared/cubit/Cubit.dart';
import 'package:news/shared/cubit/States.dart';

class NewsDesktop extends StatelessWidget {
  const NewsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context , state){},
      builder: (context , state){
         return BlocConsumer<NewsCubit , NewsStates>(
           listener: (context , state) {},
           builder: (context , state) {
             var cubit = NewsCubit.get(context);
             return Scaffold(
               appBar: AppBar(
                 backgroundColor: AppCubit.get(context).isDark ? HexColor('181818') : Colors.white,
                 elevation: 3,
                 title: Text(
                   cubit.titles[cubit.index],
                 ),
                 actions: [
                   IconButton(
                     onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> Search()));
                     },
                     icon: const Icon(
                       Icons.search,
                       size: 27.0,
                     ),
                     tooltip: 'Search',
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(
                       horizontal: 20.0,
                     ),
                     child: CircleAvatar(
                       radius: 22.0,
                       backgroundColor: AppCubit.get(context).isDark ? Colors.grey.shade800.withOpacity(.7) : Colors.grey.shade200,
                       child: IconButton(
                         onPressed: (){
                           AppCubit.get(context).changeMode();
                         },
                         icon: AppCubit.get(context).isDark ? const Icon(
                           Icons.light_mode_rounded,
                           color: Colors.white,
                         ) : Icon(
                           Icons.dark_mode,
                           color: Colors.grey.shade900,
                         ),
                         tooltip: 'Dark Mode',
                       ),
                     ),
                   ),
                 ],
               ),
               body: Row(
                 children: [
                   NavigationRail(
                     destinations: cubit.railItems,
                     selectedIndex: cubit.index,
                     onDestinationSelected: (index) {
                       cubit.changeNavBar(index);
                     },
                   ),
                   Expanded(child: cubit.desktopScreens[cubit.index]),
                 ],
               ),
             );
           },
         );
      },
    );
  }
}
