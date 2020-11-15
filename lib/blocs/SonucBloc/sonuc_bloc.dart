import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:eslesmeapp/data/sonuc_repository.dart';
import 'package:eslesmeapp/model/cozenler.dart';
import 'package:eslesmeapp/model/user.dart';
import 'package:flutter/material.dart';
import 'bloc.dart';
import '../locator.dart';

class SonucBloc extends Bloc<SonucEvent, SonucState> {
  final SonucRepository sonucRepository = locator<SonucRepository>();

  @override
  // TODO: implement initialState
  SonucState get initialState => SonucUninitialized();

  @override
  Stream<SonucState> mapEventToState(
      SonucEvent event,
  ) async* {
    if (event is FetchSonucEvent) {
      yield SonucLoading();
      try {
        List<Cozenler>  cozenler = await sonucRepository.getTestResultByRoom(event.roomId);
        yield SonucLoaded(cozenler: cozenler);
      } catch (_) {
        debugPrint(_.toString());
        yield SonucError();
      }
    }
  }
}
