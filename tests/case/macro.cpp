#include <asdf>
# define MY_MACRO_1(x) x+1
#define MY_MACRO(name)                             \
  struct name {                                    \
    const char* operator() const { return #name; } \
  };
auto x = MY_MACRO_1(3);
MY_MACRO(Name)
