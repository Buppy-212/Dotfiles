local ls = require("luasnip")
local t = ls.text_node
local i = ls.insert_node
local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt
local postfix = require("luasnip.extras.postfix").postfix
local l = require("luasnip.extras").lambda

return {
  postfix({ trig = ";;", snippetType = "autosnippet" }, { l("\\" .. l.POSTFIX_MATCH .. "") }),
  postfix(
    { trig = ";o", snippetType = "autosnippet" },
    { l("\\overset{" .. l.POSTFIX_MATCH .. "}{"), i(1), t("}"), i(0) }
  ),
  postfix({ trig = ";b", snippetType = "autosnippet" }, { l("\\bar{" .. l.POSTFIX_MATCH .. "}"), i(0) }),
  postfix({ trig = ";h", snippetType = "autosnippet" }, { l("\\hat{" .. l.POSTFIX_MATCH .. "}"), i(0) }),
  postfix({ trig = ";c", snippetType = "autosnippet" }, { l("\\" .. l.POSTFIX_MATCH .. "{"), i(1), t("}"), i(0) }),
  postfix({ trig = ";s", snippetType = "autosnippet" }, { l("" .. l.POSTFIX_MATCH .. "_{"), i(1), t("}"), i(0) }),
  postfix({ trig = ";e", snippetType = "autosnippet" }, { l("" .. l.POSTFIX_MATCH .. "^{"), i(1), t("}"), i(0) }),
  postfix(
    { trig = "//", snippetType = "autosnippet" },
    { l("\\frac{" .. l.POSTFIX_MATCH .. "}{"), i(1), t("}"), i(0) }
  ),
  s(
    "meta",
    fmt(
      [[
    ---
    title: "{}"
    author: Will
    date: today
    date-format: Do MMM YYYY
    engine: knitr
    toc: TRUE
    number-sections: TRUE
    number-depth: 3
    theme:
      light: cosmo
      dark: superhero
    crossref:
      fig-title: Figure
      tbl-title: Table
      fig-prefix: Figure
      tbl-prefix: Table
      eq-prefix: Eq
    ---
    {}
  ]],
      { i(1), i(0) }
    )
  ),
  s(
    "ma",
    fmt(
      [[
  ${}$
  ]],
      { i(0) }
    )
  ),
  s(
    "eq",
    fmt(
      [[
  $$
    {} 
  $$
  ]],
      { i(0) }
    )
  ),
  s(
    "fr",
    fmt(
      [[
      \frac{<>}{<>}<>
  ]],
      { i(1), i(2), i(0) },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = ";e", snippetType = "autosnippet" },
    fmt(
      [[
      ^{<>}<>
    ]],
      { i(1), i(0) },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = ";s", snippetType = "autosnippet" },
    fmt(
      [[
      _{<>}<>
    ]],
      { i(1), i(0) },
      { delimiters = "<>" }
    )
  ),
}
