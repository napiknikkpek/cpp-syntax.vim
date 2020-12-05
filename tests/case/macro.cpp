#pragma once
#include <string>
# define MY_MACRO_1(x) x+1
#define MY_MACRO(name)                             \
  struct name {                                    \
    const char* operator() const { return #name; } \
  };
auto x = MY_MACRO_1(3);
MY_MACRO(Name)
const int N = 200000;
NONE
