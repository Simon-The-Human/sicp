#lang racket

(define (same-parity? a b)
  (or
    (and (even? a)
         (even? b))
    (and (odd? a)
         (odd? b))))

(define (sentence-type text)
  (let ((upper-text (string-upcase text)))
    (if (equal?
         text
         upper-text)
        "cry"
        "common")))
