import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/_cubit/Cubit.dart';
import 'package:news/shared/components/Components.dart';
import 'package:news/shared/cubit/Cubit.dart';
import 'package:news/shared/cubit/States.dart';

class Search extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context , state){},
      builder: (context , state){
        var list = NewsCubit.get(context).search;
         return Scaffold(
           body: SafeArea(
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(14.0),
                   child: TextFormField(
                     controller: NewsCubit.get(context).searchCnt,
                     keyboardType: TextInputType.text,
                     style: TextStyle(
                       color: AppCubit.get(context).isDark ? Colors.white : Colors.grey.shade900,
                       fontSize: 17.0,
                     ),
                     onChanged: (value){
                       NewsCubit.get(context).getSearch(value);
                     },
                     decoration: InputDecoration(
                       hintText: 'Type...',
                       hintStyle: TextStyle(
                         color: AppCubit.get(context).isDark ? Colors.grey.shade400 : Colors.grey.shade700,
                       ),
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(30.0),
                         borderSide: BorderSide(
                           color: Colors.grey.shade600,
                           width: 1.0,
                         ),
                       ),
                       focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(30.0),
                         borderSide: BorderSide(
                           color:  AppCubit.get(context).isDark ? Colors.grey.shade400 : Colors.grey.shade800,
                           width: 1.0,
                         ),
                       ),
                       disabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(30.0),
                         borderSide: BorderSide(
                           color: Colors.grey.shade600,
                           width: 1.0,
                         ),
                       ),
                       prefixIcon: Padding(
                         padding: const EdgeInsets.only(
                           right: 6.0,
                         ),
                         child: IconButton(
                           onPressed: (){
                             Navigator.pop(context);
                           },
                           icon: Icon(Icons.arrow_back_ios_new_rounded,
                           color: AppCubit.get(context).isDark ? Colors.white : Colors.grey.shade900,
                             size: 25.0,
                         ),
                           tooltip: 'Back',
                         ),
                       ),
                       suffixIcon: (NewsCubit.get(context).searchCnt.text.isNotEmpty) ? IconButton(
                          onPressed: (){
                            NewsCubit.get(context).delete();
                          },
                          icon: Icon(
                            Icons.close,
                         color: AppCubit.get(context).isDark ? Colors.white : Colors.grey.shade900,
                         size: 25.0,
                       ),
                         tooltip: 'Close',
                       ) : null,
                     ),
                   ),
                 ),
                 Expanded(
                   child: NewsCubit.get(context).hasInternet ? ListView.separated(
                         physics: const BouncingScrollPhysics(),
                         itemBuilder: (context , index) => buildIArticleItem(list[index] , context , index),
                         separatorBuilder: (context , index) => Padding(
                           padding: const EdgeInsets.symmetric(
                             horizontal: 20.0,
                           ),
                           child: Divider(
                             color: Colors.grey.shade400,
                             thickness: 1,
                           ),
                         ),
                         itemCount: list.length) :  const Center(child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(
                         'No Internet',
                         style: TextStyle(
                           fontSize: 20.0,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       SizedBox(
                         width: 8.0,
                       ),
                       Icon(
                         Icons.signal_wifi_connected_no_internet_4_outlined,
                       ),
                     ],
                   ),
                   ),
                  ),
               ],
             ),
           ),
         );
      },
    );
  }
}
