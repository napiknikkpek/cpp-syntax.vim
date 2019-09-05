class Foo {};
struct Foo {};
class Foo;
class Foo : Bar {};
class Foo : public Bar {};
class Foo : public virtual Bar {};
class Foo : Bar, A1, A2 {};
class Foo : public Bar, public A1, public A2 {};
class Foo : Bar::A1<decltype(foo{} + bar{})>, A1::A1, A2::A1 {};
class Foo : Bar<int, decltype(a > b)>, A1::A2<A3>, A2<3> {};
class {
} foo;
enum class Foo { A, B, C };
struct B final : A {
  void foo() override;
};
class ::ns::Base::X {};
class ns::Base<int>::X {};
class Base<T>::X {};
