#lang racket

(define (say-boom say)
  (when (equal? say "go")
    "Boom!"))
