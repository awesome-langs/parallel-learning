#lang racket
(define (hello)
    (displayln "Hello World!"))

(define (my-function myList)
    (foldl (lambda (y x) (string-append y x y))
        ""
        (map (lambda (x) (number->string (* x 3)))
            (filter (lambda (x) (= (modulo x 2) 0)) myList))))

(hello)
(displayln (my-function '(1 2 3 4 5)))