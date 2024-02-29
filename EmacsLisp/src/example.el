(require 'seq)

(defun my-string-to-int (s)
    (string-to-number s))

(defun my-string-to-double (s)
    (string-to-number s))

(defun my-int-to-string (i)
    (number-to-string i))

(defun my-double-to-string (d)
    (format "%.6f" d))

(defun my-bool-to-string (b)
    (if b "true" "false"))

(defun my-int-to-nullable (i)
    (if (> i 0) i
        (if (< i 0) (- i)
            nil)))

(defun my-nullable-to-int (i)
    (if i i -1))

(defun my-list-sorted (lst)
    (seq-sort #'string< lst))

(defun my-list-sorted-by-length (lst)
    (seq-sort-by #'seq-length #'< lst))

(defun my-list-filter (lst)
    (seq-filter (lambda (x) (= (% x 3) 0)) lst))

(defun my-list-map (lst)
    (seq-map (lambda (x) (* x x)) lst))

(defun my-list-reduce (lst)
    (seq-reduce (lambda (acc x) (+ (* acc 10) x)) lst 0))

(defun my-list-operations (lst)
    (seq-reduce (lambda (acc x) (+ (* acc 10) x)) 
        (seq-map (lambda (x) (* x x)) 
            (seq-filter (lambda (x) (= (% x 3) 0)) lst)) 0))

(defun my-list-to-dict (lst)
    (seq-map (lambda (x) (cons x (* x x))) lst))

(defun my-dict-to-list (lst)
    (seq-map (lambda (x) (+ (car x) (cdr x))) 
        (seq-sort-by #'cdr #'< lst)))

(defun my-print-string (s)
    (princ s)
    (princ "\n"))

(defun my-print-string-list (lst)
    (seq-doseq (x lst) 
        (princ (concat x " ")))
    (princ "\n"))

(defun my-print-int-list (lst)
    (my-print-string-list (seq-map (lambda (x) (my-int-to-string x)) lst)))

(defun my-print-dict (lst)
    (seq-doseq (x lst)
        (princ (concat (my-int-to-string (car x)) "->" (my-int-to-string (cdr x)) " ")))
    (princ "\n"))

(my-print-string "Hello, World!")
(my-print-string (my-int-to-string (my-string-to-int "123")))
(my-print-string (my-double-to-string (my-string-to-double "123.456")))
(my-print-string (my-bool-to-string nil))
(my-print-string (my-int-to-string (my-nullable-to-int (my-int-to-nullable 18))))
(my-print-string (my-int-to-string (my-nullable-to-int (my-int-to-nullable -15))))
(my-print-string (my-int-to-string (my-nullable-to-int (my-int-to-nullable 0))))
(my-print-string-list (my-list-sorted '("e" "dddd" "ccccc" "bb" "aaa")))
(my-print-string-list (my-list-sorted-by-length '("e" "dddd" "ccccc" "bb" "aaa")))
(my-print-string (my-int-to-string (my-list-reduce (my-list-map (my-list-filter '(3 12 5 8 9 15 7 17 21 11))))))
(my-print-string (my-int-to-string (my-list-operations '(3 12 5 8 9 15 7 17 21 11))))
(my-print-dict (my-list-to-dict '(3 1 4 2 5 9 8 6 7 0)))
(my-print-int-list (my-dict-to-list '((3 . 9) (1 . 1) (4 . 16) (2 . 4) (5 . 25) (9 . 81) (8 . 64) (6 . 36) (7 . 49) (0 . 0))))
