import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/_cubit/States.dart';
import 'package:news/shared/network/local/CacheHelper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeMode({bool? fromShared}) {
    if(fromShared != null) {
      isDark = fromShared;
    }else {
      isDark = !isDark;
      CacheHelper.putBolleen(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeMode());
      });
    }
  }
}
