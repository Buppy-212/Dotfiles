local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
return {
  s(
    { trig = ";3pl", snippetType = "autosnippet" },
    fmt(
      [[
      \addplot3[{}]{{{}}};
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = ";plt", snippetType = "autosnippet" },
    fmt(
      [[
      \addplot[
      domain = {},
      samples = {},
      color = {},
      ]{{{}}};
      ]],
      { i(1), i(2), i(3), i(0) }
    )
  ),
  s(
    { trig = ";dra", snippetType = "autosnippet" },
    fmt(
      [[
      \draw [{}] ({}) {} ({}){};
      ]],
      { i(1), i(2), i(3), i(4), i(0) }
    )
  ),
  s(
    { trig = ";fil", snippetType = "autosnippet" },
    fmt(
      [[
      \filldraw [{}] ({}) {} ({}){};
      ]],
      { i(1), i(2), i(3), i(4), i(0) }
    )
  ),
  s(
    { trig = ";ax", snippetType = "autosnippet" },
    fmt(
      [[
      \begin{{axis}}[
        axis lines = {},
        xlabel = \({}\),
        ylabel = \({}\),
        ]
        {}
      \end{{axis}}
      ]],
      { c(1, { t("middle"), t("left") }), i(2), i(3), i(0) }
    )
  ),
  s(
    { trig = ";tikz", snippetType = "autosnippet" },
    fmt(
      [[
      \begin{{tikzpicture}}[thick,scale={}, every node/.style={{scale={}}}]
        {}
      \end{{tikzpicture}}
      ]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = ";nod", snippetType = "autosnippet" },
    fmt(
      [[
        node[anchor={}]{{{}}}
      ]],
      { c(1, { t("north"), t("south"), t("west"), t("east") }), i(0) }
    )
  ),
  s(
    { trig = ";tab", snippetType = "autosnippet" },
    fmt(
      [[
        \begin{{tabular}}{{|{}|}}
        \hline
            & \multicolumn{{{}}}{{|c|}}{{{}}} \\
            \hline
        \multirow{{{}}}{{12pt}}{{{}}} & {}
            \hline
        \end{{tabular}}
      ]],
      { i(1), i(2), i(3), i(4), i(5), i(0) }
    )
  ),
}
