
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/business/BusinessScreen.dart';
import 'package:news/modules/sciences/SciencesScreen.dart';
import 'package:news/modules/sports/SportsScreen.dart';
import 'package:news/shared/cubit/States.dart';
import 'package:news/shared/network/remot/DioHelper.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';


class NewsCubit extends Cubit<NewsStates> {

  NewsCubit() : super(InitialNewsState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int index = 0;

  // mobile
  final List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Business'),
     BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'Sciences'),
  ];

  final List<Widget> screens = [
    const Business(),
    const Sports(),
    const Sciences(),
  ];

  final List<String> titles = [
    'Business News US',
    'Sports News US',
    'Sciences News US',
  ];


  // desktop
  final List<NavigationRailDestination> railItems =  const [
     NavigationRailDestination(
         icon: Icon(
           Icons.business,
         ),
         label: Text('Business')),
     NavigationRailDestination(
         icon: Icon(
           Icons.sports,
         ),
         label: Text('Sports')),
     NavigationRailDestination(
         icon: Icon(
           Icons.science,
         ),
         label: Text('Sciences')),

  ];

  final List<Widget> desktopScreens = [
    const Business(),
    const Sports(),
    const Sciences(),
  ];

  final List<String> desktopTitles = [
    'Business News US',
    'Sports News US',
    'Sciences News US',
  ];


  void changeNavBar(int index){
    this.index = index;
    emit(BottomNavNewsState());
  }


  List<dynamic> business = [];
  // List<int> selectedBusinessItemList = [];
  int selectItem = 0;
  List<dynamic> sports = [];
  List<dynamic> sciences = [];

  void getBusiness() {
    emit(NewsBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country' : 'us',
        'category' : 'business',
        'apiKey' : '71d7335d3b63441dbdca2a8f46dab15f',
      },
    ).asStream().listen((value) {
      business = [];
      business = value?.data['articles'];
      // for (var element in business) {
      //   selectedBusinessItem.add(false);
      // }
      emit(NewsGetBusinessState());
    });
  }


  void selectListItem(int index) {

    selectItem = index;

    // for (int i = 0 ; i < selectedBusinessItem.length ; i++) {
    //
    //   if(i == index) {
    //     selectedBusinessItem[i] = true;
    //   }else {
    //     selectedBusinessItem[i] = false;
    //   }
    // }

    emit(SelectBusinessItem());
  }

  void getSports(){
    emit(NewsSportsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country' : 'us',
        'category' : 'sports',
        'apiKey' : '71d7335d3b63441dbdca2a8f46dab15f',
      },
    ).asStream().listen((value)  {
      sports = [];
      sports = value?.data['articles'];
      // print(sports[0]['title']);
      emit(NewsGetSportsState());
    });
  }

  void getSciences(){
    emit(NewsSciencesLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country' : 'us',
        'category' : 'science',
        'apiKey' : '71d7335d3b63441dbdca2a8f46dab15f',
      },
    ).asStream().listen((value) {
      sciences = [];
      sciences = value?.data['articles'];
      emit(NewsGetSciencesState());
    });
  }

  List<dynamic> search = [];

  void getSearch(value){
    emit(NewsSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q' : '$value',
        'apiKey' : '71d7335d3b63441dbdca2a8f46dab15f',
      },
    ).then((value) {
      search = value?.data['articles'];
      emit(NewsGetSearchState());
    }).catchError((error){
      if (kDebugMode) {
        print(error.toString());
      }
      emit(NewsGetSearchErrorState());
    });
  }

  var searchCnt = TextEditingController();

   changesOnField(){
     emit(ChangeField());
  }

  void listener(){
     searchCnt.addListener(changesOnField);
  }

  void delete(){
     searchCnt.text = '';
     search = [];
     emit(DeleteSearch());
  }

  bool hasInternet = false;

  void checkConnection() async{
     InternetConnectionChecker().onStatusChange.listen((status) {
       final hasInternet = status == InternetConnectionStatus.connected;
       this.hasInternet = hasInternet;
       hasInternet ? showSimpleNotification(
        const Text(
          'You are connected with internet',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
         background: Colors.teal,
       ) : showSimpleNotification(
         const Text(
           'You are not connected with internet',
           style: TextStyle(
             fontSize: 18.0,
             color: Colors.white,
             fontWeight: FontWeight.bold,
           ),
         ),
         background: Colors.red,
       );
       if(hasInternet){
         getBusiness();
         getSports();
         getSciences();
       }
       emit(CheckConnection());
     });
  }

  bool isDesktop = false;

  void desktop(bool value){
    isDesktop = value;
    emit(DesktopState());
  }

}
