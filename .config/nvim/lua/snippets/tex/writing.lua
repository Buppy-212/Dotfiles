local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
  s(
    { trig = ";sec", snippetType = "autosnippet" },
    fmt(
      [[
      \{}section{{{}}}
      {}
      ]],
      {
        c(1, { t(""), t("sub"), t("subsub") }),
        i(2),
        i(0),
      }
    )
  ),
  s(
    { trig = ";pre", snippetType = "autosnippet" },
    fmt(
      [[
      \documentclass[12pt]{{article}}
      \usepackage{{amsmath,amsfonts,amsthm}}
      \usepackage{{tikz,pgfplots,graphicx,multirow}}
      \usepackage[shortlabels]{{enumitem}}
      \usepackage[en-GB]{{datetime2}}
      \usepackage{{subfiles}}
      
      \usetikzlibrary{{positioning}}
      \pgfplotsset{{compat=1.18}}
      
      \newtheorem{{theorem}}{{Theorem}}[subsection]
      \newtheorem{{corollary}}[theorem]{{Corollary}}
      \newtheorem{{lemma}}[theorem]{{Lemma}}
      \newtheorem{{proposition}}[theorem]{{Proposition}}
      \theoremstyle{{remark}}
      \newtheorem*{{remark}}{{Remark}}
      \theoremstyle{{definition}}
      \newtheorem{{definition}}[theorem]{{Definition}}
      \newtheorem{{example}}[theorem]{{Example}}

      \title{{{}}}
      \author{{William Hughes}}
      \date{{{}}}

      \begin{{document}}
      
      \maketitle

      {}

      \end{{document}}
      ]],
      { i(1), c(2, { t(""), t("\\today") }), i(0) }
    )
  ),
  s(
    { trig = ";spr", snippetType = "autosnippet" },
    fmt(
      [[
      \documentclass[../main.tex]{{subfiles}}

      \begin{{document}}
        {}
      \end{{document}}
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = ";enum", snippetType = "autosnippet" },
    fmt(
      [[
      \begin{{enumerate}}[start={},label={{\bfseries (\{}*)}},leftmargin={}in]
        \item{{}}
              {}
      \end{{enumerate}}
      ]],
      { i(1), c(2, { t("arabic"), t("alph"), t("roman"), t("Alph"), t("Roman") }), c(3, { t("0"), t("0.3") }), i(0) }
    )
  ),
  s(
    { trig = ";ite", snippetType = "autosnippet" },
    fmt(
      [[
      \item{{}}
            {}
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = ";def", snippetType = "autosnippet" },
    fmt(
      [[
      \begin{{definition}}
        {}
      \end{{definition}}
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = ";rem", snippetType = "autosnippet" },
    fmt(
      [[
      \begin{{remark}}
        {}
      \end{{remark}}
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = ";pro", snippetType = "autosnippet" },
    fmt(
      [[
      \begin{{proposition}}
        {}
      \end{{proposition}}
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = ";lem", snippetType = "autosnippet" },
    fmt(
      [[
      \begin{{lemma}}
        {}
      \end{{lemma}}
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = ";the", snippetType = "autosnippet" },
    fmt(
      [[
      \begin{{theorem}}
        {}
      \end{{theorem}}
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = ";cor", snippetType = "autosnippet" },
    fmt(
      [[
      \begin{{corollary}}
        {}
      \end{{corollary}}
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = ";ex", snippetType = "autosnippet" },
    fmt(
      [[
      \begin{{example}}
        {}
      \end{{example}}
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = ";prf", snippetType = "autosnippet" },
    fmt(
      [[
      \begin{{proof}}
        {}
      \end{{proof}}
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = ";mbb", snippetType = "autosnippet" },
    fmt(
      [[
      \mathbb{{{}}}{}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = ";mrm", snippetType = "autosnippet" },
    fmt(
      [[
      \mathrm{{{}}}{}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = ";mca", snippetType = "autosnippet" },
    fmt(
      [[
      \mathcal{{{}}}{}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = ";mai", snippetType = "autosnippet" },
    fmt(
      [[
      \( {} \) {}
      ]],
      { i(1), i(0) }
    )
  ),
}
