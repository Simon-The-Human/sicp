#lang racket

(define (increment-numbers lst)
  (map add1
   (filter number? lst)))
