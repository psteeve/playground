(ns hello.core)

(defn factorial [x]
  (if (= x 0) 1
      (* x (factorial (- x 1)))))
