(insert "#include <cstdio>\n")
(insert "#include <iostream>\n")
(insert "#include <algorithm>\n")
(insert "#include <cmath>\n")
(insert "#include <cstring>\n")
(insert "\n")
(insert "#define reg register\n")
(insert "typedef long long ll;\n")
(insert "\n")
(insert "template <typename _T> inline void read (_T& x) {\n")
(insert "    x = 0;\n")
(insert "    reg _T y = 1;\n")
(insert "    reg char c = getchar();\n")
(insert "    while (c < '0' || '9' < c) {\n")
(insert "        if (c == '-') y = -1;\n")
(insert "        c = getchar();\n")
(insert "    }\n")
(insert "    while ('0' <= c && c <= '9') x = x * 10 + c - '0', c = getchar();\n")
(insert "    x *= y;\n")
(insert "}\n")
(insert "\n")
(insert "int main () {\n")
(insert "    return 0;\n")
(insert "}\n")