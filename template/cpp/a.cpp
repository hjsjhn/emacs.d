#include <cstdio>
#include <iostream>
#include <algorithm>
#include <cmath>
#include <cstring>

#define reg register

template <typename T> inline void read (T& x) {
    x = 0;
    reg T y = 1;
    reg char c = getchar();
    while (c < '0' || '9' < c) {
        if (c == '-') y = -1;
        c = getchar();
    }
    while ('0' <= c && c <= '9') x = x * 10 + c - '0', c = getchar();
    x *= y;
}

int main () {
    return 0;
}

