import 'package:equatable/equatable.dart';

abstract class TestTekEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPopulerEvent extends TestTekEvent {}

class FetchKategoriEvent extends TestTekEvent {
  String kategori;
  FetchKategoriEvent(this.kategori);
}

class FetchSonucEvent extends TestTekEvent {}

class FetchKesfetEvent extends TestTekEvent {}

class FetchTestFromIdEvent extends TestTekEvent {
  String testId;

  FetchTestFromIdEvent(this.testId);
}

class FetchCozdugumTestEvent extends TestTekEvent {
  int page;

  FetchCozdugumTestEvent(this.page);
}
class FetchTestlerimEvent extends TestTekEvent {
}