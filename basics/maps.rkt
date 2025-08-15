#lang racket

(define [maps
         funcs
         lists]
  (map map funcs lists))



(maps
 (list add1 positive?)
 (list (list 1 2)
       (list 3 4)))
