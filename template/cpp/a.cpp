#include <cstdio>
#include <iostream>
#include <algorithm>
#include <cmath>
#include <cstring>

#define reg register
typedef long long ll;

template <typename _T>
inline bool read (_T& x) {
    x = 0;
    _T y = 1;
    char c = getchar();
    while ((c < '0' || '9' < c) && c != EOF) {
        if (c == '-') y = -1;
        c = getchar();
    }
    if (c == EOF) return false;
    while ('0' <= c && c <= '9') x = x * 10 + c - '0', c = getchar();
    x *= y;
    return true;
}

int main () {
    return 0;
}
