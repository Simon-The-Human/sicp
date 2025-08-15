#lang racket

(define user-ages
  (list (cons "Tom" 31)
        (cons "Alice" 22)
        (cons "Bob" 42)))

(define (lookup name names)
 (let* [(same-key?
         (lambda
           (ref-name)
           (equal? name (car ref-name))))
        (found-pairs (filter same-key? names))]
   (if
    (empty? found-pairs)
    #f
    (first found-pairs))))


(displayln (lookup "Tom" user-ages))
