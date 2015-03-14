#$ ->
#  loadMathJax()
#  $(document).on 'page:load', loadMathJax
#
#loadMathJax = ->
#  window.MathJax = null
#  $.getScript "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=AM_HTMLorMML-full", ->
#    MathJax.Hub.Config
#      showMathMenu: false,
#      tex2jax:
#        inlineMath:
#          [['$','$'],['`','`']]
#        preview: 'none'
#      "HTML-CSS":
#        styles:
#          ".MathJax_Display":
#            display: "inline"
#
##MathJax.Hub.Config({
##  showProcessingMessages: false,
##});