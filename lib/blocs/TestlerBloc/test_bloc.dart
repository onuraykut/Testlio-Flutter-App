import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:eslesmeapp/data/test_repository.dart';
import 'package:eslesmeapp/model/test.dart';
import 'bloc.dart';
import '../locator.dart';

class TestlerBloc extends Bloc<TestTekEvent, TestState> {
  final TestRepository testRepository = locator<TestRepository>();

  @override
  // TODO: implement initialState
  TestState get initialState => TestUninitialized();

  @override
  Stream<TestState> mapEventToState(
    TestTekEvent event,
  ) async* {
    yield TestLoading();
    if (event is FetchPopulerEvent) {
      try {
        List<Test> getirilenTest = await testRepository.getPopulerTest();
        yield TestLoaded(Tests: getirilenTest);
      } catch (_) {
        yield TestError();
      }
    } else if (event is FetchKategoriEvent) {
      try {
        List<Test> getirilenTest = await testRepository.getTestsFromKategori(event.kategori);
        yield TestLoaded(Tests: getirilenTest);
      } catch (_) {
        yield TestError();
      }
    }
    else if (event is FetchSonucEvent) {
      try {
        List<Test> getirilenTest = testRepository.getSonucTestler("uid");
        yield TestLoaded(Tests: getirilenTest);
      } catch (_) {
        yield TestError();
      }
    }
    else if (event is FetchKesfetEvent) {
      try {
        List<Test> getirilenTest = testRepository.getKesfetTestler();
        yield TestLoaded(Tests: getirilenTest);
      } catch (_) {
        yield TestError();
      }
    }
    else if (event is FetchTestFromIdEvent) {
      try {
        Test getirilenTest = await testRepository.getTestFromId(event.testId);
        yield TestLoaded(test: getirilenTest);
      } catch (e) {
        print(e);
        yield TestError();
      }
    }
    else if (event is FetchCozdugumTestEvent) {
      try {
        List<Test> getirilenTest = await testRepository.getCozdugumTestler(event.page);
        yield TestLoaded(Tests: getirilenTest);
      } catch (e) {
        print(e);
        yield TestError();
      }
    }
  }
}
