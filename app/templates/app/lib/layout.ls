html = '<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>{title}</title>
    <style>
      html, body, #application {
        height: 100%;
      }
    </style>
  <body>
    {body}
  </body>
</html>
'

title = (title-str) ->
  if title-str then "Reflex Demo | #{title-str}" else "Reflex Demo"

module.exports =
  title: title
  layout: (context) ->
    html.replace '{body}', context.body .replace '{title}', context.title
