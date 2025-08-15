#lang racket

(let ((a 2))
  (cond
    ((positive? a) "pos")
    ((zero? a) "zero")
    ((negative? a) "neg")))

(define (programmer-level lvl)
  (cond
    ((< lvl 10) "junior")
    ((> lvl 20) "senior")
    (else "middle")))

(define (do-today day)
  (case day
    ((1 2 3 4 5) "work")
    ((6 7) "rest")
    (else "???")))
