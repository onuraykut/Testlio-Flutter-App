import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:eslesmeapp/data/cozdugumTestler_repository.dart';
import 'package:eslesmeapp/data/test_repository.dart';
import 'package:eslesmeapp/model/room.dart';
import 'package:eslesmeapp/model/test.dart';
import 'bloc.dart';
import '../locator.dart';

class CozdugumTestlerBloc extends Bloc<TestTekEvent, TestState> {
  final CozdugumRepository _cozdugumRepository = locator<CozdugumRepository>();

  @override
  // TODO: implement initialState
  TestState get initialState => TestUninitialized();

  @override
  Stream<TestState> mapEventToState(
    TestTekEvent event,
  ) async* {
    yield TestLoading();
    if (event is FetchAllEvent) {
      try {
        List<Room> getirilenTest = await _cozdugumRepository.getCozdugumTestler();
        yield TestLoaded(rooms: getirilenTest);
      } catch (_) {
        yield TestError();
      }
    }
    else if (event is FetchTestFromIdEvent) {
      try {
        Room getirilenTest = await _cozdugumRepository.getTestFromId(event.testId);
        yield TestLoaded(room: getirilenTest);
      } catch (e) {
        print(e);
        yield TestError();
      }
    }
    else if (event is FetchGizlediklerimEvent) {
      try {
        List<Room> getirilenTest = await _cozdugumRepository.getGizlediklerimTestler();
        yield TestLoaded(rooms: getirilenTest);
      } catch (e) {
        print(e);
        yield TestError();
      }
    }

    else if (event is FetchSharedWithMeEvent) {
      try {
        List<Room> getirilenTest = await _cozdugumRepository.getSharedWithMeTestler();
        yield TestLoaded(rooms: getirilenTest);
      } catch (e) {
        print(e);
        yield TestError();
      }
    }
  }
}
