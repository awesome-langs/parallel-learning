(defun hello ()
    (format t "Hello World!~%"))

(defun my-function (my-list)
    (reduce (lambda (a b) (concatenate 'string b a b ))
        (mapcar (lambda (x) (write-to-string (* 3 x)))
            (remove-if-not (lambda (x) (= 0 (mod x 2))) my-list))            
        :initial-value ""))

(hello)
(format t (my-function '(1 2 3 4 5)))