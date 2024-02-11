(defn hello []
  (println "Hello World!"))

(defn my-function [my-list]
  (->> my-list
       (filter #(= 0 (mod % 2)))
       (map #(str (* 3 %)))
       (reduce #(str %2 %1 %2) "")))

(hello)
(println (my-function [1 2 3 4 5]))