local is_ok, ls = pcall(require, "luasnip")
if not is_ok then
    print("Luasnip was not loaded or installed")
    return {}
end
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
    s("cpp", {
        t({ "#include <bits/stdc++.h>", "" }),
        t({ "typedef long long ll;", "" }),
        t({ "using namespace std;", "" }),
        t({ "", "" }),
        t({ "const int N = " }),
        i(1, "0"),
        t({ ";", "" }),
        t({ "", "int main() {", "" }),
        t({ "    ios_base::sync_with_stdio(false);", "" }),
        t({ "    cin.tie(NULL);", "" }),
        t({ "", "    " }),
        i(0, "// Your code"),
        t({ "", "" }),
        t({ "", "" }),
        t({ "    return 0;" }),
        t({ "", "}" }),
    }),
})
