int a;
int & a;
int const & a;
const int a;
const int & a;

auto a;
auto & a;
auto const & a;
const auto & a;
auto && a;
auto & [a, b] = pair;
auto && [a, b] = pair;
const auto & [a, b] = pair;

Foo f;
Foo* f;
Foo *f;
Foo * f;
Foo const * const f;
Foo * const f;
const Foo f;
const Foo* f;
const Foo * const f;

Foo& f;
Foo &f;
Foo & f;
Foo const & f;

Foo&& f;
Foo &&f;
Foo && f;
Foo const && f;

Foo{};
Foo{1, 2};

const std::vector<int>::iterator it;

A<const T> a;

Foo foo{};
std::vector<int> foo{};

ranges::range auto X;

return Foo{};
