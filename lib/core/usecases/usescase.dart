abstract class Usescase<Type, Params> {
  Future<Type> call(Params params);
}
