import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/_cubit/Cubit.dart';
import 'package:news/modules/search/SearchScreen.dart';
import 'package:news/shared/cubit/Cubit.dart';
import 'package:news/shared/cubit/States.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
        listener: (context , state){},
        builder: (context , state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
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
                    horizontal: 6.0,
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
            body: cubit.screens[cubit.index],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItems,
              currentIndex: cubit.index,
              onTap: (index){
                cubit.changeNavBar(index);
              },
            ),
          );
        },
    );
  }
}
