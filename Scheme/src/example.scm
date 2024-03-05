(define (hello)
    (display "Hello World!")
    (newline))

(define (my-function myList)
    (fold-left (lambda (x y) (string-append y x y))
        ""
        (map (lambda (x) (number->string (* x 3)))
            (filter (lambda (x) (= (modulo x 2) 0)) myList))))

(hello)
(display (my-function '(1 2 3 4 5)))
(newline)