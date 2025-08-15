#lang racket

(list 1 2 3 4)

(define (triple arg)
  (list arg arg arg))

(displayln
 ((lambda
   (x)
   (list x x x))
  "a"))
