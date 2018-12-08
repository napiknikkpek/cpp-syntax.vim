class Test;
class Test {};
struct Test : Base {};
class Test : public A, private B, protected A::B::C {};
class Test {
  class Inner : public Base {};
};
