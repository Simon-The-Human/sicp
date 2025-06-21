#lang racket

(define
  square
  (lambda
    (n)
    (* n n)))

(define
  cube
  (lambda
    (n)
    (* n n n)))

(define
  arithmetic-mean
  ((lambda
     (a b)
     (/ (+ a b) 2))
   2
   4))

(define
  (sum-of-squares n m)
  (+
   (* n n)
   (* m m)))
