(define (my-string-to-int s)
    (string->number s))

(define (my-string-to-double s)
    (string->number s))

(define (my-int-to-string i)
    (number->string i))

(define (my-double-to-string d)
    (number->string d))

(define (my-bool-to-string b)
    (if b "true" "false"))

(define (my-int-to-nullable i)
    (cond ((> i 0) i)
          ((< i 0) (- i))
          (else #f)))

(define (my-nullable-to-int i)
    (if i i -1))

(define (my-list-sorted lst)
    (sort lst string<?))

(define (my-list-sorted-by-length lst)
    (sort lst (lambda (a b) (< (string-length a) (string-length b)))))

(define (my-list-filter lst)
    (filter (lambda (x) (= (remainder x 3) 0)) lst))

(define (my-list-map lst)
    (map (lambda (x) (* x x)) lst))

(define (my-list-reduce lst)
    (fold-left (lambda (acc x) (+ (* acc 10) x)) 0 lst))

(define (my-list-operations lst)
    (let* ((x lst)
        (x (filter (lambda (x) (= (remainder x 3) 0)) x))
        (x (map (lambda (x) (* x x)) x))
        (x (fold-left (lambda (acc x) (+ (* acc 10) x)) 0 x)))
    x))
    
(define (my-list-to-dict lst)
    (alist->hash-table (map (lambda (x) (cons x (* x x))) lst)))

(define (my-dict-to-list dict)
    (map (lambda (x) (+ (car x) (cdr x))) (sort (hash-table->alist dict) (lambda (a b) (< (car a) (car b))))))

(define (my-print-string s)
    (display s)
    (newline))

(define (my-print-string-list lst)
    (for-each (lambda (x) (display (string-append x " "))) lst)
    (newline))

(define (my-print-int-list lst)
    (my-print-string-list (map my-int-to-string lst)))

(define (my-print-dict dict)
    (for-each (lambda (x) 
        (display (string-append (my-int-to-string (car x)) "->" (my-int-to-string (cdr x)) " "))) 
        (hash-table->alist dict))
    (newline))

(my-print-string "Hello, World!")
(my-print-string (my-int-to-string (my-string-to-int "123")))
(my-print-string (my-double-to-string (my-string-to-double "123.456")))
(my-print-string (my-bool-to-string #f))
(my-print-string (my-int-to-string (my-nullable-to-int (my-int-to-nullable 18))))
(my-print-string (my-int-to-string (my-nullable-to-int (my-int-to-nullable -15))))
(my-print-string (my-int-to-string (my-nullable-to-int (my-int-to-nullable 0))))
(my-print-string-list (my-list-sorted '("e" "dddd" "ccccc" "bb" "aaa")))
(my-print-string-list (my-list-sorted-by-length '("e" "dddd" "ccccc" "bb" "aaa")))
(my-print-string (my-int-to-string (my-list-reduce (my-list-map (my-list-filter '(3 12 5 8 9 15 7 17 21 11))))))
(my-print-string (my-int-to-string (my-list-operations '(3 12 5 8 9 15 7 17 21 11))))
(my-print-dict (my-list-to-dict '(3 1 4 2 5 9 8 6 7 0)))
(my-print-int-list (my-dict-to-list (alist->hash-table '((3 . 9) (1 . 1) (4 . 16) (2 . 4) (5 . 25) (9 . 81) (8 . 64) (6 . 36) (7 . 49) (0 . 0)))))