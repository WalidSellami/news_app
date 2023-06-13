
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/_cubit/Cubit.dart';
import 'package:news/layout/_cubit/States.dart';
import 'package:news/shared/components/Components.dart';
import 'package:news/shared/cubit/Cubit.dart';
import 'package:news/shared/cubit/States.dart';
import 'package:responsive_builder/responsive_builder.dart';


class Business extends StatelessWidget {
  const Business({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        NewsCubit.get(context).getBusiness();
        return BlocConsumer<AppCubit , AppStates>(
          listener: (context , state){},
          builder: (context , state){
            return BlocConsumer<NewsCubit, NewsStates>(
              listener: (context, state) {},
              builder: (context, state) {
                var list = NewsCubit.get(context).business;
                var indexItem = NewsCubit.get(context).selectItem;
                return ScreenTypeLayout.builder(
                    mobile: (context) => articleBuilder(list),
                    desktop: (context) => Row(
                      children: [
                        Expanded(child: articleBuilder(list)),
                        if(list.isNotEmpty)
                          (MediaQuery.of(context).size.width.toInt() >= 700 && MediaQuery.of(context).size.height.toInt() >= 700) ?
                           Expanded(
                          child: Container(
                            color: AppCubit.get(context).isDark ? Colors.grey.shade800.withOpacity(.6) : Colors.grey.shade200,
                            child: articleDetailBuilder(list[indexItem]),
                          ),
                        ) :  Expanded(
                            child: SingleChildScrollView(
                              child: Container(
                                color: AppCubit.get(context).isDark ? Colors.grey.shade800.withOpacity(.6) : Colors.grey.shade200,
                                child: articleDetailBuilder(list[indexItem]),
                              ),
                            ),
                          ),
                      ],
                    ),
                    breakpoints: const ScreenBreakpoints(
                      desktop: 700.0,
                      tablet: 450.0,
                      watch: 100.0),
                );
              },
            );
          },
        );
      }
    );
  }
}
