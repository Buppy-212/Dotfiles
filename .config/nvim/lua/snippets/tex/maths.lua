local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
  s(
    { trig = ";eq", snippetType = "autosnippet" },
    fmt(
      [[
      \begin{{equation{}}}
        {}
      \end{{equation{}}}
      ]],
      {
        c(1, { t("*"), t("") }),
        i(0),
        rep(1),
      }
    )
  ),
  s(
    { trig = ";lab", snippetType = "autosnippet" },
    fmt(
      [[
      \label{{{}}}{}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = ";tag", snippetType = "autosnippet" },
    fmt(
      [[
      \tag{{{}}}{}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = ";al", snippetType = "autosnippet" },
    fmt(
      [[
      \begin{{align{}}}
        {}
      \end{{align{}}}
      ]],
      {
        c(1, { t("*"), t("") }),
        i(0),
        rep(1),
      }
    )
  ),
  s(
    { trig = ";fr", snippetType = "autosnippet" },
    fmt(
      [[
      \frac{{{}}}{{{}}}{}
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = ";sq", snippetType = "autosnippet" },
    fmt(
      [[
      \sqrt[{}]{{{}}}{}
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = ";lim", snippetType = "autosnippet" },
    fmt(
      [[
      \lim_{{{} \to {}}} {}
      ]],
      { i(1), c(2, { t("0"), t("\\infty"), t("-\\infty"), t("0^+"), t("0^-") }), i(0) }
    )
  ),
  s(
    { trig = ";sum", snippetType = "autosnippet" },
    fmt(
      [[
      \sum_{{{}}}^{{{}}} {}
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = ";int", snippetType = "autosnippet" },
    fmt(
      [[
      \int_{{{}}}^{{{}}} {} \, \mathrm{{d}}{} {}
      ]],
      { i(1), i(2), i(4), i(3), i(0) }
    )
  ),
  s(
    { trig = ";din", snippetType = "autosnippet" },
    fmt(
      [[
      \left[ {} \right]_{{{}}}^{{{}}} {}
      ]],
      { i(3), i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = ";der", snippetType = "autosnippet" },
    fmt(
      [[
      \frac{{\mathrm{{d}}{}}}{{\mathrm{{d}}{}}} {}
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = ";par", snippetType = "autosnippet" },
    fmt(
      [[
      \frac{{\partial{}}}{{\partial{}}} {}
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = ";beg", snippetType = "autosnippet" },
    fmt(
      [[
      \begin{{{}}}
        {}
      \end{{{}}}
      ]],
      {
        i(1),
        i(0),
        rep(1),
      }
    )
  ),
  s(
    { trig = ";mat", snippetType = "autosnippet" },
    fmt(
      [[
      \begin{{{}matrix}}
        {}
      \end{{{}matrix}}
      ]],
      { c(1, { t("p"), t("b"), t("v"), t("V"), t("B") }), i(0), rep(1) }
    )
  ),
  s(
    { trig = ";vec", snippetType = "autosnippet" },
    fmt(
      [[
      \mathbf{{{}}}{}
      ]],
      { i(1), i(2) }
    )
  ),
  s(
    { trig = ";vep", snippetType = "autosnippet" },
    fmt(
      [[
      \mathbf{{{}}}{} {} \mathbf{{{}}}{} {}
      ]],
      { i(1), i(2), c(3, { t("\\cdot"), t("\\times"), t("\\circ") }), i(4), i(5), i(0) }
    )
  ),
  s(
    { trig = ";ded", snippetType = "autosnippet" },
    fmt(
      [[
      \overset{{.{}}}{{{}}}{}
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = ";mod", snippetType = "autosnippet" },
    fmt(
      [[
      |{}|{}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = ";sub", snippetType = "autosnippet" },
    fmt(
      [[
      {}_{{{}}}{}
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = ";sup", snippetType = "autosnippet" },
    fmt(
      [[
      {}^{{{}}}{}
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = ";ise", snippetType = "autosnippet" },
    fmt(
      [[
      \{{ {} \}} {}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = ";set", snippetType = "autosnippet" },
    fmt(
      [[
       \left\{{ \begin{{matrix}}
        {}
       \end{{matrix}} \right.
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = ";map", snippetType = "autosnippet" },
    fmt(
      [[
        {} : {} \rightarrow {}
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = ";bra", snippetType = "autosnippet" },
    fmt(
      [[
        ( {} ){}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = ";coo", snippetType = "autosnippet" },
    fmt(
      [[
        \left( {} \right){}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = ";over", snippetType = "autosnippet" },
    fmt(
      [[
        \overline{{{}}}{}
      ]],
      { i(1), i(0) }
    )
  ),
}
