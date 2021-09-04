(ns hello.core)

(defn factorial [x]
  (if (= x 0) 1
      (* x (factorial (- x 1)))))

(def first-name "Dave")

(str "I'm sorry " first-name)

(def ages [42 3 18])

(defn greetings [name] (str "hello Mr. " name))
