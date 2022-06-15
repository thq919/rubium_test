import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubium_test/core/db/db_provider.dart';
import 'package:rubium_test/features/screens/auth_screen/controller/login_events.dart';
import 'package:rubium_test/features/screens/auth_screen/controller/login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  DBProvider db;

  LoginBloc(this.db) : super(InitialLoginState()) {
    on<LoginInitialEvent>(((event, emit) {
      
    }));
  }
}
