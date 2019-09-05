foo->template get<int>();
Foo<int> f;
Foo<Bar> f;
Foo<3> f;
foo::Bar<int> f;
foo::Bar<A1> f;
foo::Bar<3> f;
foo<Bar, int, 3, N>(x, 3, N);
foo::bar<Bar, int, 3, N>(x, 3, N);
foo<T, bar<X>, bar<X, Y>> a;
foo<T, bar<X>, bar<X, Y>>();
foo<T, decltype(a > b), T>();
foo<decltype(a + bar<T>{} - zoo<bar<T>>{})>();

std::function<void(argument1&, const argument2&, decltype(a 
      > b), const argument4&)> updated;

template <typename T, int N, typename... Args>
void foo();
