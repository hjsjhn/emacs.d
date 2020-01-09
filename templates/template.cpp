#include <bits/stdc++.h>

namespace IO {
    template <typename Tp> inline Tp input() {
        Tp x = 0, y = 1;
        char c = getchar();
        while ((c < '0' || '9' < c) && c != EOF) {
            if (c == '-')
                y = -1;
            c = getchar();
        }
        if (c == EOF)
            return 0;
        while ('0' <= c && c <= '9')
            x = x * 10 + c - '0', c = getchar();
        return x *= y;
    }
    template <typename Tp> inline void read(Tp &x) { x = input<Tp>(); }
}; // namespace IO
using namespace IO;

namespace modular {
    const int MOD = 1000000007;
    inline int add(int x, int y) { return (x += y) >= MOD ? x -= MOD : x; }
    inline void inc(int &x, int y) { (x += y) >= MOD ? x -= MOD : 0; }
    inline int mul(int x, int y) { return 1LL * x * y % MOD; }
    inline int qpow(int x, int y) {
        int ans = 1;
        for (; y; y >>= 1, x = mul(x, x))
            if (y & 1)
                ans = mul(ans, x);
        return ans;
    }
}; // namespace modular

#define reg register
#define FIN(s) freopen(s, "r", stdin)
#define FOUT(s) freopen(s, "w", stdout)
#define debug(...) fprintf(stderr, __VA_ARGS__)
#define rep(i, l, r) for (int i = l; i <= r; ++i)
#define lep(i, l, r) for (int i = l; i < r; ++i)
#define irep(i, r, l) for (int i = r; i >= l; --i)
#define ilep(i, r, l) for (int i = r; i > l; --i)
typedef long long ll;

int main() {
#ifdef LOCAL
#endif
    return 0;
}
