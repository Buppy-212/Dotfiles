local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  s(
    { trig = "mo", dscr = "Create a LaTeX equation block" },
    fmt(
      [[
      $$
      {}
      $$
      ]],
      i(1)
    )
  ),
  s(
    { trig = "ma", dscr = "Create LaTeX inline" },
    fmt(
      [[
      ${}$
      ]],
      i(1)
    )
  ),
  s(
    { trig = "fr", dscr = "Fraction" },
    fmt(
      [[
      \frac{{{}}}{{{}}}
      ]],
      { i(1), i(2) }
    )
  ),
  s(
    { trig = "beg", dscr = "Begin LaTeX block" },
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
    { trig = "plt3", dscr = "Tikz 3D Plot" },
    fmt(
      [[
      \addplot3[{}]{{{}}};
      ]],
      {
        i(1),
        i(2),
      }
    )
  ),
  s(
    { trig = "plt", dscr = "Tikz 2D Plot" },
    fmt(
      [[
      \addplot[{}]{{{}}};
      ]],
      {
        i(1),
        i(2),
      }
    )
  ),
  s(
    { trig = "draw", dscr = "Tikz draw" },
    fmt(
      [[
      \draw [{}] ({}) {} ({}){};
      ]],
      { i(1), i(2), i(3), i(4), i(5) }
    )
  ),
  s(
    { trig = "fill", dscr = "Tikz filldraw" },
    fmt(
      [[
      \filldraw [{}] ({}) {} ({}){};
      ]],
      { i(1), i(2), i(3), i(4), i(5) }
    )
  ),
}
