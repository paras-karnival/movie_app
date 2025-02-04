import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/config/dependency_injection/di.dart';
import 'package:movie_app/core/utils/shared_prefs_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginRequestEvent>((event, emit) async {
      try {
        emit(LoadingLoginState());
        await Future.delayed(Duration(seconds: 3));
        di<SharedPreferences>().setBool(SharedPrefsKeys.isAuthenticated, true);
        emit(LoadedLoginState(statusCode: 200));
      } catch (e) {
        emit(ErrorLoginState(error: e.toString()));
      }
    });
  }
}
