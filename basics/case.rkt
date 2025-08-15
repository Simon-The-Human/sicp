#lang racket

(let ((v 0))
  (case v
    ((0) "zero")
    ((1) "one")
    ((2) "two")
    ((else) "many")))

(define (humanize-permission perm)
  (case perm
    (("x") "execute")
    (("w") "write")
    (("r") "read")))
