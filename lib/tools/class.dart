import 'package:eslesmeapp/pages/kategoriler.dart';


typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
//    register<GirisSayfasi>(() => GirisSayfasi());
    register<KategoriBolumu>(() => KategoriBolumu());

  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}