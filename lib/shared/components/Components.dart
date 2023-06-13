import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news/layout/_cubit/Cubit.dart';
import 'package:news/layout/adaptive/IndicatorAdaptive.dart';
import 'package:news/layout/adaptive/IndicatorAdaptive2.dart';
import 'package:news/modules/web_view/WebView.dart';
import 'package:news/shared/components/Constants.dart';
import 'package:news/shared/cubit/Cubit.dart';

Widget buildIArticleItem(article, context , index) => Container(
  color: ((NewsCubit.get(context).selectItem == index) && (NewsCubit.get(context).isDesktop)) ? ((AppCubit.get(context).isDark) ? Colors.grey.shade800.withOpacity(.6) :  Colors.grey.shade200): null,
      child: InkWell(
        onTap: () {
          (NewsCubit.get(context).isDesktop) ? NewsCubit.get(context).selectListItem(index) :
          Navigator.push(context, MaterialPageRoute(builder: (context)=> WebViewScreen(url: article['url'])));
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                              color: AppCubit.get(context).isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          width: 120.0,
                          height: 120.0,
                          child: Center(child: IndicatorAdaptive2(os: os)));
                    }
                  },
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) {
                    return child;
                  },
                  '${article['urlToImage']}',
                  width: 120.0,
                  height: 120.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 14.0,
              ),
              Expanded(
                child: SizedBox(
                  height: 120.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text(
                          '${article['title']}',
                          style: const TextStyle(
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                            height: 1.3,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '${article['publishedAt']}',
                        style: TextStyle(
                          letterSpacing: 0.5,
                          color: AppCubit.get(context).isDark
                              ? Colors.grey.shade300
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget buildIArticleDetailItem(articleItem, context) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.network(
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: AppCubit.get(context).isDark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  width: double.infinity,
                  height: 300.0,
                  child: Center(child: IndicatorAdaptive2(os: os)));
            }
          },
          frameBuilder:
              (context, child, frame, wasSynchronouslyLoaded) {
            return child;
          },
          '${articleItem['urlToImage']}',
          width: double.infinity,
          height: 300.0,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(
        height: 14.0,
      ),
      Text(
        '${articleItem['title']}',
        style: const TextStyle(
          fontSize: 19.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
          height: 1.3,
        ),
      ),
      const SizedBox(
        height: 8.0,
      ),
      Text(
        '${articleItem['publishedAt']}',
        style: TextStyle(
          letterSpacing: 0.5,
          color: AppCubit.get(context).isDark
              ? Colors.grey.shade300
              : Colors.grey,
        ),
      ),
      const SizedBox(
        height: 14.0,
      ),
      Text(
        '${articleItem['description']}',
        style: const TextStyle(
          fontSize: 19.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
          height: 1.3,
        ),

      ),
      const SizedBox(
        height: 14.0,
      ),
      Text(
        '${articleItem['content']}',
        style: const TextStyle(
          fontSize: 19.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
          height: 1.3,
        ),

      ),
    ],
  ),
);

Widget articleBuilder(list) => ConditionalBuilder(
     condition: list.length > 0,
     builder: (context) =>  NewsCubit.get(context).hasInternet ? ListView.separated(
         physics: const BouncingScrollPhysics(),
         itemBuilder: (context, index) =>
             buildIArticleItem(list[index], context , index),
         separatorBuilder: (context, index) => Padding(
           padding: const EdgeInsets.symmetric(
             horizontal: 20.0,
           ),
           child: Divider(
             color: Colors.grey.shade400,
             thickness: 1,
           ),
         ),
         itemCount: list.length)
         : const Center(
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
       children: [
           Text(
             'No Internet',
             style: TextStyle(
               fontSize: 17.0,
               fontWeight: FontWeight.bold,
             ),
           ),
           SizedBox(
             width: 6.0,
           ),
           Icon(
             Icons.signal_wifi_connected_no_internet_4_rounded,
           ),
       ],
     ),
         ),
     fallback: (context) =>  NewsCubit.get(context).hasInternet ? Center(child: IndicatorAdaptive(os: os))  : const Center(
       child: Center(
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text(
               'No Internet',
               style: TextStyle(
                 fontSize: 17.0,
                 fontWeight: FontWeight.bold,
               ),
             ),
             SizedBox(
               width: 6.0,
             ),
             Icon(
               Icons.signal_wifi_connected_no_internet_4_rounded,
             ),
           ],
         ),
       ),
     ),
);


Widget articleDetailBuilder(list) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => (NewsCubit.get(context).hasInternet)
          ? buildIArticleDetailItem(list , context)
          : const Center(
              child: Row(
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
      fallback: (context) => Center(
        child: (NewsCubit.get(context).hasInternet)
            ? IndicatorAdaptive(
                os: os,
              )
            : const Center(
                child: Row(
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
    );
