import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rubium_test/features/data/datasource/person_source.dart';
import 'package:rubium_test/features/data/model/getrandom_model.dart';
import 'package:rubium_test/features/data/model/model_attr/identity_model.dart';
import 'package:rubium_test/features/screens/_controller/screen_states.dart';
import 'package:rubium_test/features/screens/_controller/screens_events.dart';

class ScreensBlock extends Bloc<ScreensEvent, ScreensState> {
  final PersonRemoteSource source;
  late GetRandomUserModel model;
  /////
  bool isLogined = false;
  late String? login;

  ///

  ScreensBlock(this.source) : super(InitialState()) {
    on<InitialEvent>((event, emit) {
      if (isLogined) () => add(LoginCompleteEvent(login!));
    });
    on<LoginCompleteEvent>(((event, emit) async {
      emit(LoadingState());
      isLogined == true;
      login = event.login;
      model = await source.getResultCount(100);
      emit(LoadedState(model, event.login));
    }));
    on<ReloadEvent>(((event, emit) async {
      emit(LoadingState());
      model = await source.getResultCount(100);
      emit(LoadedState(model, login!));
    }));
    on<RenewScreenEvent>((((event, emit) {
      emit(LoadedState(model, login!));
    })));
    on<DropLoginEvent>(((event, emit) {
      isLogined = false;
      login = null;
      add(InitialEvent());
    }));
    on<SortEvent>(((event, emit) {
      emit(LoadingState());
      List<Identity> prefferedValueList = List.empty(growable: true);
      List<Identity> unprefferedValueList = List.empty(growable: true);
      for (var element in model.results) {
        element.name.first
                    .toLowerCase()
                    .contains(event.sortQuery.toLowerCase()) ||
                element.name.last
                    .toLowerCase()
                    .contains(event.sortQuery.toLowerCase())
            ? prefferedValueList.add(element)
            : unprefferedValueList.add(element);
      }
      List<Identity> finalList = [
        ...prefferedValueList,
        ...unprefferedValueList
      ];
      emit(LoadedState(GetRandomUserModel(finalList, model.info), login!));
    }));
    on<ItemNeedToShowDescribeEvent>(((event, emit) {
      emit(DescribeItemState(event.entity));
    }));
  }
}
