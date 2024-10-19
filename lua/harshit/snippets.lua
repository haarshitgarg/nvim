-- File: ~/.config/nvim/snippets/html.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node


-- HTML snippet
ls.add_snippets("html", {
  s("html5", {
    t({
      "<!DOCTYPE html>",
      "<html lang='en'>",
      "<head>",
      "  <meta charset='UTF-8'>",
      "  <meta name='viewport' content='width=device-width, initial-scale=1.0'>",
      "  <title>Snippet Code</title>",
      "</head>",
      "<body>",
      "  <h1>Hello world</h>",
      "</body>",
      "</html>"
    })
  }),
})

