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


-- jsp snippet
ls.add_snippets("jsp", {
  s("jsp", {
    t({
      "<%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\" pageEncoding=\"UTF-8\"%>",
      "<!DOCTYPE html>",
      "<html lang='en'>",
      "<head>",
      "\t<meta charset='UTF-8'>",
      "\t<meta name='viewport' content='width=device-width, initial-scale=1.0'>",
      "\t<title>Snippet Code</title>",
      "</head>",
      "<body>",
      "\t<h1>Hello world</h>",
      "</body>",
      "</html>"
    })
  }),
})

--servlet snippet
ls.add_snippets("java", {
    s("servlet", {
        t({
            "package org.harshit;",
            "",
            "import java.io.IOException;",
            "import jakarta.servlet.ServletException;",
            "import jakarta.servlet.annotation.WebServlet;",
            "import jakarta.servlet.http.HttpServlet;",
            "import jakarta.servlet.http.HttpServletRequest;",
            "import jakarta.servlet.http.HttpServletResponse;",
            "",
            "@WebServlet(name = , urlPatterns = {})",
            "public class Test extends HttpServlet {",
            "\tprotected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {",
            "\t}",
            "}",
        })
    })

})

--java snippet
ls.add_snippets("java", {
    s("spring", {
        t({
            "package org.harshit;",
            "",
            "public class Test extends HttpServlet {",
            "}",
        })
    })

})

