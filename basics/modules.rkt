#lang racket
(provide all-defined-out)

(define
  (sum-of-squares a b)
  (let ((square
         (lambda (n)
           (* n n))))
       (+ (square a)
          (square b))))

(displayln (sum-of-squares 3 5))

(define (square-of-sum a b)
  (let ((sum (+ a b)))
    (* sum sum)))
