local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
  s(
    { trig = "eq" },
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
    { trig = "lab" },
    fmt(
      [[
      \label{{{}}}{}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = "tag" },
    fmt(
      [[
      \tag{{{}}}{}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = "al" },
    fmt(
      [[
      \begin{{align*}}
        {}
      \end{{align*}}
      ]],
      {
        i(0),
      }
    )
  ),
  s(
    { trig = "fr" },
    fmt(
      [[
      \frac{{{}}}{{{}}}{}
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = "sq" },
    fmt(
      [[
      \sqrt{{{}}}{}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = "root" },
    fmt(
      [[
      \sqrt[{}]{{{}}}{}
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = "lim" },
    fmt(
      [[
      \lim_{{{} \to {}}} {}
      ]],
      { i(1), c(2, { t("0"), t("\\infty"), t("-\\infty"), t("0^+"), t("0^-") }), i(0) }
    )
  ),
  s(
    { trig = "sum" },
    fmt(
      [[
      \sum_{{{}}}^{{{}}} {}
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = "int" },
    fmt(
      [[
      \int_{{{}}}^{{{}}} {} \, \mathrm{{d}}{} {}
      ]],
      { i(1), i(2), i(4), i(3), i(0) }
    )
  ),
  s(
    { trig = "oint" },
    fmt(
      [[
      \oint_{{{}}} {} \, \mathrm{{d}}{} {}
      ]],
      { i(1), i(3), i(2), i(0) }
    )
  ),
  s(
    { trig = "iint" },
    fmt(
      [[
      \iint_{{{}}} {} \, \mathrm{{d}}{} {}
      ]],
      { i(1), i(3), i(2), i(0) }
    )
  ),
  s(
    { trig = "dint" },
    fmt(
      [[
      \left[ {} \right]_{{{}}}^{{{}}} {}
      ]],
      { i(3), i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = "der" },
    fmt(
      [[
      \frac{{\mathrm{{d}}{}}}{{\mathrm{{d}}{}}} {}
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = "par" },
    fmt(
      [[
      \frac{{\partial{}}}{{\partial{}}} {}
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = "beg" },
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
    { trig = "mat" },
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
    { trig = "vec" },
    fmt(
      [[
      \mathbf{{{}}}{}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = "vecf" },
    fmt(
      [[
      \mathbf{{{}}}(\mathbf{{{}}}){}
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = "dder" },
    fmt(
      [[
      \overset{{.{}}}{{{}}}{}
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = "mod" },
    fmt(
      [[
      \left\vert {} \right\vert{}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = "norm" },
    fmt(
      [[
      \left\Vert {} \right\Vert{}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = "sub" },
    fmt(
      [[
      {}_{{{}}}{}
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = "sup" },
    fmt(
      [[
      {}^{{{}}}{}
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = "iset" },
    fmt(
      [[
      \{{ {} \}} {}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = "set" },
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
    { trig = "map" },
    fmt(
      [[
        {} : {} \rightarrow {}
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = "bra" },
    fmt(
      [[
        ( {} ){}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = "coor" },
    fmt(
      [[
        \left( {} \right){}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = "over" },
    fmt(
      [[
        \overline{{{}}}{}
      ]],
      { i(1), i(0) }
    )
  ),
}
