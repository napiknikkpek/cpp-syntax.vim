Foo<T>::foo;
Foo<A, int, 3>::foo<A, int, 3, decltype(a), typename T::type>();
bucket<typename T::type>::foo();
bucket<(a > b)>::foo;
bucket<(a < b)>::foo;
bucket<decltype(a), int, decltype(hash(std::declval<T>(3)))>::foo();
bucket<typename decltype(a)::type>::foo();
