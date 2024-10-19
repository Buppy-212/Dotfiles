local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
  s(
    { trig = "sect" },
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
    { trig = "pre" },
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
      \newtheorem{{notation}}[theorem]{{Notation}}
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
    { trig = "subpre" },
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
    { trig = "enum" },
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
    { trig = "item" },
    fmt(
      [[
      \item{{}}
            {}
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = "def" },
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
    { trig = "not" },
    fmt(
      [[
      \begin{{notation}}
        {}
      \end{{notation}}
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = "rem" },
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
    { trig = "prop" },
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
    { trig = "lem" },
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
    { trig = "the" },
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
    { trig = "cor" },
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
    { trig = "ex" },
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
    { trig = "prf" },
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
    { trig = "bb" },
    fmt(
      [[
      \mathbb{{{}}}{}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = "expect" },
    fmt(
      [[
      \mathbb{{E}}({}) {}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = "prob" },
    fmt(
      [[
      \mathbb{{P}}({}) {}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = "re" },
    fmt(
      [[
      \mathbb{{R}} {}
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = "rn" },
    fmt(
      [[
      \mathbb{{R}}^n {}
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = "r2" },
    fmt(
      [[
      \mathbb{{R}}^2 {}
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = "r3" },
    fmt(
      [[
      \mathbb{{R}}^3 {}
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = "rm" },
    fmt(
      [[
      \mathrm{{{}}}{}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = "rmd" },
    fmt(
      [[
      \mathrm{{d}}{} 
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = "var" },
    fmt(
      [[
      \mathrm{{var}}({}) {} 
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = "cov" },
    fmt(
      [[
      \mathrm{{cov}}({}) {} 
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = "ca" },
    fmt(
      [[
      \mathcal{{{}}}{}
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = "c1" },
    fmt(
      [[
      \mathcal{{C}}^1 {}
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = "c2" },
    fmt(
      [[
      \mathcal{{C}}^2 {}
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = "cn" },
    fmt(
      [[
      \mathcal{{C}}^n {}
      ]],
      { i(0) }
    )
  ),
  s(
    { trig = "ma" },
    fmt(
      [[
      \( {} \) {}
      ]],
      { i(1), i(0) }
    )
  ),
}
