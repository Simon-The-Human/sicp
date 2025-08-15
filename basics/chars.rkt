#lang racket

(define (next-char ch)
  (integer->char
   (add1
    (char->integer ch))))

(define (prev-char ch)
  (integer->char
   (sub1
    (char->integer ch))))

(define (next-chars str)
  (let [(next-char
         (lambda
           (c)
           (integer->char
            (add1
             (char->integer c)))))]
   (list->string
    (map
     next-char
     (string->list str)))))
