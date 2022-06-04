extension IterableExtension<T> on Iterable<T> {
  ///Returns a new lazy Iterable with elements and its index.
  Iterable<E> mapWithIndex<E>(E Function(int index, T value) f) =>
      Iterable.generate(length).map((e) => f(e, elementAt(e)));
}
