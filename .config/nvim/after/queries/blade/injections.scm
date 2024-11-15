; Injects html/php into the document.
((text) @injection.content
    (#not-has-ancestor? @injection.content "envoy")
    (#set! injection.combined)
    (#set! injection.language php))

; Handles top-level directives, such as ``{{ $foo->bar() }}``.
((php_only) @injection.content
   (#set! injection.language php_only))

; Handles inline directives, such as `@extends`.
((parameter) @injection.content
   (#set! injection.language php_only))

; Handles Laravel Envoy directives, such as `@task`.
((text) @injection.content
   (#has-ancestor? @injection.content "envoy")
   (#set! injection.combined)
   (#set! injection.language bash))
