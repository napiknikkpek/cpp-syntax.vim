(int)a;
(const int)a;
(int&)a;
(int&&)a;
(int const*)a;
(int const&)a;
(int const* const) a;
(A) a;
(const A) a;
(A&)a;
(A&&)a;
(A const*)a;
(A const&)a;
(A const* const) a;
(A) foo(a);
(A) A::a;
(A)(a + b);
(A) + a;
A<decltype(foo((A)a))> a;
A<decltype(foo((int)a))> a;