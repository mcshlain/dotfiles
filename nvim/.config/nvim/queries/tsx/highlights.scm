; extends

; Fix: jsx_opening_element (where attributes live) spans col 0 of attribute lines,
; unlike jsx_attribute which only starts at the first non-whitespace column.
; Setting bo.commentstring here ensures // is used when cursor is in leading whitespace.
((jsx_opening_element) @_x
  (#set! bo.commentstring "// %s"))
