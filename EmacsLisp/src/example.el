(require 'seq)

(defun hello ()
  (message "Hello World!"))

(defun my-function (my-list)
    (seq-reduce (lambda (a b) (seq-concatenate 'string b a b))
        (seq-map (lambda (x) (number-to-string (* 3 x)))
            (seq-filter (lambda (x) (= 0 (mod x 2))) my-list))
        ""))

(hello)
(message (my-function '(1 2 3 4 5)))