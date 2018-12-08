template <typename A, int M, A N>
class A;
template <template <typename, std::size_t, int> class Key, typename T>
class A;
template <typename... Xs, A... I, int... N>
class A;
template <>
struct A<int, N, index<i...>, index<int...>> {};
template <>
A foo()
template <>
A::B foo()
template <>
A<B> foo()
