abstract class NewsStates {}

class InitialNewsState extends NewsStates {}

class BottomNavNewsState extends NewsStates {}


// Business
class NewsBusinessLoadingState extends NewsStates {}

class NewsGetBusinessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  final String? error;
  NewsGetBusinessErrorState({this.error});
}

class SelectBusinessItem extends NewsStates {}


// Sports
class NewsSportsLoadingState extends NewsStates {}

class NewsGetSportsState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  final String? error;
  NewsGetSportsErrorState({this.error});
}


// Sciences
class NewsSciencesLoadingState extends NewsStates {}

class NewsGetSciencesState extends NewsStates {}

class NewsGetSciencesErrorState extends NewsStates {
  final String? error;
  NewsGetSciencesErrorState({this.error});
}



class NewsSearchLoadingState extends NewsStates {}

class NewsGetSearchState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {
  final String? error;
  NewsGetSearchErrorState({this.error});
}

class ChangeField extends NewsStates {}

class DeleteSearch extends NewsStates {}

class CheckConnection extends NewsStates {}

class DesktopState extends NewsStates {}


