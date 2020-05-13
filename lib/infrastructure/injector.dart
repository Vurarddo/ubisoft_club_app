class Injector {
  final Map<Type, dynamic> _singletonMap = {};

  void register<T>(T instance) {
    _singletonMap[T] = instance;
  }

  T get<T>() {
    return _singletonMap[T];
  }
}

final injector = Injector();
