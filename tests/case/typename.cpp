template <typename T>
struct F;
template <typename B, typename = std::enable_if_t<std::is_base_of_v<B, D>>>
struct F;
typename X::A::asdf;
template <typename... Args>
void foo(Args&&... args) {
  fn(args...);
}
