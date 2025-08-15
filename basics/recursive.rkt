#lang racket

(define (skip n lst)
 (if
  (or
   (empty? lst)
   (<= n 0))
  lst
  (skip
   (- n 1)
   (rest lst))))
