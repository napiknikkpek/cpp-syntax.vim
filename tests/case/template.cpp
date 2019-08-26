foo->template get<int>();
Foo<int> f;
Foo<Bar> f;
Foo<3> f;
foo::Bar<int> f;
foo::Bar<A1> f;
foo::Bar<3> f;
foo<Bar, int, 3, N>(x, 3, N);
asdf::foo<Bar, int, 3, N>(x, 3, N);
