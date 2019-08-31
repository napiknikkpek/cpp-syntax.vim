class Foo {};
struct Foo {};
class Foo;
class Foo : Bar {};
class Foo : public Bar {};
class Foo : public virtual Bar {};
class Foo : Bar, A1, A2 {};
class Foo : public Bar, public A1, public A2 {};
class Foo : Bar::A1, A1::A1, A2::A1 {};
class Foo : Bar<int>, A1::A2<A3>, A2<3> {};
class {
} foo;
