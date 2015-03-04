$ ->
  loadMathJax()
  $(document).on 'page:load', loadMathJax

loadMathJax = ->
  window.MathJax = null
  $.getScript "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_HTMLorMML", ->
    MathJax.Hub.Config
      showMathMenu: true,
      "HTML-CSS":
        styles:
          ".MathJax_Display": 
            display: "inline"